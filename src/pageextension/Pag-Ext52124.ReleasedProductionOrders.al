pageextension 52124 "THK Released Production Orders" extends "Released Production Orders"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Blanket PO Item"; Rec."THK Blanket PO Item")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the THK Blanket PO Item field.';
            }
        }
    }
}
