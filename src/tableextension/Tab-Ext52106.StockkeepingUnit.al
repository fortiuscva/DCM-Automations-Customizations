tableextension 52106 "THK Stockkeeping Unit" extends "Stockkeeping Unit"
{
    fields
    {
        field(52100; "THK Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }
        field(52105; "THK Planning Approved By"; code[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Planning Approved By';
        // TableRelation = User."User Name";
        // ValidateTableRelation = false;
        // trigger OnValidate()
        // var
        //     UserSelection: Codeunit "User Selection";
        // begin
        //     UserSelection.ValidateUserName("THK Plannign Approved By");
        // end;
        }
        field(52106; "THK Planning Approved Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Planning Approved Date';
        }
    }
}
