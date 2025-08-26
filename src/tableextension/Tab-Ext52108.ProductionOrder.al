tableextension 52108 "THK Production Order" extends "Production Order"
{
    fields
    {
        field(52101; "THK Blanket PO Item"; Boolean)
        {
            Caption = 'Blanket PO Item';
        }
        field(52102; "THK Floor"; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Floor';
        }
    }
}
