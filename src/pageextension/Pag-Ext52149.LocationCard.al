pageextension 52149 "THK Location Card" extends "Location card"
{
    layout
    {
        addafter("Use As In-Transit")
        {
            field("THK Consignment"; Rec."THK Consignment")
            {
                ToolTip = 'Consignment';
                ApplicationArea = all;
            }
        }
    }
}
