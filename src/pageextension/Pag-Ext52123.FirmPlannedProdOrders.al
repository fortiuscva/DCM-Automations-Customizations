pageextension 52123 "THK Firm Planned Prod. Orders" extends "Firm Planned Prod. Orders"
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
