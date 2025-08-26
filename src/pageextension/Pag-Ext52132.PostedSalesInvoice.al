pageextension 52132 "THK Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("THK Paid (Yes/No)"; rec."THK Paid (Yes/No)")
            {
                ApplicationArea = all;
                ToolTip = 'Specified Paid (Yes/No) based on Detailed Customer Ledger';
            }
            field("THK Payment Date"; rec."THK Payment Date")
            {
                ApplicationArea = all;
                ToolTip = 'Specified Payment Date based on Detailed Customer Ledger';
            }
        }
    }
}
