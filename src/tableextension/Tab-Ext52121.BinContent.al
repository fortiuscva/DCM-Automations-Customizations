tableextension 52121 "THK Bin Content" extends "Bin Content"
{
    fields
    {
        field(50000; "THK Restrict Prod Pick"; Boolean)
        {
            Caption = 'Restrict Prod Pick';
            FieldClass = FlowField;
            CalcFormula = exist(Bin where(code=field("Bin Code"), "THK Restrict Prod Pick"=const(true)));
        }
    }
}
