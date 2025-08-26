codeunit 52100 "THK Misc. Functions"
{
    procedure RefreshSalesQuoteLines(Var SalesHeaderRecPar: Record "Sales Header")
    var
        SalesLineRecLcl: Record "Sales Line";
        OldQtyVarLcl: Decimal;
        StatusChangedVarLcl: Boolean;
        OldSalesDocStatus: Enum "Sales Document Status";
    begin
        StatusChangedVarLcl:=false;
        if SalesHeaderRecPar.Status <> SalesHeaderRecPar.Status::Open then begin
            OldSalesDocStatus:=SalesHeaderRecPar.Status;
            SalesHeaderRecPar.validate(Status, SalesHeaderRecPar.Status::Open);
            SalesHeaderRecPar.Modify();
            StatusChangedVarLcl:=true;
        end;
        SalesLineRecLcl.Reset();
        SalesLineRecLcl.SetRange("Document Type", SalesHeaderRecPar."Document Type");
        SalesLineRecLcl.SetRange("Document No.", SalesHeaderRecPar."No.");
        SalesLineRecLcl.SetRange(Type, SalesLineRecLcl.Type::Item);
        SalesLineRecLcl.SetFilter("No.", '<>%1');
        if SalesLineRecLcl.FindSet()then repeat OldQtyVarLcl:=SalesLineRecLcl.Quantity;
                SalesLineRecLcl.Validate(Quantity, 0);
                SalesLineRecLcl.Modify();
                SalesLineRecLcl.Validate(Quantity, OldQtyVarLcl);
                SalesLineRecLcl.Modify();
            until SalesLineRecLcl.Next() = 0;
        if StatusChangedVarLcl then begin
            SalesHeaderRecPar.validate(Status, OldSalesDocStatus);
            SalesHeaderRecPar.Modify();
            StatusChangedVarLcl:=true;
        end;
    end;
    procedure PrintPackingSlipFromSalesShpt(SalesShptHeadRecPar: Record "Sales Shipment Header"; PrintItemReferencePar: Boolean)
    var
        PackingSlip: Report "THK Sales Shipment NA";
        SalesShptRecLcl: Record "Sales Shipment Header";
    begin
        SalesShptRecLcl.reset;
        SalesShptRecLcl.SetRange("No.", SalesShptHeadRecPar."No.");
        Clear(PackingSlip);
        PackingSlip.SetPrintItemReferenceNo(PrintItemReferencePar);
        PackingSlip.SetTableView(SalesShptRecLcl);
        PackingSlip.RunModal();
    end;
    procedure CheckPostingDate(PostingDatePar: Date)
    begin
        if((PostingDatePar <> WorkDate()) and (PostingDatePar <> 0D))then Message(PostingDateMsg);
    end;
    procedure ModifyCompletelyPickedOnProdOrderLine(ProdOrderComponent: Record "Prod. Order Component")
    var
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComponent2: Record "Prod. Order Component";
    begin
        ProdOrderComponent2.SetRange(Status, ProdOrderComponent.Status);
        ProdOrderComponent2.SetRange("Prod. Order No.", ProdOrderComponent."Prod. Order No.");
        ProdOrderComponent2.SetRange("Prod. Order Line No.", ProdOrderComponent."Prod. Order Line No.");
        ProdOrderComponent2.SetRange("Completely Picked", false);
        if ProdOrderComponent2.IsEmpty then begin
            ProdOrderLine.Get(ProdOrderComponent.Status, ProdOrderComponent."Prod. Order No.", ProdOrderComponent."Prod. Order Line No.");
            ProdOrderLine."THK Completely Picked":=true;
            ProdOrderLine.Modify();
        end;
    end;
    var PostingDateMsg: Label 'The Posting Date is not same as Work Date';
}
