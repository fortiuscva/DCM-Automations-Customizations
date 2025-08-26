pageextension 52117 "THK Released Production Order" extends "Released Production Order"
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
            field("THK Floor"; Rec."THK Floor")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Floor field.';
            }
        }
    }
}
