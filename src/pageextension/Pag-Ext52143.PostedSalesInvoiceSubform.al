pageextension 52143 "Posted Sales Invoice Subform" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("THK Allow Negative Profit"; Rec."THK Allow Negative Profit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Negative Profit field.';
            }
        }
        addlast(Control1)
        {
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
    }
}
