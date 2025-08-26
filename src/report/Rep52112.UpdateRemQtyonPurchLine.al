report 52112 "Update Rem. Qty on Purch. Line"
{
    ApplicationArea = All;
    Caption = 'Update Rem. Qty on Purch. Line';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(PurchaseLine; "Purchase Line")
        {
            DataItemTableView = sorting("Document Type", "Document No.", "Line No.")where("Document Type"=const(Order), "Document No."=filter('PO-401327'), "Line No."=filter(10000));

            trigger OnPreDataItem()
            begin
            end;
            trigger OnAfterGetRecord()
            begin
                "Qty. Rcd. Not Invoiced":=0;
                "Qty. Rcd. Not Invoiced (Base)":=0;
                "Amt. Rcd. Not Invoiced":=0;
                "Quantity Invoiced":=100;
                "Amt. Rcd. Not Invoiced (LCY)":=0; //454;
                "A. Rcd. Not Inv. Ex. VAT (LCY)":=0;
                "Qty. Invoiced (Base)":=100;
                Modify();
            end;
        }
    }
}
