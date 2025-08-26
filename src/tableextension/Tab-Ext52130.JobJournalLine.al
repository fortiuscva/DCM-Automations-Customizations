tableextension 52130 "THK Job Journal Line" extends "Job Journal Line"
{
    fields
    {
        modify("Location Code")
        {
        trigger OnAfterValidate()
        var
            Location: Record Location;
        begin
            if Location.Get(Rec."Location Code")then begin
                Rec."THK Consignment":=Location."THK Consignment";
            //Rec.modify();
            end;
        end;
        }
        field(52100; "THK Consignment"; Boolean)
        {
            Caption = 'Consignment';
            DataClassification = ToBeClassified;
        }
    }
}
