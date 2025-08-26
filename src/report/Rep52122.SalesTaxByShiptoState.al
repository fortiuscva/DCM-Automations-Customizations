report 52122 "THK Sales Tax By Ship-to State"
{
    // EPS1.01,04/01/2020,SK: Created new report.
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SalesTaxByShiptoState.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    Caption = 'Sales Tax By Ship-to State';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1100796021; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;

            trigger OnAfterGetRecord()
            begin
                SalesInvoiceHeader.RESET;
                SalesInvoiceHeader.SETRANGE("Posting Date", StartDate, EndDate);
                SalesInvoiceHeader.SETAUTOCALCFIELDS(Amount, "Amount Including VAT");
                IF SalesInvoiceHeader.FINDSET THEN BEGIN
                    REPEAT TempSalesInvoiceHeader.INIT;
                        TempSalesInvoiceHeader."Posting Date":=SalesInvoiceHeader."Posting Date";
                        TempSalesInvoiceHeader."No.":=SalesInvoiceHeader."No.";
                        TempSalesInvoiceHeader."Sell-to Customer No.":=SalesInvoiceHeader."Sell-to Customer No.";
                        TempSalesInvoiceHeader."Sell-to Customer Name":=SalesInvoiceHeader."Sell-to Customer Name";
                        TempSalesInvoiceHeader."Order No.":=SalesInvoiceHeader."Order No.";
                        TempSalesInvoiceHeader."Ship-to City":=SalesInvoiceHeader."Ship-to City";
                        TempSalesInvoiceHeader."Ship-to County":=SalesInvoiceHeader."Ship-to County";
                        TempSalesInvoiceHeader."Ship-to Country/Region Code":=SalesInvoiceHeader."Ship-to Country/Region Code";
                        TempSalesInvoiceHeader.Amount:=SalesInvoiceHeader.Amount;
                        TempSalesInvoiceHeader."Amount Including Vat":=SalesInvoiceHeader."Amount Including VAT";
                        TempSalesInvoiceHeader."Remaining Amount":=SalesInvoiceHeader."Amount Including VAT" - SalesInvoiceHeader.Amount;
                        TempSalesInvoiceHeader.INSERT;
                    UNTIL SalesInvoiceHeader.NEXT = 0;
                END;
                SalesCrMemoHeader.RESET;
                SalesCrMemoHeader.SETRANGE("Posting Date", StartDate, EndDate);
                SalesCrMemoHeader.SETAUTOCALCFIELDS(Amount, "Amount Including VAT");
                IF SalesCrMemoHeader.FINDSET THEN BEGIN
                    REPEAT TempSalesInvoiceHeader.INIT;
                        TempSalesInvoiceHeader."Posting Date":=SalesCrMemoHeader."Posting Date";
                        TempSalesInvoiceHeader."No.":=SalesCrMemoHeader."No.";
                        TempSalesInvoiceHeader."Sell-to Customer No.":=SalesCrMemoHeader."Sell-to Customer No.";
                        TempSalesInvoiceHeader."Sell-to Customer Name":=SalesCrMemoHeader."Sell-to Customer Name";
                        TempSalesInvoiceHeader."Order No.":='';
                        TempSalesInvoiceHeader."Ship-to City":=SalesCrMemoHeader."Ship-to City";
                        TempSalesInvoiceHeader."Ship-to County":=SalesCrMemoHeader."Ship-to County";
                        TempSalesInvoiceHeader."Ship-to Country/Region Code":=SalesCrMemoHeader."Ship-to Country/Region Code";
                        TempSalesInvoiceHeader.Amount:=-1 * SalesCrMemoHeader.Amount;
                        TempSalesInvoiceHeader."Amount Including Vat":=-1 * SalesCrMemoHeader."Amount Including VAT";
                        TempSalesInvoiceHeader."Remaining Amount":=(TempSalesInvoiceHeader."Amount Including Vat") - (TempSalesInvoiceHeader.Amount);
                        TempSalesInvoiceHeader.INSERT;
                    UNTIL SalesCrMemoHeader.NEXT = 0;
                END;
            end;
        }
        dataitem(TempTable; "Integer")
        {
            DataItemTableView = SORTING(Number);

            column(PostingDate_SalesInvoiceHeader; TempSalesInvoiceHeader."Posting Date")
            {
            }
            column(SelltoCustomerName_SalesInvoiceHeader; TempSalesInvoiceHeader."Sell-to Customer Name")
            {
            }
            column(SelltoCustomerNo_SalesInvoiceHeader; TempSalesInvoiceHeader."Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceHeader; TempSalesInvoiceHeader."No.")
            {
            }
            column(OrderNo_SalesInvoiceHeader; TempSalesInvoiceHeader."Order No.")
            {
            }
            column(ShiptoCity_SalesInvoiceHeader; TempSalesInvoiceHeader."Ship-to City")
            {
            }
            column(ShiptoCounty_SalesInvoiceHeader; TempSalesInvoiceHeader."Ship-to County")
            {
            }
            column(ShiptoCountry_SalesInvoiceHeader; TempSalesInvoiceHeader."Ship-to Country/Region Code")
            {
            }
            column(Amount_SalesInvoiceHeader; TempSalesInvoiceHeader.Amount)
            {
            }
            column(AmountIncludingVAT_SalesInvoiceHeader; TempSalesInvoiceHeader."Amount Including Vat")
            {
            }
            column(Inv_SalesTax; TempSalesInvoiceHeader."Remaining Amount")
            {
            }
            trigger OnAfterGetRecord()
            begin
                IF Number = 1 THEN TempSalesInvoiceHeader.FIND('-')
                ELSE
                    TempSalesInvoiceHeader.NEXT;
            end;
            trigger OnPreDataItem()
            begin
                SETRANGE(Number, 1, TempSalesInvoiceHeader.COUNT);
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
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = all;
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = all;
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
    var SalesInvoiceHeader: Record "Sales Invoice Header";
    SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    TempSalesInvoiceHeader: Record "Sales Invoice Header Buffer" temporary;
    StartDate: Date;
    EndDate: Date;
}
