tableextension 52132 "THK Purch. Rcpt. Header" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(52100; "THK Consignment"; Boolean)
        {
            Caption = 'Consignment';
            DataClassification = ToBeClassified;
        }
    }
}
