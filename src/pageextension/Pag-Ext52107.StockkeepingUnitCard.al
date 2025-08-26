pageextension 52107 "THK Stockkeeping Unit Card" extends "Stockkeeping Unit Card"
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
        addafter("Order Multiple")
        {
            field("THK Planning Approved By"; Rec."THK Planning Approved By")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planning Approved By field.';
            }
            field("THK Planning Approved Date"; Rec."THK Planning Approved Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planning Approved Date field.';
            }
        }
    }
}
