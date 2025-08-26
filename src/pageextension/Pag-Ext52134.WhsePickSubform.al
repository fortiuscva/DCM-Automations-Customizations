pageextension 52134 "THK Whse. Pick Subform" extends "Whse. Pick Subform"
{
    layout
    {
        addafter("Item No.")
        {
            field("THK BOM No."; rec."THK BOM No.")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        ProdOrderLineVarGbl: Record "Prod. Order Line";
    begin
        if rec."Source Document" = rec."Source Document"::"Prod. Consumption" then begin
            ProdOrderLineVarGbl.Reset();
            ProdOrderLineVarGbl.SetRange("Prod. Order No.", rec."Whse. Document No.");
            ProdOrderLineVarGbl.SetRange("Line No.", rec."Whse. Document Line No.");
            if ProdOrderLineVarGbl.FindFirst()then rec."THK BOM No.":=ProdOrderLineVarGbl."Item No.";
        end;
    end;
}
