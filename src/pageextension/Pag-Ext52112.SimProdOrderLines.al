pageextension 52112 "THK Sim. Prod. Order Lines" extends "Simulated Prod. Order Lines"
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
