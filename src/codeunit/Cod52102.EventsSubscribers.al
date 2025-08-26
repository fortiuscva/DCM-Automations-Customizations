codeunit 52102 "THK Events & Subscribers"
{
    [EventSubscriber(ObjectType::Report, Report::"Whse.-Source - Create Document", 'OnAfterGetRecordProdOrderComponent', '', false, false)]
    local procedure rep7305_OnAfterGetRecordProdOrderComponent(var ProdOrderComponent: Record "Prod. Order Component"; var SkipProdOrderComp: Boolean);
    var
        ProdOrdLineNoVarLcl: Integer;
    begin
        ProdOrdLineNoVarLcl:=THKSICUGbl.GetProdLineForWhsePick();
        If ProdOrdLineNoVarLcl <> 0 then begin
            if ProdOrdLineNoVarLcl <> ProdOrderComponent."Prod. Order Line No." then SkipProdOrderComp:=true;
        end;
    end;
    [EventSubscriber(ObjectType::Report, Report::"Calculate Plan - Plan. Wksh.", 'OnBeforeItemOnPreDataItem', '', false, false)]
    local procedure rep99001017_OnBeforeItemOnPreDataItem(var Item: Record Item);
    var
        SingleInstanceCULcl: Codeunit "THK Single Instance";
        BlockedItemVarLcl: Boolean;
    //RedItemVarLcl: Boolean;
    begin
        BlockedItemVarLcl:=SingleInstanceCULcl.GetBlockedItem();
        //RedItemVarLcl := SingleInstanceCULcl.GetRedItem();
        Item.SetRange(Blocked, BlockedItemVarLcl);
        //Item.SetRange("THK RED_Item", RedItemVarLcl);
        SingleInstanceCULcl.SetBlockedItem(false);
    //SingleInstanceCULcl.SetRedItem(false);
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeSetSalespersonCode', '', false, false)]
    local procedure OnBeforeSetSalespersonCode(var SalesHeader: Record "Sales Header"; SalesPersonCodeToCheck: Code[20]; var SalesPersonCodeToAssign: Code[20]; var IsHandled: Boolean);
    var
        CustomerRecLcl: Record Customer;
    begin
        if SalesHeader."Sell-to Customer No." <> SalesHeader."Bill-to Customer No." then begin
            CustomerRecLcl.get(SalesHeader."Sell-to Customer No.");
            SalesPersonCodeToAssign:=CustomerRecLcl."Salesperson Code";
            IsHandled:=true;
        end;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnFindBWPickBinOnBeforeFromBinContentFindSet', '', false, false)]
    local procedure OnFindBWPickBinOnBeforeFromBinContentFindSet(var FromBinContent: Record "Bin Content"; SourceType: Integer; var TotalQtyPickedBase: Decimal; var TotalQtyToPickBase: Decimal; var IsHandled: Boolean; SourceSubType: Option; SourceNo: Code[20]; SourceLineNo: Integer; SourceSubLineNo: Integer; LocationCode: Code[10]; ItemNo: Code[20]; VariantCode: Code[10]; ToBinCode: Code[20]);
    var
        Bin: Record Bin;
        BinCodeFilterText: Text;
    begin
        if SourceType = 5407 then begin
            if FromBinContent.FindSet()then;
            // Bin.Reset();
            // bin.SetRange("Location Code", FromBinContent."Location Code");
            // bin.SetRange("THK Restrict Prod Pick", true);
            // if bin.FindSet() then
            //     repeat
            //         AddToFilterText(BinCodeFilterText, '&', '<>', bin.Code);
            //         FromBinContent.SetFilter("Bin Code", BinCodeFilterText);
            //     until bin.Next() = 0;
            FromBinContent.SetRange("THK Restrict Prod Pick", false);
        end;
    end;
    // local procedure AddToFilterText(var TextVar: Text[250]; Separator: Code[1]; Comparator: Code[2]; Addendum: Code[20])
    // begin
    //     if TextVar = '' then
    //         TextVar := Comparator + '''' + Addendum + ''''
    //     else
    //         TextVar += Separator + Comparator + '''' + Addendum + '''';
    // end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitOutstandingAmount', '', false, false)]
    local procedure "Sales Line_OnAfterInitOutstandingAmount"(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; Currency: Record Currency)
    begin
        if SalesLine."Completely Shipped" then SalesLine."THK Fully Shipped":=true
        else
            SalesLine."THK Fully Shipped":=false;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Format Address", 'OnAfterGeneratePostCodeCity', '', false, false)]
    local procedure OnAfterGeneratePostCodeCity(var Country: Record "Country/Region"; var PostCode: Code[20]; var PostCodeCityText: Text[100]; var City: Text[50]; var CountyText: Text[50]; var County: Text[50])
    var
        NewCounty: text;
    begin
        if PostCodeCityText = '' then exit;
        if StrPos(PostCodeCityText, ',') = 0 then exit;
        if Country."Address Format" <> Country."Address Format"::"City+County+Post Code" then exit;
        PostCodeCityText:=DelStr(City, MaxStrLen(PostCodeCityText) - StrLen(PostCode) - StrLen(County) - 4) + ', ' + County + ',' + PostCode;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnPostItemJnlLineOnAfterCopyDocumentFields', '', false, false)]
    local procedure OnPostItemJnlLineOnAfterCopyDocumentFields(var ItemJournalLine: Record "Item Journal Line"; PurchaseLine: Record "Purchase Line"; WarehouseReceiptHeader: Record "Warehouse Receipt Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header"; PurchRcptHeader: Record "Purch. Rcpt. Header");
    begin
        ItemJournalLine."THK Consignment":=PurchaseLine."THK Consignment";
        ItemJournalLine."THK Purchase Order No.":=PurchaseLine."Document No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostInvoice', '', false, false)]
    local procedure OnAfterPostInvoice(var PurchHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; TotalPurchLine: Record "Purchase Line"; TotalPurchLineLCY: Record "Purchase Line"; CommitIsSupressed: Boolean; var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        VendorLedgerEntry."THK Purchase Order No.":=PurchHeader."No.";
        VendorLedgerEntry.Modify();
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer);
    begin
        NewItemLedgEntry."THK Consignment":=ItemJournalLine."THK Consignment";
        NewItemLedgEntry."THK Purchase Order No.":=ItemJournalLine."THK Purchase Order No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', false, false)]
    local procedure "Sales-Post (Yes/No)_OnBeforeConfirmSalesPost"(var SalesHeader: Record "Sales Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer; var PostAndSend: Boolean)
    var
        MiscFunctions: Codeunit "THK Misc. Functions";
    begin
        MiscFunctions.CheckPostingDate(SalesHeader."Posting Date");
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post + Print", 'OnBeforeConfirmPost', '', false, false)]
    local procedure "Purch.-Post + Print_OnBeforeConfirmPost"(var PurchaseHeader: Record "Purchase Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer)
    var
        MiscFunctions: Codeunit "THK Misc. Functions";
    begin
        MiscFunctions.CheckPostingDate(PurchaseHeader."Posting Date");
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnBeforeCode', '', false, false)]
    local procedure OnBeforeCode(var ItemJournalLine: Record "Item Journal Line"; var HideDialog: Boolean; var SuppressCommit: Boolean; var IsHandled: Boolean)
    var
        MiscFunctions: Codeunit "THK Misc. Functions";
    begin
        MiscFunctions.CheckPostingDate(ItemJournalLine."Posting Date");
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Templ. Mgt.", 'OnAfterCreateItemFromTemplate', '', false, false)]
    local procedure OnAfterCreateItemFromTemplate(var Item: Record Item; ItemTempl: Record "Item Templ.");
    begin
        Item.Validate("THK Purchaser Code", ItemTempl."THK Purchaser Code");
        item.Validate("LAX Schedule B Code", ItemTempl."LAX Schedule B Code");
        item.Validate("THK PPI Code", ItemTempl."THK PPI Code");
        Item.Modify();
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Register", 'OnAfterProdCompLineModify', '', false, false)]
    local procedure OnAfterProdCompLineModify(var ProdOrderComponent: Record "Prod. Order Component")
    var
        ProdOrderComponent2: Record "Prod. Order Component";
        ProdOrder: Record "Production Order";
        MiscFunctions: Codeunit "THK Misc. Functions";
    begin
        if not ProdOrderComponent."Completely Picked" then exit;
        MiscFunctions.ModifyCompletelyPickedOnProdOrderLine(ProdOrderComponent);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnCreateWhseActivHeaderOnAfterWhseActivHeaderInsert', '', false, false)]
    local procedure OnCreateWhseActivHeaderOnAfterWhseActivHeaderInsert(var WhseActivHeader: Record "Warehouse Activity Header"; var TempWhseActivLine: Record "Warehouse Activity Line" temporary; CreatePickParameters: Record "Create Pick Parameters")
    var
        ProductionOrder: Record "Production Order";
    begin
        if WhseActivHeader.IsTemporary then exit;
        if TempWhseActivLine."Source Type" <> Database::"Prod. Order Component" then exit;
        if not WhseActivHeader."THK Floor" then if ProductionOrder.Get(TempWhseActivLine."Source Subtype", TempWhseActivLine."Source No.")then begin
                WhseActivHeader."THK Floor":=ProductionOrder."THK Floor";
                WhseActivHeader.Modify();
            end;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeConfirmPost', '', false, false)]
    local procedure OnBeforeConfirmPost(var PurchaseHeader: Record "Purchase Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer)
    var
        MiscFunctions: Codeunit "THK Misc. Functions";
    begin
        MiscFunctions.CheckPostingDate(PurchaseHeader."Posting Date");
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order", OnBeforeModifySalesOrderHeader, '', false, false)]
    local procedure "Sales-Quote to Order_OnBeforeModifySalesOrderHeader"(var SalesOrderHeader: Record "Sales Header"; SalesQuoteHeader: Record "Sales Header")
    begin
        SalesOrderHeader.Validate("Order Date", WorkDate());
        SalesOrderHeader.Validate("Document Date", WorkDate());
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order", OnCreatePurchHeaderOnBeforePurchOrderHeaderModify, '', false, false)]
    local procedure "Purch.-Quote to Order_OnCreatePurchHeaderOnBeforePurchOrderHeaderModify"(var PurchOrderHeader: Record "Purchase Header"; var PurchHeader: Record "Purchase Header")
    begin
        PurchOrderHeader.Validate("Order Date", WorkDate());
        PurchOrderHeader.Validate("Document Date", WorkDate());
    end;
    var THKSICUGbl: Codeunit "THK Single Instance";
}
