tableextension 52123 "THK Purch. Inv. Line" extends "Purch. Inv. Line"
{
    fields
    {
        field(52104; "THK Allow Negative Profit"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Negative Profit';
            Editable = false;
        }
    }
}
