xmlport 52103 "THK Imp. Sales Inv. By Doc.No."
{
    Caption = 'Import Sales Invoice Data By Doc. No.';
    Direction = Import;
    Format = VariableText;
    Permissions = tabledata "Sales Invoice Line"=rmid,
        tabledata "G/L Entry"=rmid,
        tabledata "Value Entry"=rmid;

    schema
    {
    textelement(SalesInvoices)
    {
    tableelement(Integer;
    Integer)
    {
    UseTemporary = true;
    AutoReplace = false;
    AutoSave = false;
    AutoUpdate = false;

    textelement(SalesInvoiceNo)
    {
    }
    textelement(LineNo)
    {
    }
    textelement(ItemNo)
    {
    }
    textelement(ValueEntryNo)
    {
    }
    textelement(CostAmountExpected)
    {
    }
    textelement(CostAmountActual)
    {
    }
    textelement(GLEntryNo)
    {
    }
    textelement(GLAmount)
    {
    }
    textelement(CreditAmount)
    {
    }
    textelement(DebitAmount)
    {
    }
    textelement(ItemCategoryCode)
    {
    }
    textelement(NewItemCategoryCode)
    {
    }
    trigger OnAfterInsertRecord()
    var
        SalesInvLine: Record "Sales Invoice Line";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        ValueEntryRecLcl: Record "Value Entry";
        GLItemLedgerRelationRecLcl: Record "G/L - Item Ledger Relation";
        GLEntryRecLcl: Record "G/L Entry";
        DimMgt: Codeunit DimensionManagement;
        OldDimSetID: Integer;
        NewDimSetID: Integer;
        DimensionCode: label 'ITEM CATEGORY';
    begin
        if not HeaderLineVarGbl then begin
            if LineNo <> '0' then begin
                if SalesInvLine.Get(SalesInvoiceNo, LineNo)then begin
                    OldDimSetID:=SalesInvLine."Dimension Set ID";
                    DimMgt.GetDimensionSet(TempDimSetEntry, SalesInvLine."Dimension Set ID");
                    TempDimSetEntry.Reset();
                    TempDimSetEntry.SetRange("Dimension Code", DimensionCode);
                    if TempDimSetEntry.FindFirst()then begin
                        TempDimSetEntry.Validate("Dimension Value Code", NewItemCategoryCode);
                        TempDimSetEntry.Modify();
                    end
                    else
                    begin
                        TempDimSetEntry.Init();
                        TempDimSetEntry.Validate("Dimension Code", DimensionCode);
                        TempDimSetEntry.Validate("Dimension Value Code", NewItemCategoryCode);
                        TempDimSetEntry.Insert();
                    end;
                    NewDimSetID:=DimMgt.GetDimensionSetID(TempDimSetEntry);
                    if OldDimSetID <> NewDimSetID then begin
                        SalesInvLine."Dimension Set ID":=NewDimSetID;
                        SalesInvLine."Shortcut Dimension 2 Code":=NewItemCategoryCode;
                        SalesInvLine."Item Category Code":=NewItemCategoryCode;
                        SalesInvLine.Modify();
                        ValueEntryRecLcl.Reset();
                        ValueEntryRecLcl.SetRange("Document No.", SalesInvLine."Document No.");
                        ValueEntryRecLcl.SetRange("Document Line No.", SalesInvLine."Line No.");
                        if ValueEntryRecLcl.FindFirst()then begin
                            GLItemLedgerRelationRecLcl.Reset();
                            GLItemLedgerRelationRecLcl.SetRange("Value Entry No.", ValueEntryRecLcl."Entry No.");
                            if GLItemLedgerRelationRecLcl.FindSet()then repeat if GLEntryRecLcl.GET(GLItemLedgerRelationRecLcl."G/L Entry No.")then begin
                                        GLEntryRecLcl."Dimension Set ID":=NewDimSetID;
                                        GLEntryRecLcl."Global Dimension 2 Code":=NewItemCategoryCode;
                                        GLEntryRecLcl.Modify();
                                    end;
                                until GLItemLedgerRelationRecLcl.Next() = 0;
                            ValueEntryRecLcl."Dimension Set ID":=NewDimSetID;
                            ValueEntryRecLcl."Global Dimension 2 Code":=NewItemCategoryCode;
                            ValueEntryRecLcl.Modify();
                        end;
                    end;
                end;
            end
            else
            begin
                GLEntryRecLcl.get(GLEntryNo);
                OldDimSetID:=GLEntryRecLcl."Dimension Set ID";
                DimMgt.GetDimensionSet(TempDimSetEntry, GLEntryRecLcl."Dimension Set ID");
                TempDimSetEntry.Reset();
                TempDimSetEntry.SetRange("Dimension Code", DimensionCode);
                if TempDimSetEntry.FindFirst()then begin
                    TempDimSetEntry.Validate("Dimension Value Code", NewItemCategoryCode);
                    TempDimSetEntry.Modify();
                end
                else
                begin
                    TempDimSetEntry.Init();
                    TempDimSetEntry.Validate("Dimension Code", DimensionCode);
                    TempDimSetEntry.Validate("Dimension Value Code", NewItemCategoryCode);
                    TempDimSetEntry.Insert();
                end;
                NewDimSetID:=DimMgt.GetDimensionSetID(TempDimSetEntry);
                GLEntryRecLcl."Dimension Set ID":=NewDimSetID;
                GLEntryRecLcl."Global Dimension 2 Code":=NewItemCategoryCode;
                GLEntryRecLcl.Modify();
            end;
        end;
        if HeaderLineVarGbl then HeaderLineVarGbl:=false;
    end;
    }
    }
    }
    trigger OnPreXmlPort()
    begin
        HeaderLineVarGbl:=true;
    end;
    var HeaderLineVarGbl: Boolean;
}
