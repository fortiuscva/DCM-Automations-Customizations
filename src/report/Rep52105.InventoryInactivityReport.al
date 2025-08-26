report 52105 "Inventory Inactivity Report"
{
    Caption = 'Inventory Inactivity Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Inventory Posting Group", "Location Filter";

            trigger OnAfterGetRecord()
            begin
                ItemComment:='';
                InactivityDays:=0;
                LastPurchaseDate:=0D;
                LastSaleDate:=0D;
                LastNegAdjDate:=0D;
                PurchInactivityDays:=0;
                SaleInactivityDays:=0;
                NegEntInactivityDays:=0;
                DefaultBinCodeVarGbl:='';
                Item.CalcFields(Inventory); // responds to the location filter on request panel
                if(IncludeZeroQOH = false) and (Item.Inventory = 0)then CurrReport.Skip; //don't print if Qty on Hand is Zero
                ItemLedgT.Reset;
                ItemLedgT.SetCurrentKey("Item No.", "Location Code");
                ItemLedgT.SetRange("Item No.", Item."No.");
                ItemLedgT.SetRange("Location Code", MinLocationFilter, MaxLocationFilter);
                if ItemLedgT.Find('-')then begin
                    ItemLedgT2.SetCurrentKey("Item No.", "Posting Date", "Entry Type", "Location Code");
                    ItemLedgT2.SetRange("Item No.", Item."No.");
                    ItemLedgT2.SetRange("Location Code", MinLocationFilter, MaxLocationFilter);
                    ItemLedgT2.SetFilter(Quantity, '<>%1', 0);
                    ItemLedgT2.SetFilter("Entry Type", '=%1|=%2|%3', ItemLedgT2."Entry Type"::Purchase, ItemLedgT2."Entry Type"::"Positive Adjmt.", ItemLedgT2."Entry Type"::Output);
                    if ItemLedgT2.Find('+')then begin
                        LastPurchaseDate:=ItemLedgT2."Posting Date";
                        if LastPurchaseDate <> 0D then PurchInactivityDays:=WorkDate - LastPurchaseDate;
                        if(InactivityOverDays <> 0) and (PurchInactivityDays < InactivityOverDays)then CurrReport.Skip;
                        InactivityDays:=PurchInactivityDays;
                        ItemLedgT4.SetCurrentKey("Item No.", "Posting Date", "Entry Type", "Location Code");
                        ItemLedgT4.SetRange("Item No.", Item."No.");
                        ItemLedgT4.SetRange("Location Code", MinLocationFilter, MaxLocationFilter);
                        ItemLedgT4.SetFilter(Quantity, '<>%1', 0);
                        ItemLedgT4.SetFilter("Entry Type", '=%1', ItemLedgT4."Entry Type"::Sale);
                        if ItemLedgT4.Find('+')then begin
                            LastSaleDate:=ItemLedgT4."Posting Date";
                            if LastSaleDate <> 0D then SaleInactivityDays:=WorkDate - LastSaleDate;
                            if InactivityDays = 0 then InactivityDays:=SaleInactivityDays
                            else if SaleInactivityDays < InactivityDays then begin
                                    InactivityDays:=SaleInactivityDays;
                                    InactivityOption:=InactivityOption::Sale;
                                end
                                else
                                    InactivityOption:=InactivityOption::Purchase;
                            ItemComment:='Days since sold';
                            if(InactivityOverDays <> 0) and (SaleInactivityDays < InactivityOverDays)then CurrReport.Skip;
                        end;
                        ItemLedgT3.SetCurrentKey("Item No.", "Posting Date", "Entry Type", "Location Code");
                        ItemLedgT3.SetRange("Item No.", Item."No.");
                        ItemLedgT3.SetRange("Location Code", MinLocationFilter, MaxLocationFilter);
                        ItemLedgT3.SetFilter(Quantity, '<>%1', 0);
                        ItemLedgT3.SetFilter("Entry Type", '=%1|=%2', ItemLedgT3."Entry Type"::"Negative Adjmt.", ItemLedgT3."Entry Type"::Consumption);
                        if ItemLedgT3.Find('+')then begin
                            LastNegAdjDate:=ItemLedgT3."Posting Date";
                            if LastNegAdjDate <> 0D then NegEntInactivityDays:=WorkDate - LastNegAdjDate;
                            if InactivityDays = 0 then InactivityDays:=NegEntInactivityDays
                            else if NegEntInactivityDays < InactivityDays then InactivityDays:=NegEntInactivityDays;
                            ItemComment:='Days since Used';
                            if(InactivityOverDays <> 0) and (NegEntInactivityDays < InactivityOverDays)then CurrReport.Skip;
                        end;
                    end
                    else
                    begin
                        LastPurchaseDate:=0D;
                        ItemComment:='No Purch.\Positive entries.';
                        InactivityDays:=0;
                        ItemLedgT4.SetCurrentKey("Item No.", "Posting Date", "Entry Type", "Location Code");
                        ItemLedgT4.SetRange("Item No.", Item."No.");
                        ItemLedgT4.SetRange("Location Code", MinLocationFilter, MaxLocationFilter);
                        ItemLedgT4.SetFilter(Quantity, '<>%1', 0);
                        ItemLedgT4.SetFilter("Entry Type", '=%1', ItemLedgT4."Entry Type"::Sale);
                        if ItemLedgT4.Find('+')then begin
                            LastSaleDate:=ItemLedgT4."Posting Date";
                            if LastSaleDate <> 0D then SaleInactivityDays:=WorkDate - LastSaleDate;
                            InactivityDays:=SaleInactivityDays;
                            if(InactivityOverDays <> 0) and (SaleInactivityDays < InactivityOverDays)then CurrReport.Skip;
                        end;
                        ItemLedgT3.SetCurrentKey("Item No.", "Posting Date", "Entry Type", "Location Code");
                        ItemLedgT3.SetRange("Item No.", Item."No.");
                        ItemLedgT3.SetRange("Location Code", MinLocationFilter, MaxLocationFilter);
                        ItemLedgT3.SetFilter(Quantity, '<>%1', 0);
                        ItemLedgT3.SetFilter("Entry Type", '=%1|=%2', ItemLedgT3."Entry Type"::"Negative Adjmt.", ItemLedgT3."Entry Type"::Consumption);
                        if ItemLedgT3.Find('+')then begin
                            LastNegAdjDate:=ItemLedgT3."Posting Date";
                            if LastNegAdjDate <> 0D then NegEntInactivityDays:=WorkDate - LastNegAdjDate;
                            if InactivityDays = 0 then InactivityDays:=NegEntInactivityDays
                            else if NegEntInactivityDays < SaleInactivityDays then InactivityDays:=NegEntInactivityDays;
                            ItemComment:='Days since Used';
                            if(InactivityOverDays <> 0) and (NegEntInactivityDays < InactivityOverDays)then CurrReport.Skip;
                        end;
                    end;
                end
                else
                    ItemComment:='No Ledger Entries';
                ItemExtValue:=Item.Inventory * Item."Unit Cost";
                GrandItemExtValue+=ItemExtValue;
                if GetDefaultBin("No.", '', MinLocationFilter, DefaultBinCodeVarGbl)then; //CLEM1.02
                if PrintToExcel then begin
                    RowNo+=1;
                    EnterCell(RowNo, 1, Format("No."), false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 2, Format(Item.Description), false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 3, Format("Inventory Posting Group"), false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    //EnterCell(RowNo, 4, FORMAT("Shelf No."), FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 4, Format(DefaultBinCodeVarGbl), false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 5, Format(Inventory), false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 6, Format("Unit Cost"), false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 7, Format(ItemExtValue), false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 8, Format(InactivityDays), false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    EnterCell(RowNo, 9, Format(ItemComment), false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                end end;
            trigger OnPreDataItem()
            begin
                //CurrReport.CreateTotals(ItemExtValue);
                if PrintToExcel then begin
                    RowNo:=2;
                    EnterCell(RowNo, 1, 'No.', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 2, 'Description', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 3, 'Inventory Posting Group', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 4, 'Default Bin', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 5, 'Quntity on Hand', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 6, 'Unit Cost', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 7, 'Ext. Value', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 8, 'Inactivity Days', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                    EnterCell(RowNo, 9, 'Comment', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(IncludeZeroQOH; IncludeZeroQOH)
                    {
                        Caption = 'Include Zero QOH';
                        ApplicationArea = All;
                    }
                    field(InactivityOverDays; InactivityOverDays)
                    {
                        Caption = 'Only Items with Inactivity Over';
                        ApplicationArea = All;
                    }
                    field(PrintToExcel; PrintToExcel)
                    {
                        Caption = 'Print To Excel';
                        ApplicationArea = All;
                        Visible = false;
                        Editable = false;
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnInitReport()
    begin
        PrintToExcel:=true;
    end;
    trigger OnPreReport()
    begin
        TempExcelBuffer.DeleteAll;
        Clear(TempExcelBuffer);
        MinLocationFilter:='';
        MaxLocationFilter:='';
        if LocationT.ReadPermission then if Item."Location Filter" = '' then begin
                MinLocationFilter:='';
                LocationT.Reset;
                if LocationT.Find('+')then MaxLocationFilter:=LocationT.Code;
            end
            else
            begin
                MinLocationFilter:=Item.GetRangeMin("Location Filter");
                MaxLocationFilter:=Item.GetRangeMax("Location Filter");
            end;
        LocationFilterText:=Item.GetFilters;
        if LocationFilterText = '' then LocationFilterText:='ALL Locations';
        //Reports Pack
        ReportFilters:=Item.GetFilters;
        ReportID:=CurrReport.ObjectId;
    //Reports Pack
    end;
    trigger OnPostReport()
    begin
        TempExcelBuffer.CreateNewBook(ReportCaptionLbl);
        TempExcelBuffer.WriteSheet(ReportCaptionLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(ReportCaptionLbl);
        TempExcelBuffer.OpenExcel();
    end;
    var ItemExtValue: Decimal;
    ItemLedgT: Record "Item Ledger Entry";
    ItemLedgT2: Record "Item Ledger Entry";
    ItemLedgT3: Record "Item Ledger Entry";
    ItemLedgT4: Record "Item Ledger Entry";
    IncludeZeroQOH: Boolean;
    LastPurchaseDate: Date;
    LastSaleDate: Date;
    ItemComment: Text[50];
    InactivityDays: Integer;
    InactivityOverDays: Integer;
    MinLocationFilter: Code[10];
    MaxLocationFilter: Code[10];
    LocationT: Record Location;
    LocationFilterText: Text[250];
    ReportFilters: Text[250];
    ReportID: Text[50];
    LastNegAdjDate: Date;
    PurchInactivityDays: Integer;
    SaleInactivityDays: Integer;
    NegEntInactivityDays: Integer;
    InactivityOption: Option " ", Purchase, Sale, Neg;
    Text000: Label 'Days';
    Text001: Label 'Days';
    Inventory_Inactivity_ReportCaptionLbl: Label 'Inventory Inactivity Report';
    CurrReport_PAGENOCaptionLbl: Label 'Page';
    Ext__ValueCaptionLbl: Label 'Ext. Value';
    CommentCaptionLbl: Label 'Comment';
    Inactivity_DaysCaptionLbl: Label 'Inactivity Days';
    RowNo: Integer;
    TempExcelBuffer: Record "Excel Buffer" temporary;
    PrintToExcel: Boolean;
    GrandItemExtValue: Decimal;
    DefaultBinCodeVarGbl: Code[20];
    Text50000: Label 'Default Bin';
    ReportCaptionLbl: Label 'Inventory Inactivity Report';
    local procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean; Italic: Boolean; UnderLine: Boolean; Format: Text[30]; CellType: Option)
    begin
        TempExcelBuffer.Init;
        TempExcelBuffer.Validate("Row No.", RowNo);
        TempExcelBuffer.Validate("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text":=CellValue;
        TempExcelBuffer.Formula:='';
        TempExcelBuffer.Bold:=Bold;
        TempExcelBuffer.Italic:=Italic;
        TempExcelBuffer.Underline:=UnderLine;
        TempExcelBuffer.NumberFormat:=Format;
        TempExcelBuffer."Cell Type":=CellType;
        TempExcelBuffer.Insert;
    end;
    procedure GetDefaultBin(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]; var BinCode: Code[20]): Boolean var
        BinContent: Record "Bin Content";
    begin
        BinContent.SetCurrentKey(Default);
        BinContent.SetRange(Default, true);
        if LocationCode <> '' then BinContent.SetRange("Location Code", LocationCode);
        BinContent.SetRange("Item No.", ItemNo);
        if VariantCode <> '' then BinContent.SetRange("Variant Code", VariantCode);
        if BinContent.FindFirst then begin
            BinCode:=BinContent."Bin Code";
            exit(true);
        end;
    end;
}
