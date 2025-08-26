pageextension 52168 "THK Output Journal" extends "Output Journal"
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
