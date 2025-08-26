pageextension 52138 "THK Sales Order List" extends "Sales Order List"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Urgent"; rec."THK Urgent")
            {
                ApplicationArea = all;
            }
        }
    }
}
