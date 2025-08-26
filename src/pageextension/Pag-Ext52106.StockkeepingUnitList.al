pageextension 52106 "THK Stockkeeping Unit List" extends "Stockkeeping Unit List"
{
    layout
    {
        addafter(Description)
        {
            field("THK Purchaser Code"; Rec."THK Purchaser Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Purchase Code.';
            }
        }
    }
}
