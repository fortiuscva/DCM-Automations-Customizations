tableextension 52117 "THK Sales Cr.Memo Header" extends "Sales Cr.Memo Header"
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
