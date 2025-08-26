pageextension 52156 "THK Posted Purchase Invoices" extends "Posted Purchase Invoices"
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
