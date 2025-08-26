tableextension 52129 "THK Item Journal Line" extends "Item Journal Line"
{
    fields
    {
        field(52100; "THK Consignment"; Boolean)
        {
            Caption = 'Consignment';
            DataClassification = ToBeClassified;
        }
        field(52101; "THK Purchase Order No."; code[20])
        {
            Caption = 'Purchase Order No.';
            DataClassification = ToBeClassified;
        }
    }
}
