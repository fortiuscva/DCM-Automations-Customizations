pageextension 52153 "THK Posted Purchase Receipt" extends "Posted Purchase Receipt"
{
    layout
    {
        addlast(General)
        {
            field("THK Consignment"; Rec."THK Consignment")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Consignment field.', Comment = '%';
            }
        }
    }
}
