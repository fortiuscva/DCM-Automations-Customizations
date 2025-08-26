report 52104 "THK WI Mfg Credit Report"
{
    ApplicationArea = All;
    Caption = 'WI Mfg Credit Report';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Posting Date", "No.";

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No."=field("No.");
                DataItemTableView = sorting("Document No.", "Line No.")where(Type=const(Item), Quantity=FILTER('<>0'));

                trigger OnAfterGetRecord()
                var
                    ItemRecLcl: Record Item;
                begin
                    if not ItemRecLcl.get("No.")then ItemRecLcl.init;
                    RowNo+=1;
                    EnterCell(RowNo, 1, format("Sales Invoice Header"."Posting Date"), false, false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                    EnterCell(RowNo, 2, format("No."), false, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 3, format(Description), false, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 4, format(ItemRecLcl."Item Category Code"), false, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 5, format(ItemRecLcl."Replenishment System"), false, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 6, format(Quantity), false, false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 7, format("Unit Price"), false, false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 8, format("Amount Including VAT"), false, false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 9, format("Unit Cost (LCY)"), false, false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 10, format(("Unit Cost (LCY)" * Quantity)), false, false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 11, format("Sales Invoice Header"."Order No."), false, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 12, format("Document No."), false, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 13, format("Sales Invoice Header"."External Document No."), false, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                end;
            }
            trigger OnAfterGetRecord()
            begin
            end;
            trigger OnPreDataItem()
            begin
                RowNo:=1;
                EnterCell(RowNo, 1, GetFilters, true, false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                RowNo+=2;
                EnterCell(RowNo, 1, 'Posting Date', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 2, 'Item No.', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 3, 'Item Description', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 4, 'Prod. Category', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 5, 'Purch or Mfg', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 6, 'Qty. Shipped', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 7, 'Unit Price', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 8, 'Sales Amount', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 9, 'Unit Cost', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 10, 'Cost Amount', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 11, 'Order No', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 12, 'Invoice No', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
                EnterCell(RowNo, 13, 'Customer PO No.', true, false, true, false, '', TempExcelBuffer."Cell Type"::Text);
            end;
        }
    }
    trigger OnPreReport()
    begin
        TempExcelBuffer.DeleteAll();
        Clear(TempExcelBuffer);
    end;
    trigger OnPostReport()
    begin
        TempExcelBuffer.CreateNewBook(ReportCaptionLbl);
        TempExcelBuffer.WriteSheet(ReportCaptionLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(ReportCaptionLbl);
        TempExcelBuffer.OpenExcel();
    end;
    var RowNo: Integer;
    TempExcelBuffer: Record "Excel Buffer" temporary;
    ReportCaptionLbl: Label 'WI Mfg Credit Report';
    local procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean; Italic: Boolean; UnderLine: Boolean; DoubleUnderLine: Boolean; Format: Text[30]; CellType: Option)
    begin
        TempExcelBuffer.Init();
        TempExcelBuffer.Validate("Row No.", RowNo);
        TempExcelBuffer.Validate("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text":=CellValue;
        TempExcelBuffer.Formula:='';
        TempExcelBuffer.Bold:=Bold;
        TempExcelBuffer.Italic:=Italic;
        if DoubleUnderLine = true then begin
            TempExcelBuffer."Double Underline":=true;
            TempExcelBuffer.Underline:=false;
        end
        else
        begin
            TempExcelBuffer."Double Underline":=false;
            TempExcelBuffer.Underline:=UnderLine;
        end;
        TempExcelBuffer.NumberFormat:=Format;
        TempExcelBuffer."Cell Type":=CellType;
        TempExcelBuffer.Insert();
    end;
}
