pageextension 52128 "THK Ship-to Address" extends "Ship-to Address"
{
    layout
    {
        addlast(General)
        {
            field("THK Salesperson Code"; Rec."THK Salesperson Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Salesperson Code field.';
            }
        }
    }
}
