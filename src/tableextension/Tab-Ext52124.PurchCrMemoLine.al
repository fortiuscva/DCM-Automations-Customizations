tableextension 52124 "THK Purch. Cr. Memo Line" extends "Purch. Cr. Memo Line"
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
