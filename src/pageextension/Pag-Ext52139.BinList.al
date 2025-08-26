pageextension 52139 "THK Bin List" extends "Bin List"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Restrict Prod Pick"; rec."THK Restrict Prod Pick")
            {
                ApplicationArea = all;
            }
        }
    }
}
