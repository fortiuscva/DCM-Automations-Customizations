pageextension 52157 "THK Item Planning FactBox" extends "Item Planning FactBox"
{
    layout
    {
        addafter("Dampener Quantity")
        {
            field("THK Planning Approved By"; Rec."THK Planning Approved By")
            {
                ApplicationArea = all;
                Tooltip = 'Plannign Approved By';
            }
            field("THK Planning Approved Date"; Rec."THK Planning Approved Date")
            {
                ApplicationArea = all;
                Tooltip = 'Plannign Approved Date';
            }
        }
    }
}
