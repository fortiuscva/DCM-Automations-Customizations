pageextension 52110 "THK Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("THK Urgent"; rec."THK Urgent")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addafter("Report Picking List by Order")
        {
            action("THK Report Picking List by Order")
            {
                ApplicationArea = All;
                Caption = 'THK Picking List by Order';
                Image = "Report";
                ToolTip = 'View the picking list for orders to be filled. This report starts each order on a new page and will list all items. For items using the Specific costing method, you can capture the serial number in the document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader:=Rec;
                    SalesHeader.SetRecFilter();
                    REPORT.RunModal(REPORT::"THK Picking List by Order", true, false, SalesHeader);
                end;
            }
        }
    }
}
