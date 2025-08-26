tableextension 52119 "THK Sales Header Archive" extends "Sales Header Archive"
{
    fields
    {
        field(50105; "THK Urgent"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Urgent';
        }
    }
}
