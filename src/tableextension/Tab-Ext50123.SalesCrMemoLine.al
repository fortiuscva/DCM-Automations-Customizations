tableextension 50123 "THK Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50100; "THK Qty. to Partial"; Decimal)
        {
            Caption = 'Qty. to Partial';
            DataClassification = ToBeClassified;
        }
        field(50105; "THK Urgent"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Urgent';
            Editable = false;
        }
        field(52104; "THK Allow Negative Profit"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Negative Profit';
            Editable = false;
        }
        field(52105; "THK Original Qty"; Decimal)
        {
            Caption = 'Original Qty';
        }
        field(52106; "THK Fully Shipped"; Boolean)
        {
            Caption = 'Fully Shipped';
        }
        field(52107; "THK Purchaser Code"; code[20])
        {
            Caption = 'Purchaser Code';
        }
    }
}
