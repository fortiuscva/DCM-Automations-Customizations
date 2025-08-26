tableextension 52126 "THK Purchase Header" extends "Purchase Header"
{
    fields
    {
        /*
        modify("Location Code")
        {
            trigger OnAfterValidate()
            var
                Location: Record Location;
            begin
                if Location.Get(Rec."Location Code") then begin
                    Rec."THK Consignment" := Location."THK Consignment";
                    //Rec.modify();
                end;
            end;
        }
        */
        field(52100; "THK Consignment"; Boolean)
        {
            Caption = 'Consignment';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                PurchaseLine: Record "Purchase Line";
            begin
                PurchaseLine.SetRange("Document Type", Rec."Document Type");
                PurchaseLine.SetRange("Document No.", Rec."No.");
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                if PurchaseLine.IsEmpty then exit;
                PurchaseLine.FindSet();
                repeat //CONSIGN
                    PurchaseLine."THK Consignment":=Rec."THK Consignment";
                    PurchaseLine.Validate("Gen. Prod. Posting Group", 'CONSIGN');
                    PurchaseLine.validate("Posting Group", 'CONSIGN');
                    PurchaseLine.Modify();
                until purchaseline.Next() = 0;
            //PurchaseLine.ModifyAll("THK Consignment", Rec."THK Consignment");
            end;
        }
        modify("Posting Date")
        {
        trigger OnAfterValidate()
        var
            MiscFunctions: Codeunit "THK Misc. Functions";
        begin
            MiscFunctions.CheckPostingDate(Rec."Posting Date");
        end;
        }
    }
}
