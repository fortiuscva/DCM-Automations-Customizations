codeunit 52104 "THK Sales Archive Management"
{
    var DeferralUtilities: Codeunit "Deferral Utilities";
    RecordLinkManagement: Codeunit "Record Link Management";
    ReleaseSalesDoc: Codeunit "Release Sales Document";
    Text001: Label 'Document %1 has been archived.';
    Text002: Label 'Do you want to Restore %1 %2 Version %3?';
    Text003: Label '%1 %2 has been restored.';
    Text004: Label 'Document restored from Version %1.';
    Text005: Label '%1 %2 has been partly posted.\Restore not possible.';
    Text006: Label 'Entries exist for on or more of the following:\  - %1\  - %2\  - %3.\Restoration of document will delete these entries.\Continue with restore?';
    Text007: Label 'Archive %1 no.: %2?';
    Text008: Label 'Item Tracking Line';
    RecordFound: Boolean;
    procedure RestoreSalesDocument(var SalesHeaderArchive: Record "Sales Header Archive")
    var
        SalesHeader: Record "Sales Header";
        SalesShptHeader: Record "Sales Shipment Header";
        SalesInvHeader: Record "Sales Invoice Header";
        ReservEntry: Record "Reservation Entry";
        ItemChargeAssgntSales: Record "Item Charge Assignment (Sales)";
        ConfirmManagement: Codeunit "Confirm Management";
        ArchiveMgt: Codeunit ArchiveManagement;
        ConfirmRequired: Boolean;
        RestoreDocument: Boolean;
        OldOpportunityNo: Code[20];
        IsHandled: Boolean;
        DoCheck, SkipDeletingLinks: Boolean;
    begin
        //OnBeforeRestoreSalesDocument(SalesHeaderArchive, IsHandled);
        //if IsHandled then
        //  exit;
        //if not SalesHeader.Get(SalesHeaderArchive."Document Type", SalesHeaderArchive."No.") then
        //Error(Text009, SalesHeaderArchive."Document Type", SalesHeaderArchive."No.");
        RecordFound:=SalesHeader.Get(SalesHeaderArchive."Document Type", SalesHeaderArchive."No.");
        if RecordFound then SalesHeader.TestField(Status, SalesHeader.Status::Open);
        DoCheck:=true;
        //OnBeforeCheckIfDocumentIsPartiallyPosted(SalesHeaderArchive, DoCheck);
        if(SalesHeader."Document Type" = SalesHeader."Document Type"::Order) and DoCheck then begin
            SalesShptHeader.Reset();
            SalesShptHeader.SetCurrentKey("Order No.");
            SalesShptHeader.SetRange("Order No.", SalesHeader."No.");
            if not SalesShptHeader.IsEmpty()then Error(Text005, SalesHeader."Document Type", SalesHeader."No.");
            SalesInvHeader.Reset();
            SalesInvHeader.SetCurrentKey("Order No.");
            SalesInvHeader.SetRange("Order No.", SalesHeader."No.");
            if not SalesInvHeader.IsEmpty()then Error(Text005, SalesHeader."Document Type", SalesHeader."No.");
        end;
        ConfirmRequired:=false;
        ReservEntry.Reset();
        ReservEntry.SetCurrentKey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype");
        ReservEntry.SetRange("Source ID", SalesHeader."No.");
        ReservEntry.SetRange("Source Type", DATABASE::"Sales Line");
        ReservEntry.SetRange("Source Subtype", SalesHeader."Document Type");
        if ReservEntry.FindFirst()then ConfirmRequired:=true;
        ItemChargeAssgntSales.Reset();
        ItemChargeAssgntSales.SetRange("Document Type", SalesHeader."Document Type");
        ItemChargeAssgntSales.SetRange("Document No.", SalesHeader."No.");
        if ItemChargeAssgntSales.FindFirst()then ConfirmRequired:=true;
        RestoreDocument:=false;
        if ConfirmRequired then begin
            if ConfirmManagement.GetResponseOrDefault(StrSubstNo(Text006, ReservEntry.TableCaption(), ItemChargeAssgntSales.TableCaption(), Text008), true)then RestoreDocument:=true;
        end
        else if ConfirmManagement.GetResponseOrDefault(StrSubstNo(Text002, SalesHeaderArchive."Document Type", SalesHeaderArchive."No.", SalesHeaderArchive."Version No."), true)then RestoreDocument:=true;
        if RestoreDocument then begin
            if RecordFound then begin
                SalesHeader.TestField("Doc. No. Occurrence", SalesHeaderArchive."Doc. No. Occurrence");
                SalesHeaderArchive.CalcFields("Work Description");
                if SalesHeader."Opportunity No." <> '' then begin
                    OldOpportunityNo:=SalesHeader."Opportunity No.";
                    SalesHeader."Opportunity No.":='';
                end;
                SkipDeletingLinks:=false;
                //OnRestoreDocumentOnBeforeDeleteSalesHeader(SalesHeader, SkipDeletingLinks);
                if not SkipDeletingLinks then SalesHeader.DeleteLinks();
                SalesHeader.Delete(true);
            //OnRestoreDocumentOnAfterDeleteSalesHeader(SalesHeader);
            end;
            SalesHeader.Init();
            SalesHeader.SetHideValidationDialog(true);
            SalesHeader."Document Type":=SalesHeaderArchive."Document Type";
            SalesHeader."No.":=SalesHeaderArchive."No.";
            //OnBeforeSalesHeaderInsert(SalesHeader, SalesHeaderArchive);
            SalesHeader.Insert(true);
            //OnRestoreSalesDocumentOnAfterSalesHeaderInsert(SalesHeader, SalesHeaderArchive);
            SalesHeader.TransferFields(SalesHeaderArchive);
            SalesHeader.Status:=SalesHeader.Status::Open;
            //OnRestoreSalesDocumentOnBeforeSalesHeaderValidateFields(SalesHeader, SalesHeaderArchive);
            if SalesHeaderArchive."Sell-to Contact No." <> '' then SalesHeader.Validate("Sell-to Contact No.", SalesHeaderArchive."Sell-to Contact No.")
            else
                SalesHeader.Validate("Sell-to Customer No.", SalesHeaderArchive."Sell-to Customer No.");
            if SalesHeaderArchive."Bill-to Contact No." <> '' then SalesHeader.Validate("Bill-to Contact No.", SalesHeaderArchive."Bill-to Contact No.")
            else
                SalesHeader.Validate("Bill-to Customer No.", SalesHeaderArchive."Bill-to Customer No.");
            SalesHeader.Validate("Salesperson Code", SalesHeaderArchive."Salesperson Code");
            SalesHeader.Validate("Payment Terms Code", SalesHeaderArchive."Payment Terms Code");
            SalesHeader.Validate("Payment Discount %", SalesHeaderArchive."Payment Discount %");
            SalesHeader."Shortcut Dimension 1 Code":=SalesHeaderArchive."Shortcut Dimension 1 Code";
            SalesHeader."Shortcut Dimension 2 Code":=SalesHeaderArchive."Shortcut Dimension 2 Code";
            SalesHeader."Dimension Set ID":=SalesHeaderArchive."Dimension Set ID";
            RecordLinkManagement.CopyLinks(SalesHeaderArchive, SalesHeader);
            SalesHeader.LinkSalesDocWithOpportunity(OldOpportunityNo);
            //OnAfterTransferFromArchToSalesHeader(SalesHeader, SalesHeaderArchive);
            SalesHeader.Modify(true);
            RestoreSalesLines(SalesHeaderArchive, SalesHeader);
            SalesHeader.Status:=SalesHeader.Status::Released;
            ReleaseSalesDoc.Reopen(SalesHeader);
            //OnAfterRestoreSalesDocument(SalesHeader, SalesHeaderArchive);
            Message(Text003, SalesHeader."Document Type", SalesHeader."No.");
        end;
    end;
    local procedure RestoreSalesLines(var SalesHeaderArchive: Record "Sales Header Archive"; SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        SalesLineArchive: Record "Sales Line Archive";
        ShouldValidateQuantity: Boolean;
    begin
        RestoreSalesLineComments(SalesHeaderArchive, SalesHeader);
        SalesLineArchive.SetRange("Document Type", SalesHeaderArchive."Document Type");
        SalesLineArchive.SetRange("Document No.", SalesHeaderArchive."No.");
        SalesLineArchive.SetRange("Doc. No. Occurrence", SalesHeaderArchive."Doc. No. Occurrence");
        SalesLineArchive.SetRange("Version No.", SalesHeaderArchive."Version No.");
        //OnRestoreSalesLinesOnAfterSalesLineArchiveSetFilters(SalesLineArchive, SalesHeaderArchive, SalesHeader);
        if SalesLineArchive.FindSet()then repeat SalesLine.Init();
                SalesLine.TransferFields(SalesLineArchive);
                //OnRestoreSalesLinesOnBeforeSalesLineInsert(SalesLine, SalesLineArchive);
                SalesLine.Insert(true);
                //OnRestoreSalesLinesOnAfterSalesLineInsert(SalesLine, SalesLineArchive);
                if SalesLine.Type <> SalesLine.Type::" " then begin
                    SalesLine.Validate("No.");
                    if SalesLineArchive."Variant Code" <> '' then SalesLine.Validate("Variant Code", SalesLineArchive."Variant Code");
                    if SalesLineArchive."Unit of Measure Code" <> '' then SalesLine.Validate("Unit of Measure Code", SalesLineArchive."Unit of Measure Code");
                    SalesLine.Validate("Location Code", SalesLineArchive."Location Code");
                    ShouldValidateQuantity:=SalesLine.Quantity <> 0;
                    //OnRestoreSalesLinesOnAfterCalcShouldValidateQuantity(SalesLine, SalesLineArchive, ShouldValidateQuantity);
                    if ShouldValidateQuantity then SalesLine.Validate(Quantity, SalesLineArchive.Quantity);
                    //OnRestoreSalesLinesOnAfterValidateQuantity(SalesLine, SalesLineArchive);
                    SalesLine.Validate("Unit Price", SalesLineArchive."Unit Price");
                    SalesLine.Validate("Unit Cost (LCY)", SalesLineArchive."Unit Cost (LCY)");
                    SalesLine.Validate("Line Discount %", SalesLineArchive."Line Discount %");
                    if SalesLineArchive."Inv. Discount Amount" <> 0 then SalesLine.Validate("Inv. Discount Amount", SalesLineArchive."Inv. Discount Amount");
                    if SalesLine.Amount <> SalesLineArchive.Amount then SalesLine.Validate(Amount, SalesLineArchive.Amount);
                    SalesLine.Validate(Description, SalesLineArchive.Description);
                end;
                SalesLine."Shortcut Dimension 1 Code":=SalesLineArchive."Shortcut Dimension 1 Code";
                SalesLine."Shortcut Dimension 2 Code":=SalesLineArchive."Shortcut Dimension 2 Code";
                SalesLine."Dimension Set ID":=SalesLineArchive."Dimension Set ID";
                SalesLine."Deferral Code":=SalesLineArchive."Deferral Code";
                RestoreDeferrals(Enum::"Deferral Document Type"::Sales.AsInteger(), SalesLineArchive."Document Type".AsInteger(), SalesLineArchive."Document No.", SalesLineArchive."Line No.", SalesHeaderArchive."Doc. No. Occurrence", SalesHeaderArchive."Version No.");
                RecordLinkManagement.CopyLinks(SalesLineArchive, SalesLine);
                //OnAfterTransferFromArchToSalesLine(SalesLine, SalesLineArchive);
                SalesLine.Modify(true);
            //OnAfterRestoreSalesLine(SalesHeader, SalesLine, SalesHeaderArchive, SalesLineArchive);
            until SalesLineArchive.Next() = 0;
    //OnAfterRestoreSalesLines(SalesHeader, SalesLine, SalesHeaderArchive, SalesLineArchive);
    end;
    local procedure RestoreSalesLineComments(SalesHeaderArchive: Record "Sales Header Archive"; SalesHeader: Record "Sales Header")
    var
        SalesCommentLineArchive: Record "Sales Comment Line Archive";
        SalesCommentLine: Record "Sales Comment Line";
        NextLine: Integer;
    begin
        SalesCommentLineArchive.SetRange("Document Type", SalesHeaderArchive."Document Type");
        SalesCommentLineArchive.SetRange("No.", SalesHeaderArchive."No.");
        SalesCommentLineArchive.SetRange("Doc. No. Occurrence", SalesHeaderArchive."Doc. No. Occurrence");
        SalesCommentLineArchive.SetRange("Version No.", SalesHeaderArchive."Version No.");
        if SalesCommentLineArchive.FindSet()then repeat SalesCommentLine.Init();
                SalesCommentLine.TransferFields(SalesCommentLineArchive);
                SalesCommentLine.Insert();
            until SalesCommentLineArchive.Next() = 0;
        SalesCommentLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesCommentLine.SetRange("No.", SalesHeader."No.");
        SalesCommentLine.SetRange("Document Line No.", 0);
        if SalesCommentLine.FindLast()then NextLine:=SalesCommentLine."Line No.";
        NextLine+=10000;
        SalesCommentLine.Init();
        SalesCommentLine."Document Type":=SalesHeader."Document Type";
        SalesCommentLine."No.":=SalesHeader."No.";
        SalesCommentLine."Document Line No.":=0;
        SalesCommentLine."Line No.":=NextLine;
        SalesCommentLine.Date:=WorkDate();
        SalesCommentLine.Comment:=StrSubstNo(Text004, Format(SalesHeaderArchive."Version No."));
        //OnRestoreSalesLineCommentsOnBeforeInsertSalesCommentLine(SalesCommentLine);
        SalesCommentLine.Insert();
    end;
    local procedure RestoreDeferrals(DeferralDocType: Integer; DocType: Integer; DocNo: Code[20]; LineNo: Integer; DocNoOccurrence: Integer; VersionNo: Integer)
    var
        DeferralHeaderArchive: Record "Deferral Header Archive";
        DeferralLineArchive: Record "Deferral Line Archive";
        DeferralHeader: Record "Deferral Header";
        DeferralLine: Record "Deferral Line";
    begin
        if DeferralHeaderArchive.Get(DeferralDocType, DocType, DocNo, DocNoOccurrence, VersionNo, LineNo)then begin
            //OnRestoreDeferralsOnAfterGetDeferralHeaderArchive(DeferralHeaderArchive, DeferralHeader);
            // Updates the header if is exists already and removes all the lines
            DeferralUtilities.SetDeferralRecords(DeferralHeader, DeferralDocType, '', '', DocType, DocNo, LineNo, DeferralHeaderArchive."Calc. Method", DeferralHeaderArchive."No. of Periods", DeferralHeaderArchive."Amount to Defer", DeferralHeaderArchive."Start Date", DeferralHeaderArchive."Deferral Code", DeferralHeaderArchive."Schedule Description", DeferralHeaderArchive."Initial Amount to Defer", true, DeferralHeaderArchive."Currency Code");
            // Add lines as exist in the archives
            DeferralLineArchive.SetRange("Deferral Doc. Type", DeferralDocType);
            DeferralLineArchive.SetRange("Document Type", DocType);
            DeferralLineArchive.SetRange("Document No.", DocNo);
            DeferralLineArchive.SetRange("Doc. No. Occurrence", DocNoOccurrence);
            DeferralLineArchive.SetRange("Version No.", VersionNo);
            DeferralLineArchive.SetRange("Line No.", LineNo);
            if DeferralLineArchive.FindSet()then repeat DeferralLine.Init();
                    DeferralLine.TransferFields(DeferralLineArchive);
                    DeferralLine.Insert();
                until DeferralLineArchive.Next() = 0;
        end
        else
            // Removes any lines that may have been defaulted
            DeferralUtilities.RemoveOrSetDeferralSchedule('', DeferralDocType, '', '', DocType, DocNo, LineNo, 0, 0D, '', '', true);
    end;
}
