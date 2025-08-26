tableextension 52109 "THK Prod. Order Line" extends "Prod. Order Line"
{
    fields
    {
        field(52101; "THK Blanket PO Item"; Boolean)
        {
            Caption = 'Blanket PO Item';
        }
        field(52102; "THK Completely Picked"; Boolean)
        {
            Caption = 'Completely Picked';
            DataClassification = ToBeClassified;
        }
        field(52103; "THK Pick Created"; boolean)
        {
            Caption = 'Pick Created';
            Fieldclass = flowfield;
            Calcformula = exist("Warehouse Activity Line" where("Source Type"=filter(5406|5407), "Source Subtype"=filter(3), "Source No."=Field("Prod. Order No."), "Source Line No."=field("Line No."), "Activity Type"=filter(Pick)));
        }
    }
}
