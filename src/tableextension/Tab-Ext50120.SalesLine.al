tableextension 50120 "THK Sales Line" extends "Sales Line"
{
    fields
    {
        Modify("No.")
        {
        trigger OnAfterValidate()
        var
            SalesHeaderRecLcl: Record "Sales Header";
            ItemRecLcl: Record Item;
        begin
            if SalesHeaderRecLcl.get(Rec."Document Type", rec."Document No.")then rec."THK Urgent":=SalesHeaderRecLcl."THK Urgent";
            if(Rec.Type = Rec.Type::Item) and (Rec."No." <> xRec."No.")then begin
                if Rec."No." <> '' then begin
                    ItemRecLcl.Get(Rec."No.");
                    Validate("THK Allow Negative Profit", ItemRecLcl."THK Allow Negative Profit");
                    Validate("THK Purchaser Code", ItemRecLcl."THK Purchaser Code");
                end
                else
                begin
                    Validate("THK Allow Negative Profit", false);
                    Validate("THK Purchaser Code", '');
                end;
            end;
            ShowCostWarning;
        end;
        }
        modify(Quantity)
        {
        trigger OnAfterValidate()
        begin
            Validate("THK Qty. to Partial", Quantity);
            validate("THK Original Qty", rec.Quantity);
        end;
        }
        modify("Unit Cost (LCY)")
        {
        trigger OnAfterValidate()
        begin
            if CurrFieldNo = FieldNo("Unit Cost (LCY)")then ShowCostWarning();
        end;
        }
        modify("Unit Price")
        {
        trigger OnAfterValidate()
        begin
            if CurrFieldNo = FieldNo("Unit Price")then ShowCostWarning();
        end;
        }
        field(50100; "THK Qty. to Partial"; Decimal)
        {
            Caption = 'Qty. to Partial';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
            // if "THK Qty. to Partial" > "Outstanding Quantity" then
            //     Error(QtyToPartialExceededErrLbl);
            end;
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
    trigger OnInsert()
    var
        SalesHeaderRecLcl: Record "Sales Header";
    begin
        if SalesHeaderRecLcl.get(Rec."Document Type", rec."Document No.")then rec."THK Urgent":=SalesHeaderRecLcl."THK Urgent";
    end;
    procedure ShowCostWarning()
    var
        ShowMsgVarLcl: Boolean;
    begin
        clear(ShowMsgVarLcl);
        if(Rec.Type = Rec.Type::Item) and ("No." <> '')then begin
            if(Rec."Unit Cost (LCY)" = 0)then ShowMsgVarLcl:=true;
            if(Rec."Unit Price" <> 0) and (Rec."Unit Cost (LCY)" > Rec."Unit Price")then ShowMsgVarLcl:=true;
        end;
        if Rec."Unit Price" <= 0.01 then ShowMsgVarLcl:=false;
        if "THK Allow Negative Profit" then ShowMsgVarLcl:=false;
        if ShowMsgVarLcl then Message(CostWarningMsg);
    end;
    Var QtyToPartialExceededErrLbl: Label 'Qty. to Partial cannot exceed Outstanding Qty.';
    CostWarningMsg: Label 'Please note that the Cost is Zero or Higher than the Price.';
}
