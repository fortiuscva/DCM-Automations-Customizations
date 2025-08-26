table 52100 "THK PPI Codes"
{
    Caption = 'PPI Codes';
    DataClassification = ToBeClassified;
    LookupPageId = "THK PPI Codes";
    DrillDownPageId = "THK PPI Codes";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
