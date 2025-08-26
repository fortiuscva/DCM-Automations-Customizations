tableextension 52105 "THK Item" extends Item
{
    fields
    {
        field(52100; "THK Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }
        field(52101; "THK RED_Item"; Boolean)
        {
            Caption = 'RED_Item';
            DataClassification = CustomerContent;
        }
        field(52102; "THK PPI Code"; Code[20])
        {
            Caption = 'PPI Code';
            TableRelation = "THK PPI Codes".Code;
        }
        field(52103; "THK Blanket Lead Time"; DateFormula)
        {
            Caption = 'Blanket Lead Time';
        }
        field(52104; "THK Allow Negative Profit"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Negative Profit';
        }
        field(52105; "THK Planning Approved By"; code[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Planning Approved By';
        //TableRelation = User."User Name";
        //ValidateTableRelation = false;
        }
        field(52106; "THK Planning Approved Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Planning Approved Date';
        }
    }
}
