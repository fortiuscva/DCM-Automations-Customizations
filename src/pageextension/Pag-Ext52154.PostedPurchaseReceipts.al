pageextension 52154 "THK Posted Purchase Receipts" extends "Posted Purchase Receipts"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Consignment"; Rec."THK Consignment")
            {
                ApplicationArea = all;
            }
        }
    }
}
