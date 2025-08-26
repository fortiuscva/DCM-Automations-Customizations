pageextension 52160 "THK Warehouse Pick" extends "Warehouse Pick"
{
    layout
    {
        addlast(General)
        {
            field("THK Floor"; Rec."THK Floor")
            {
                ApplicationArea = all;
                Caption = 'Floor';
            }
        }
    }
}
