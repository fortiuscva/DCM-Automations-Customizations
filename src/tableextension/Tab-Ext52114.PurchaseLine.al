tableextension 52114 "THK Purchase Line" extends "Purchase Line"
{
    fields
    {
        Modify("No.")
        {
        trigger OnAfterValidate()
        var
            ItemRecLcl: Record Item;
        begin
            if(Rec.Type = Rec.Type::Item) and (Rec."No." <> xRec."No.")then begin
                if Rec."No." <> '' then begin
                    ItemRecLcl.Get(Rec."No.");
                    Validate("THK Allow Negative Profit", ItemRecLcl."THK Allow Negative Profit");
                end
                else
                    Validate("THK Allow Negative Profit", false);
            end;
            ShowCostWarning;
        end;
        }
        modify("Unit Cost (LCY)")
        {
        trigger OnAfterValidate()
        begin
            ShowCostWarning();
        end;
        }
        modify("Unit Price (LCY)")
        {
        trigger OnAfterValidate()
        begin
            ShowCostWarning();
        end;
        }
        field(50000; "THK Assigned User ID"; Text[50])
        {
            Caption = 'Assigned User ID';
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."Assigned User ID" where("Document Type"=field("Document Type"), "No."=field("Document No.")));
            Editable = false;
        }
        field(52104; "THK Allow Negative Profit"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Negative Profit';
            Editable = false;
        }
        field(52105; "THK Consignment"; Boolean)
        {
            Caption = 'Consignment';
            DataClassification = ToBeClassified;
        }
    }
    procedure ShowCostWarning()
    var
        ShowMsgVarLcl: Boolean;
    begin
        clear(ShowMsgVarLcl);
        if(Rec.Type = Rec.Type::Item) and ("No." <> '')then begin
            if(Rec."Unit Cost (LCY)" = 0) or (Rec."Unit Cost (LCY)" > Rec."Unit Price (LCY)")then if not "THK Allow Negative Profit" then ShowMsgVarLcl:=true;
        end;
        if Rec."Unit Price (LCY)" <= 0.01 then ShowMsgVarLcl:=false;
        if ShowMsgVarLcl then Message(CostWarningMsg);
    end;
    var CostWarningMsg: Label 'Please note that the Cost is Zero or Higher than the Price.';
}
