pageextension 52162 "THK Item Ledger Entries" extends "Item LEdger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Purchase Order No."; Rec."THK Purchase Order No.")
            {
                ToolTip = 'Purchase Order No.';
                ApplicationArea = all;
            }
        }
    }
}
