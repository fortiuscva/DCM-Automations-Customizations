pageextension 52104 "THK Item List" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("THK Purchaser Code"; Rec."THK Purchaser Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Purchase Code';
            }
        }
        addlast(Control1)
        {
            field("THK RED_Item"; rec."THK RED_Item")
            {
                Caption = 'RED_Item';
                ApplicationArea = all;
                ToolTip = 'Specified Red Item';
            }
            field("THK PPI Code"; Rec."THK PPI Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PPI Code field.';
            }
        }
    }
}
