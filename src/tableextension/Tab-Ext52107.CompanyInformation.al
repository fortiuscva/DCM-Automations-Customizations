tableextension 52107 "THK Company Information" extends "Company Information"
{
    fields
    {
        field(52100; "THK Invoice E-mail"; Text[80])
        {
            Caption = 'Invoice E-mail';
            DataClassification = ToBeClassified;
        }
        field(52101; "THK PrintFreightInsurance"; Boolean)
        {
            Caption = 'Print Freight & Insurance Verbiage';
            DataClassification = ToBeClassified;
        }
    }
}
