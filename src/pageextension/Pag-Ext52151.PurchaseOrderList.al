pageextension 52151 "THK Purchase Order List" extends "Purchase Order List"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("THK Consignment"; Rec."THK Consignment")
            {
                ApplicationArea = all;
            }
        }
    }
}
