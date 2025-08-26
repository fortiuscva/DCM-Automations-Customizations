pageextension 52114 "THK Planned Prod. Order Lines" extends "Planned Prod. Order Lines"
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
        }
    }
}
