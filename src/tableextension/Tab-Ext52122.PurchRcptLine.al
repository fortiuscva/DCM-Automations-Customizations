tableextension 52122 "THK Purch. Rcpt. Line" extends "Purch. Rcpt. Line"
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
