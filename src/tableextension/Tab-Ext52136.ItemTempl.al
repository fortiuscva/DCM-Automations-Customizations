tableextension 52136 "THK Item Templ." extends "Item Templ."
{
    fields
    {
        field(52100; "THK Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }
        /* field(52101; "THK Schedule B Code"; Code[10])
        {
            Caption = 'Schedule B Code';
            DataClassification = CustomerContent;
            TableRelation = "LAX Schedule B Code".Code;
        } */
        field(52102; "THK PPI Code"; Code[20])
        {
            Caption = 'PPI Code';
            TableRelation = "THK PPI Codes".Code;
        }
    }
}
