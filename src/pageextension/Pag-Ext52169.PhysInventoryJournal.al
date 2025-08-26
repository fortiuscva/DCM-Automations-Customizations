pageextension 52169 "THK Phys. Inventory Journal" extends "Phys. Inventory Journal"
{
    layout
    {
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
