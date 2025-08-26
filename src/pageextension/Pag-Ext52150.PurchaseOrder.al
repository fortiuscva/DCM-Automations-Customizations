pageextension 52150 "THK PurchaseOrder" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("THK Consignment"; Rec."THK Consignment")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addafter("Create &Whse. Receipt")
        {
            action("THK Change PostingGroup")
            {
                ApplicationArea = All;
                Caption = 'Change Inventory Posting Group';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    InputDialogue: Page "THK Input Dialogue";
                    PurchaseLine: Record "Purchase Line";
                begin
                    PurchaseLine.SetRange("Document Type", Rec."Document Type");
                    PurchaseLine.SetRange("Document No.", Rec."No.");
                    if PurchaseLine.FindFirst()then begin
                        InputDialogue.SetOrderLine(PurchaseLine);
                        InputDialogue.RunModal();
                        CurrPage.Update(false);
                    end;
                end;
            }
        }
    }
}
