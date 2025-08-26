pageextension 52129 "THK Ship-to Address List" extends "Ship-to Address List"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Salesperson Code"; Rec."THK Salesperson Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Salesperson Code field.';
            }
        }
    }
}
