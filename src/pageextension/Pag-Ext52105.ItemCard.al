pageextension 52105 "THK Item Card" extends "Item Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part("THK Item Prod. Design factBox"; "THK Item Prod. Design factBox")
            {
                ApplicationArea = all;
                Caption = 'Item Prod. Design';
                SubPageLink = "No."=field("No.");
            }
        }
        addafter(Description)
        {
            field("THK Purchaser Code"; Rec."THK Purchaser Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Purchase Code.';
            }
            field("THK LAX Schedule B Code"; Rec."LAX Schedule B Code")
            {
                ApplicationArea = All;
                ToolTip = 'Schedule B Code.';
            }
        }
        addlast(Item)
        {
            field("THK RED_Item"; rec."THK RED_Item")
            {
                Caption = 'RED_Item';
                ApplicationArea = all;
                ToolTip = 'Specified Red Item';
            }
        }
        addlast("Posting Details")
        {
            field("THK PPI Code"; Rec."THK PPI Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PPI Code field.';
            }
        }
        addafter("Over-Receipt Code")
        {
            field("THK Blanket Lead Time"; rec."THK Blanket Lead Time")
            {
                ApplicationArea = all;
            }
        }
        addlast("Cost Details")
        {
            field("THK Allow Negative Profit"; Rec."THK Allow Negative Profit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Negative Profit field.';
            }
        }
        addafter("Order Multiple")
        {
            field("THK Planning Approved By"; Rec."THK Planning Approved By")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Plannign Approved By field.';
            }
            field("THK Planning Approved Date"; Rec."THK Planning Approved Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Plannign Approved Date field.';
            }
        }
    }
}
