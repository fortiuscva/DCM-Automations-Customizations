pageextension 52167 "THK Consumption Jounal" extends "Consumption Journal"
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
