tableextension 52137 "THK Produciton Bom Line" extends "Production Bom Line"
{
    fields
    {
        modify("No.")
        {
        trigger OnBeforeValidate()
        begin
            CheckIfEnteredItemIsDuplicate();
        end;
        }
    }
    local procedure CheckIfEnteredItemIsDuplicate()
    var
        ProductionBOMLine: Record "Production BOM Line";
        ConfirmationDialogue: Codeunit "Confirm Management";
    begin
        if(Rec.Type <> Rec.Type::Item) or (Rec."No." = '')then exit;
        ProductionBOMLine.SetFilter("Line No.", '<>%1', Rec."Line No.");
        ProductionBOMLine.SetRange("Production BOM No.", Rec."Production BOM No.");
        ProductionBOMLine.SetRange("No.", Rec."No.");
        ProductionBOMLine.SetRange(Type, Rec.Type::Item);
        ProductionBOMLine.SetRange("Version Code", Rec."Version Code");
        if not ProductionBOMLine.IsEmpty then if not ConfirmationDialogue.GetResponseOrDefault(ResponseQst, false)then Error('');
    end;
    var ResponseQst: Label 'Duplicate Item has been entered. Would you like to continue?';
}
