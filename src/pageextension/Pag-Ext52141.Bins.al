pageextension 52141 "THK Bins" extends Bins
{
    layout
    {
        addafter("Bin Ranking")
        {
            field("THK Restrict Prod Pick"; rec."THK Restrict Prod Pick")
            {
                ApplicationArea = all;
                Editable = true;
            }
        }
    }
}
