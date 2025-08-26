report 52110 "THK IC-DISC report"
{
    Caption = 'IC-DISC report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Country/Region Code";

            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Sell-to Customer No."=field("No.");
                CalcFields = "THK Paid (Yes/No)", "THK Payment Date";
                RequestFilterFields = "Posting Date", "THK Paid (Yes/No)", "THK Payment Date";

                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLinkReference = "Sales Invoice Header";
                    DataItemLink = "Document No."=field("No.");
                    DataItemTableView = sorting("Document No.", "Line No.");

                    trigger OnAfterGetRecord()
                    begin
                        ValueEntryRecLbl.Reset();
                        ValueEntryRecLbl.SetCurrentKey("Source Type", "Source No.", "Item Ledger Entry Type", "Item No.", "Posting Date");
                        ValueEntryRecLbl.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                        ValueEntryRecLbl.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                        ValueEntryRecLbl.SetRange("Source Type", ValueEntryRecLbl."Source Type"::Customer);
                        ValueEntryRecLbl.SetRange("Item Ledger Entry Type", ValueEntryRecLbl."Item Ledger Entry Type"::Sale);
                        ValueEntryRecLbl.SetRange("Expected Cost", false);
                        if not ValueEntryRecLbl.FindFirst()then ValueEntryRecLbl.Init();
                        MakeExcelDataBody();
                    end;
                }
            }
        }
    }
    trigger OnPostReport()
    begin
        CreateExcelbook();
    end;
    trigger OnPreReport()
    begin
        MakeExcelDataHeader();
    end;
    var ValueEntryRecLbl: Record "Value Entry";
    ExcelBuf: Record "Excel Buffer" temporary;
    PostingDateErrorVarLbl: Label 'Please enter Posting date filter.';
    Text000VarLbl: Label 'Item No.';
    Text001VarLbl: Label 'Invoice No.';
    Text002VarLbl: Label 'Invoice Date';
    Text003VarLbl: Label 'Paid (Yes/No)';
    Text004VarLbl: Label 'Payment Date';
    Text005VarLbl: Label 'Invoiced Quantity';
    Text006VarLbl: Label 'Sales Amount (Actual)';
    Text007VarLbl: Label 'Cost Amount';
    Text008VarLbl: Label 'Profit';
    Text009VarLbl: Label 'Data';
    Text010VarLbl: Label 'IC DIS';
    Text011VarLbl: Label 'Country Code';
    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow();
        ExcelBuf.AddColumn(Customer.FieldCaption("No."), false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Customer.FieldCaption(Name), false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text011VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text000VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line".FieldCaption(Description), false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text001VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text002VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text003VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text004VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text005VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line".FieldCaption("Unit of Measure"), false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text006VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text007VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Text008VarLbl, false, '', true, false, true, '', ExcelBuf."Cell Type"::Text);
    end;
    local procedure MakeExcelDataBody()
    begin
        //Type = Item
        if "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item then begin
            if abs(ValueEntryRecLbl."Invoiced Quantity") > 0 then begin
                ExcelBuf.NewRow();
                ExcelBuf.AddColumn(Customer."No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(Customer.Name, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Country/Region Code", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn("Sales Invoice Line"."No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn("Sales Invoice Line".Description, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn("Sales Invoice Header"."No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn("Sales Invoice Header"."Posting Date", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(Format("Sales Invoice Header"."THK Paid (Yes/No)"), false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(Format("Sales Invoice Header"."THK Payment Date"), false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(Format(abs(ValueEntryRecLbl."Invoiced Quantity")), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
                ExcelBuf.AddColumn("Sales Invoice Line"."Unit of Measure", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(Format(abs(ValueEntryRecLbl."Sales Amount (Actual)")), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
                ExcelBuf.AddColumn(Format(abs(ValueEntryRecLbl."Cost Amount (Actual)")), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
                ExcelBuf.AddColumn(Format(abs(ValueEntryRecLbl."Sales Amount (Actual)") - abs(ValueEntryRecLbl."Cost Amount (Actual)")), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
            end;
        end;
        //Type = Resource
        if "Sales Invoice Line".Type = "Sales Invoice Line".Type::Resource then begin
            ExcelBuf.NewRow();
            ExcelBuf.AddColumn(Customer."No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn(Customer.Name, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Country/Region Code", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn("Sales Invoice Line"."No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn("Sales Invoice Line".Description, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn("Sales Invoice Header"."No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn("Sales Invoice Header"."Posting Date", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn(Format("Sales Invoice Header"."THK Paid (Yes/No)"), false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn(Format("Sales Invoice Header"."THK Payment Date"), false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn(Format("Sales Invoice Line".Quantity), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
            ExcelBuf.AddColumn("Sales Invoice Line"."Unit of Measure", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddColumn(Format("Sales Invoice Line"."Line Amount"), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
            ExcelBuf.AddColumn(Format("Sales Invoice Line"."Line Amount"), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
            ExcelBuf.AddColumn(Format(0), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
        end;
    end;
    local procedure CreateExcelbook()
    begin
        ExcelBuf.CreateNewBook(Text009VarLbl);
        ExcelBuf.WriteSheet(Text010VarLbl, CompanyName(), UserId());
        ExcelBuf.CloseBook();
        ExcelBuf.OpenExcel();
    end;
}
