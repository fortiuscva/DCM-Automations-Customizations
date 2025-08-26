pageextension 52115 "THK Firm Planned Prod. Order" extends "Firm Planned Prod. Order"
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
