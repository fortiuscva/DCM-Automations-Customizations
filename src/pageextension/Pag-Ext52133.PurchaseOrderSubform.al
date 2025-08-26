pageextension 52133 "THK Purchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Assigned User ID"; rec."THK Assigned User ID")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Assigned User ID from Purchase Line';
            }
        }
        addafter("Location Code")
        {
            field("THK Allow Negative Profit"; Rec."THK Allow Negative Profit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Negative Profit field.';
            }
            field("THK Consignment"; Rec."THK Consignment")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(SelectMultiItems)
        {
            action("THK Change PostingGroup")
            {
                ApplicationArea = All;
                Caption = 'Change Inventory Posting Group';
                Image = UpdateDescription;

                trigger OnAction()
                var
                    InputDialogue: Page "THK Input Dialogue";
                begin
                    InputDialogue.SetOrderLine(Rec);
                    InputDialogue.RunModal();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
