pageextension 52145 "Posted Purch. Invoice Subform" extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("THK Allow Negative Profit"; Rec."THK Allow Negative Profit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Negative Profit field.';
            }
        }
    }
}
