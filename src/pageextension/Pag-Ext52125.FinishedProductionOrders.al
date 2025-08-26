pageextension 52125 "THK Finished Production Orders" extends "Finished Production Orders"
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
