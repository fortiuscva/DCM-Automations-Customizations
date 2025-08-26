page 52102 "THK Input Dialogue"
{
    ApplicationArea = All;
    Caption = 'Enter Value';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            group(InventoryPositngGroup)
            {
                Caption = 'Inventory Posting Group';

                field(InventoryPostinggroup; InventoryPostinggroup)
                {
                    Caption = 'Inventory Posting Group';
                    ApplicationArea = all;
                    TableRelation = "Inventory Posting Group";
                }
            }
        }
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean var
        PurcahseLine: Record "Purchase Line";
        confirmManagement: Codeunit "Confirm Management";
    begin
        if CloseAction = CloseAction::Cancel then exit;
        if CloseAction = CloseAction::No then exit;
        //PurcahseLine.Get(OriginalPurchaseLine."Document Type", OriginalPurchaseLine."Document No.", OriginalPurchaseLine."Line No.");
        PurcahseLine.SetRange("Document Type", OriginalPurchaseLine."Document Type");
        PurcahseLine.SetRange("Document No.", OriginalPurchaseLine."Document No.");
        PurcahseLine.ModifyAll("Posting Group", InventoryPostinggroup);
    //PurcahseLine.Modify();
    end;
    procedure SetOrderLine(PurchaseLine: Record "Purchase Line")
    begin
        OriginalPurchaseLine:=PurchaseLine;
    end;
    var OriginalPurchaseLine: Record "Purchase Line";
    InventoryPostinggroup: code[20];
    BlankQst: Label 'Magento Artwork Job ID is empty. Do you want to proceed?';
}
