tableextension 52111 "THK Sales Header" extends "Sales Header"
{
    fields
    {
        field(50105; "THK Urgent"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Urgent';

            trigger OnValidate()
            var
                SalesLineRecLcl: Record "Sales Line";
            begin
                SalesLineRecLcl.Reset();
                SalesLineRecLcl.SetRange("Document Type", rec."Document Type");
                SalesLineRecLcl.SetRange("Document No.", rec."No.");
                if SalesLineRecLcl.FindSet()then SalesLineRecLcl.ModifyAll("THK Urgent", rec."THK Urgent");
            end;
        }
        modify("Ship-to Code")
        {
        trigger OnAfterValidate()
        var
            ShipToAddrRecLcl: Record "Ship-to Address";
        begin
            if "Ship-to Code" <> '' then begin
                ShipToAddrRecLcl.Reset();
                if ShipToAddrRecLcl.Get(Rec."Sell-to Customer No.", "Ship-to Code")then begin
                    if ShipToAddrRecLcl."THK Salesperson Code" <> '' then begin
                        Rec.Validate("Salesperson Code", ShipToAddrRecLcl."THK Salesperson Code");
                    //Modify();
                    end;
                end;
            end;
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
