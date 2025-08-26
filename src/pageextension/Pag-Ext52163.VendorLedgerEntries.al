pageextension 52163 "THK Vendor Ledger Entries" extends "Vendor Ledger Entries"
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
