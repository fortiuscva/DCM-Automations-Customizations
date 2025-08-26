pageextension 52111 "THK Simulated Production Order" extends "Simulated Production Order"
{
    layout
    {
        addlast(General)
        {
            field("THK Blanket PO Item"; Rec."THK Blanket PO Item")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the THK Blanket PO Item field.';
            }
        }
    }
}
