pageextension 52144 "Posted Purchase Rcpt. Subform" extends "Posted Purchase Rcpt. Subform"
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
    }
}
