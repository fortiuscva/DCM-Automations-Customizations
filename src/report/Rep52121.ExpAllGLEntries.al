report 52121 "THK Exp. All GL Entries "
{
    ApplicationArea = All;
    Caption = 'Export Sales Invoice Comb GL Entries Header and Lines';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No."=field("No.");

                trigger OnAfterGetRecord()
                var
                    ValueEntryRecLcl: Record "Value Entry";
                    GLItemLedgerRelationRecLcl: Record "G/L - Item Ledger Relation";
                    GLEntryRecLcl: Record "G/L Entry";
                begin
                    ValueEntryRecLcl.Reset();
                    ValueEntryRecLcl.SetRange("Document No.", "Document No.");
                    ValueEntryRecLcl.SetRange("Document Line No.", "Line No.");
                    if ValueEntryRecLcl.FindFirst()then begin
                        GLItemLedgerRelationRecLcl.Reset();
                        GLItemLedgerRelationRecLcl.SetRange("Value Entry No.", ValueEntryRecLcl."Entry No.");
                        if GLItemLedgerRelationRecLcl.FindSet()then repeat GLEntryRecLcl.GET(GLItemLedgerRelationRecLcl."G/L Entry No.");
                                TempExcelBufferRecGbl.NewRow();
                                TempExcelBufferRecGbl.AddColumn("Document No.", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                                TempExcelBufferRecGbl.AddColumn("Line No.", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn("No.", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::text);
                                TempExcelBufferRecGbl.AddColumn(ValueEntryRecLcl."Entry No.", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn(ValueEntryRecLcl."Cost Amount (Expected)", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn(ValueEntryRecLcl."Cost Amount (Actual)", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Entry No.", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl.Amount, False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Credit Amount", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Debit Amount", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                                TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Global Dimension 2 Code", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::text);
                            until GLItemLedgerRelationRecLcl.Next() = 0;
                    end;
                end;
            }
            trigger OnPreDataItem()
            begin
                TempExcelBufferRecGbl.AddColumn('Sales Invoice No.', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Line No.', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Item No.', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Value Entry No.', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Cost Amount(Expected)', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Cost Amount(Actual)', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('GL Entry No.', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('GL Amount', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Credit Amount', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Debit Amount', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Item Category Code', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('New Item Category Code', False, '', True, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            end;
            trigger OnAfterGetRecord()
            var
                GLEntryRecLcl: Record "G/L Entry";
            begin
                GLEntryRecLcl.reset();
                GLEntryRecLcl.SetRange("Document No.", "Sales Invoice Header"."No.");
                GLEntryRecLcl.SetRange("Source Code", 'SALES');
                GLEntryRecLcl.SetRange("Posting Date", "Sales Invoice Header"."Posting Date");
                if GLEntryRecLcl.FindSet()then repeat TempExcelBufferRecGbl.NewRow();
                        TempExcelBufferRecGbl.AddColumn("No.", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.AddColumn(0, False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn('', False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::text);
                        TempExcelBufferRecGbl.AddColumn(0, False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(0, False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(0, False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Entry No.", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl.Amount, False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Credit Amount", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Debit Amount", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(GLEntryRecLcl."Global Dimension 2 Code", False, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::text);
                    until GLEntryRecLcl.Next() = 0;
            end;
            trigger OnPostDataItem()
            begin
                TempExcelBufferRecGbl.CreateNewBook('Invoice GL Combo');
                TempExcelBufferRecGbl.WriteSheet('Invoice GL Combo', CompanyName, UserId);
                TempExcelBufferRecGbl.CloseBook();
                TempExcelBufferRecGbl.SetFriendlyFilename('Invoice GL Combo');
                TempExcelBufferRecGbl.OpenExcel();
            end;
        }
    }
    var TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
}
