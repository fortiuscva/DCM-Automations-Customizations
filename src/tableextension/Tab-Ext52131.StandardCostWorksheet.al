tableextension 52131 "THK Standard Cost Worksheet" extends "Standard Cost Worksheet"
{
    fields
    {
        field(52100; "THK Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Vendor No." where("No."=field("No.")));
            Editable = false;
        }
        field(52101; "THK Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No."=field("THK Vendor No.")));
            Editable = false;
        }
    }
}
