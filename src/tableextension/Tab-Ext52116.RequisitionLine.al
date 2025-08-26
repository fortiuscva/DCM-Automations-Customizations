tableextension 52116 "THK Requisition Line" extends "Requisition Line"
{
    fields
    {
        field(52100; "THK RED_Item"; Boolean)
        {
            Caption = 'RED_Item';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."THK RED_Item" where("No."=field("No.")));
            Editable = false;
        }
    }
}
