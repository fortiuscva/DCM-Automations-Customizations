pageextension 52119 "THK Finished Production Order" extends "Finished Production Order"
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
