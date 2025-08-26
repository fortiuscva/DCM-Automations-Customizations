pageextension 52131 "THK Posted Sales Invoices" extends "Posted Sales Invoices"
{
    layout
    {
        addlast(Control1)
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
    actions
    {
        addlast(processing)
        {
            action("THK UpdateSalePerson")
            {
                ApplicationArea = all;
                Image = Change;
                RunObject = xmlport "THK Update SalesPerson PSI";
                Caption = 'Update SalePerson Code';
            }
            action("THK Import Sales Invoice Data")
            {
                ApplicationArea = all;
                Image = Change;
                RunObject = xmlport "THK Import Sales Invoice Data";
                Caption = 'Import Sales Invoice Data';
                Visible = false;
            }
            action("THK Import Sales Invoice Data (All entries) ")
            {
                ApplicationArea = all;
                Image = Change;
                RunObject = xmlport "THK Imp. Sales Inv. By Doc.No.";
                Caption = 'Import Sales Invoice Data All (All entries)';
            }
        }
    }
}
