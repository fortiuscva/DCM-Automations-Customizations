pageextension 52102 "THK Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("THK Qty. to Partial"; Rec."THK Qty. to Partial")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Qty. to Partial field.';
            }
        }
        addlast(Control1)
        {
            field("THK Urgent"; rec."THK Urgent")
            {
                ApplicationArea = all;
            }
            field("THK Original Qty"; rec."THK Original Qty")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("THK Fully Shipped"; rec."THK Fully Shipped")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
        addafter("Location Code")
        {
            field("THK Allow Negative Profit"; Rec."THK Allow Negative Profit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Negative Profit field.';
            }
            field("THK Purchaser Code"; Rec."THK Purchaser Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Purchaser Code field.';
                Editable = false;
            }
        }
    }
}
