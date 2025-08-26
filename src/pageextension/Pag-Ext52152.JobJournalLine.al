pageextension 52152 "THK Job Journal Line" extends "Job Journal"
{
    layout
    {
        addafter("Location Code")
        {
            field("THK Consignment"; Rec."THK Consignment")
            {
                ApplicationArea = all;
            }
        }
    }
}
