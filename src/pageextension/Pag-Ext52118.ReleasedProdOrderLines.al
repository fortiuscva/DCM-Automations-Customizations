pageextension 52118 "THK Released Prod. Order Lines" extends "Released Prod. Order Lines"
{
    layout
    {
        addbefore(Quantity)
        {
            field("THK Blanket PO Item"; Rec."THK Blanket PO Item")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the THK Blanket PO Item field.';
            }
            field("THK Completely Picked"; Rec."THK Completely Picked")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Completely Picked field.';
            }
            field("THK Pick Created"; Rec."THK Pick Created")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pick Created field.';
            }
        }
    }
    actions
    {
        addlast("&Line")
        {
            action("THK Create Warehouse Pick")
            {
                AccessByPermission = TableData "Bin Content"=R;
                ApplicationArea = Warehouse;
                Caption = 'THK Create Warehouse Pick';
                Image = CreateWarehousePick;
                ToolTip = 'Create warehouse pick documents for the production order components.';

                trigger OnAction()
                begin
                    TFHCreatePick(UserId, 0, false, false, false);
                end;
            }
        }
    }
    procedure TFHCreatePick(AssignedUserID: Code[50]; SortingMethod: Option; SetBreakBulkFilter: Boolean; DoNotFillQtyToHandle: Boolean; PrintDocument: Boolean)
    var
        ProdOrderCompLine: Record "Prod. Order Component";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        Text008: Label 'Nothing to handle.';
        ProdOrderRecLcl: Record "Production Order";
    begin
        ProdOrderCompLine.Reset();
        ProdOrderCompLine.SetRange(Status, Rec.Status);
        ProdOrderCompLine.SetRange("Prod. Order No.", Rec."Prod. Order No.");
        ProdOrderCompLine.SetRange("Prod. Order Line No.", Rec."Line No.");
        if ProdOrderCompLine.Find('-')then repeat ItemTrackingMgt.InitItemTrackingForTempWhseWorksheetLine("Warehouse Worksheet Document Type"::Production, ProdOrderCompLine."Prod. Order No.", ProdOrderCompLine."Prod. Order Line No.", DATABASE::"Prod. Order Component", ProdOrderCompLine.Status.AsInteger(), ProdOrderCompLine."Prod. Order No.", ProdOrderCompLine."Prod. Order Line No.", ProdOrderCompLine."Line No.");
            until ProdOrderCompLine.Next() = 0;
        Commit();
        Rec.TestField(Status, Rec.Status::Released);
        ProdOrderRecLcl.get(Rec.Status, Rec."Prod. Order No.");
        ProdOrderRecLcl.CalcFields("Completely Picked");
        if ProdOrderRecLcl."Completely Picked" then Error(Text008);
        ProdOrderCompLine.Reset();
        ProdOrderCompLine.SetRange(Status, Rec.Status);
        ProdOrderCompLine.SetRange("Prod. Order No.", Rec."Prod. Order No.");
        ProdOrderCompLine.SetFilter("Flushing Method", '%1|%2|%3', ProdOrderCompLine."Flushing Method"::Manual, ProdOrderCompLine."Flushing Method"::"Pick + Forward", ProdOrderCompLine."Flushing Method"::"Pick + Backward");
        ProdOrderCompLine.SetRange("Planning Level Code", 0);
        ProdOrderCompLine.SetFilter("Expected Quantity", '>0');
        ProdOrderCompLine.SetRange("Prod. Order Line No.", Rec."Line No.");
        if ProdOrderCompLine.Find('-')then begin
            THKSICU.SetProdLineForWhsePick(Rec."Line No.");
            RunCreatePickFromWhseSource(AssignedUserID, SortingMethod, SetBreakBulkFilter, DoNotFillQtyToHandle, PrintDocument);
            THKSICU.SetProdLineForWhsePick(0);
        end
        else
            Message(Text008);
    end;
    local procedure RunCreatePickFromWhseSource(AssignedUserID: Code[50]; SortingMethod: Option; SetBreakBulkFilter: Boolean; DoNotFillQtyToHandle: Boolean; PrintDocument: Boolean)
    var
        CreatePickFromWhseSource: Report "Whse.-Source - Create Document";
        IsHandled: Boolean;
        ProdOrderRecLcl: Record "Production Order";
    begin
        ProdOrderRecLcl.get(Rec.Status, Rec."Prod. Order No.");
        CreatePickFromWhseSource.SetProdOrder(ProdOrderRecLcl);
        CreatePickFromWhseSource.SetHideValidationDialog(false);
        CreatePickFromWhseSource.UseRequestPage(true);
        CreatePickFromWhseSource.RunModal();
        CreatePickFromWhseSource.GetResultMessage(2);
    end;
    var THKSICU: Codeunit "THK Single Instance";
}
