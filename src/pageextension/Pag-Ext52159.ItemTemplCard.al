pageextension 52159 "THK Item Templ. Card" extends "Item Templ. Card"
{
    layout
    {
        addafter("No. Series")
        {
            field("THK Purchaser Code"; Rec."THK Purchaser Code")
            {
                ApplicationArea = all;
                ToolTip = 'Purchaser Code';
            }
            /* field("THK Schedule B Code"; Rec."THK Schedule B Code")
            {
                ApplicationArea = all;
                ToolTip = 'Schedule B Code';
                Visible = false;
            } */
            field("THK LAX Schedule B Code"; Rec."LAX Schedule B Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the LAX Schedule B Code field.';
            }
        }
        addafter("Default Deferral Template Code")
        {
            field("THK PPI Code"; Rec."THK PPI Code")
            {
                ApplicationArea = all;
                ToolTip = 'PPI Code';
            }
        }
    }
}
