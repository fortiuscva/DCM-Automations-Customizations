tableextension 52110 "THK Ship-to Address" extends "Ship-to Address"
{
    fields
    {
        field(52100; "THK Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code;
        }
    }
}
