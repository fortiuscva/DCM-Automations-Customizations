pageextension 52137 "THK Sales Lines" extends "Sales Lines"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Urgent"; rec."THK Urgent")
            {
                ApplicationArea = all;
            }
            field("THK Purchaser Code"; Rec."THK Purchaser Code")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
}
