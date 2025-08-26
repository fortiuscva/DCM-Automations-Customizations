pageextension 52166 "THK Item Reclass Journal" extends "Item Reclass. Journal"
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
