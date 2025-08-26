tableextension 52128 "THK Item Ledger Entry" extends "Item Ledger Entry"
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
