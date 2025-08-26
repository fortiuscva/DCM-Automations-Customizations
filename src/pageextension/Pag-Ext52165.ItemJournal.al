pageextension 52165 "THK Item Journal" extends "Item Journal"
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
