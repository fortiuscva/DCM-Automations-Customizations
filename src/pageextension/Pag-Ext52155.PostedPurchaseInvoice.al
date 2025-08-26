pageextension 52155 "THK Posted Purchase Invoice" extends "Posted Purchase Invoice"
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
