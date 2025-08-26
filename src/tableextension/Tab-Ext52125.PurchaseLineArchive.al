tableextension 52125 "THK Purchase Line Archive" extends "Purchase Line Archive"
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
