report 52101 "THK Purchase Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/THKPurchaseOrder.rdl';
    Caption = 'THK Purchase Order';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")WHERE("Document Type"=CONST(Order));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Buy-from Vendor No.", "Pay-to Vendor No.", "No. Printed";

            column(No_PurchaseHeader; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);

                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number)WHERE(Number=CONST(1));

                    column(CompanyAddress1; CompanyAddress[1])
                    {
                    }
                    column(CompanyAddress2; CompanyAddress[2])
                    {
                    }
                    column(CompanyAddress3; CompanyAddress[3])
                    {
                    }
                    column(CompanyAddress4; CompanyAddress[4])
                    {
                    }
                    column(CompanyAddress5; CompanyAddress[5])
                    {
                    }
                    column(CompanyAddress6; CompanyAddress[6])
                    {
                    }
                    column(CopyTxt; CopyTxt)
                    {
                    }
                    column(BuyFromAddress1; BuyFromAddress[1])
                    {
                    }
                    column(BuyFromAddress2; BuyFromAddress[2])
                    {
                    }
                    column(BuyFromAddress3; BuyFromAddress[3])
                    {
                    }
                    column(BuyFromAddress4; BuyFromAddress[4])
                    {
                    }
                    column(BuyFromAddress5; BuyFromAddress[5])
                    {
                    }
                    column(BuyFromAddress6; BuyFromAddress[6])
                    {
                    }
                    column(BuyFromAddress7; BuyFromAddress[7])
                    {
                    }
                    column(ExptRecptDt_PurchaseHeader; "Purchase Header"."Expected Receipt Date")
                    {
                    }
                    column(PlannedRecptDt_PurchaseHeader; PlannedRcptDateHdrVarGbl)
                    {
                    }
                    column(ShipToAddress1; ShipToAddress[1])
                    {
                    }
                    column(ShipToAddress2; ShipToAddress[2])
                    {
                    }
                    column(ShipToAddress3; ShipToAddress[3])
                    {
                    }
                    column(ShipToAddress4; ShipToAddress[4])
                    {
                    }
                    column(ShipToAddress5; ShipToAddress[5])
                    {
                    }
                    column(ShipToAddress6; ShipToAddress[6])
                    {
                    }
                    column(ShipToAddress7; ShipToAddress[7])
                    {
                    }
                    column(BuyfrVendNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
                    {
                    }
                    column(YourRef_PurchaseHeader; "Purchase Header"."Your Reference")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_PurchaseHeader; "Purchase Header"."No.")
                    {
                    }
                    column(OrderDate_PurchaseHeader; format("Purchase Header"."Order Date", 0, '<Month Text> <Closing><Day>, <Year4>'))
                    {
                    }
                    column(CompanyAddress7; CompanyAddress[7])
                    {
                    }
                    column(CompanyAddress8; CompanyAddress[8])
                    {
                    }
                    column(BuyFromAddress8; BuyFromAddress[8])
                    {
                    }
                    column(ShipToAddress8; ShipToAddress[8])
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(PaymentTermsDescription; PaymentTerms.Description)
                    {
                    }
                    column(CompanyInformationPhoneNo; CompanyInformation."Phone No.")
                    {
                    }
                    column(CompanyInfoPicture; CompanyInformation.Picture)
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(VendTaxIdentificationType; Format(Vend."Tax Identification Type"))
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
                    {
                    }
                    column(ReceiveByCaption; ReceiveByCaptionLbl)
                    {
                    }
                    column(VendorIDCaption; VendorIDCaptionLbl)
                    {
                    }
                    column(ConfirmToCaption; ConfirmToCaptionLbl)
                    {
                    }
                    column(BuyerCaption; BuyerCaptionLbl)
                    {
                    }
                    column(ShipCaption; ShipCaptionLbl)
                    {
                    }
                    column(BillToCaption; BillToCaptionLbl)
                    {
                    }
                    column(ToCaption1; ToCaption1Lbl)
                    {
                    }
                    column(PurchOrderCaption; PurchOrderCaptionLbl)
                    {
                    }
                    column(PurchOrderNumCaption; PurchOrderNumCaptionLbl)
                    {
                    }
                    column(PurchOrderDateCaption; PurchOrderDateCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(ShipViaCaption; ShipViaCaptionLbl)
                    {
                    }
                    column(TermsCaption; TermsCaptionLbl)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(TaxIdentTypeCaption; TaxIdentTypeCaptionLbl)
                    {
                    }
                    column(VendorOrderNo_Lbl; VendorOrderNoLbl)
                    {
                    }
                    column(VendorInvoiceNo_Lbl; VendorInvoiceNoLbl)
                    {
                    }
                    column(VendorOrderNo; "Purchase Header"."Vendor Order No.")
                    {
                    }
                    column(VendorInvoiceNo; "Purchase Header"."Vendor Invoice No.")
                    {
                    }
                    column(CompanyHomePageCaptionLbl; CompanyHomePageCaptionLbl)
                    {
                    }
                    column(CompanyInformation_HomePage; CompanyInformation."Home Page")
                    {
                    }
                    column(CompanyPhoneCaption; CompanyPhoneCaptionLbl)
                    {
                    }
                    column(CompanyInformation_PhoneNo; CompanyInformation."Phone No.")
                    {
                    }
                    column(CompanyEmailCaption; CompanyEmailCaptionLbl)
                    {
                    }
                    column(CompanyInformation_Email; CompanyInformation."E-Mail")
                    {
                    }
                    column(PartialShipmentCaption; PartialShipmentCaptionLbl)
                    {
                    }
                    column(InvoiceEmailCaption; InvoiceEmailCaptionLbl)
                    {
                    }
                    column(CompanyInformation_InvoiceEmail; CompanyInformation."THK Invoice E-mail")
                    {
                    }
                    column(CurrencyCodeVarGbl; CurrencyCodeVarGbl)
                    {
                    }
                    column(CurrencySignVarGbl; CurrencySignVarGbl)
                    {
                    }
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document No."=FIELD("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")WHERE("Document Type"=CONST(Order));

                        column(AmountExclInvDisc; AmountExclInvDisc)
                        {
                        }
                        column(ItemNumberToPrint; ItemNumberToPrint)
                        {
                        }
                        column(UnitofMeasure_PurchaseLine; "Unit of Measure")
                        {
                        }
                        column(Quantity_PurchaseLine; Quantity)
                        {
                        }
                        column(UnitPriceToPrint; UnitPriceToPrint)
                        {
                        DecimalPlaces = 2: 5;
                        }
                        column(Description_PurchaseLine; Description)
                        {
                        }
                        column(ItemRefDescription; ItemRefDescriptionVarGbl)
                        {
                        }
                        column(ItemDescription; ItemDescriptionVarGbl)
                        {
                        }
                        column(PrintFooter; PrintFooter)
                        {
                        }
                        column(InvDiscountAmt_PurchaseLine; "Inv. Discount Amount")
                        {
                        }
                        column(TaxAmount; TaxAmount)
                        {
                        }
                        column(LineAmtTaxAmtInvDiscountAmt; "Line Amount" + TaxAmount - "Inv. Discount Amount")
                        {
                        }
                        column(TotalTaxLabel; TotalTaxLabel)
                        {
                        }
                        column(BreakdownTitle; BreakdownTitle)
                        {
                        }
                        column(BreakdownLabel1; BreakdownLabel[1])
                        {
                        }
                        column(BreakdownAmt1; BreakdownAmt[1])
                        {
                        }
                        column(BreakdownLabel2; BreakdownLabel[2])
                        {
                        }
                        column(BreakdownAmt2; BreakdownAmt[2])
                        {
                        }
                        column(BreakdownLabel3; BreakdownLabel[3])
                        {
                        }
                        column(BreakdownAmt3; BreakdownAmt[3])
                        {
                        }
                        column(BreakdownAmt4; BreakdownAmt[4])
                        {
                        }
                        column(BreakdownLabel4; BreakdownLabel[4])
                        {
                        }
                        column(DocumentNo_PurchaseLine; "Document No.")
                        {
                        }
                        column(ItemNoCaption; ItemNoCaptionLbl)
                        {
                        }
                        column(UnitCaption; UnitCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(QuantityCaption; QuantityCaptionLbl)
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(TotalPriceCaption; TotalPriceCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(InvDiscCaption; InvDiscCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(ReceiptDateCaption; ReceiptDateCaptionLbl)
                        {
                        }
                        column(ExptRecptDt_PurchaseLine; "Expected Receipt Date")
                        {
                        }
                        column(PlannedRecptDt_PurchaseLine; "Planned Receipt Date")
                        {
                        }
                        column(TomaHawkItemNoCaption; TomaHawkItemNoCaptionLbl)
                        {
                        }
                        column(VendorItemNoCaption; VendorItemNoCaptionLbl)
                        {
                        }
                        column(Vendor_Item_No_; "Vendor Item No.")
                        {
                        }
                        column(Item_Reference_No_; "Item Reference No.")
                        {
                        }
                        column(ProdOrderNoCaption; ProdOrderNoCaptionLbl)
                        {
                        }
                        column(Prod__Order_No_; "Prod. Order No.")
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            OnLineNumber:=OnLineNumber + 1;
                            if("Purchase Header"."Tax Area Code" <> '') and not UseExternalTaxEngine then SalesTaxCalc.AddPurchLine("Purchase Line");
                            /*
                            if "Vendor Item No." <> '' then
                                ItemNumberToPrint := "Vendor Item No."
                            else
                                ItemNumberToPrint := "No.";
                            */
                            ItemNumberToPrint:="No.";
                            if Type = Type::" " then begin
                                ItemNumberToPrint:='';
                                "Unit of Measure":='';
                                "Line Amount":=0;
                                "Inv. Discount Amount":=0;
                                Quantity:=0;
                            end;
                            AmountExclInvDisc:="Line Amount";
                            if Quantity = 0 then UnitPriceToPrint:=0 // so it won't print
                            else
                                UnitPriceToPrint:=Round(AmountExclInvDisc / Quantity, 0.00001);
                            ItemReferenceRecGbl.Reset();
                            ItemReferenceRecGbl.SetRange("Item No.", "No.");
                            ItemReferenceRecGbl.SetRange("Variant Code", "Variant Code");
                            ItemReferenceRecGbl.SetRange("Unit of Measure", "Unit of Measure Code");
                            ItemReferenceRecGbl.SetRange("Reference Type", "Item Reference Type"::Vendor);
                            ItemReferenceRecGbl.SetRange("Reference Type No.", "Buy-from Vendor No.");
                            ItemReferenceRecGbl.SetRange("Reference No.", "Item Reference No.");
                            if not ItemReferenceRecGbl.FindFirst()then ItemReferenceRecGbl.Init();
                            ItemRefDescriptionVarGbl:=ItemReferenceRecGbl.Description;
                            ItemDescriptionVarGbl:=Description;
                            /*
                            if "Purchase Line"."Item Reference No." <> '' then begin
                                if not ItemRecGbl.get("No.") then
                                    ItemRecGbl.Init();
                                ItemDescriptionVarGbl := ItemRecGbl.Description;
                            end;
                            */
                            if OnLineNumber = NumberOfLines then begin
                                PrintFooter:=true;
                                if "Purchase Header"."Tax Area Code" <> '' then begin
                                    if UseExternalTaxEngine then SalesTaxCalc.CallExternalTaxEngineForPurch("Purchase Header", true)
                                    else
                                        SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                                    SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                                    BrkIdx:=0;
                                    PrevPrintOrder:=0;
                                    PrevTaxPercent:=0;
                                    TaxAmount:=0;
                                    with TempSalesTaxAmtLine do begin
                                        Reset();
                                        SetCurrentKey("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
                                        if Find('-')then repeat if("Print Order" = 0) or ("Print Order" <> PrevPrintOrder) or ("Tax %" <> PrevTaxPercent)then begin
                                                    BrkIdx:=BrkIdx + 1;
                                                    if BrkIdx > 1 then begin
                                                        if TaxArea."Country/Region" = TaxArea."Country/Region"::CA then BreakdownTitle:=Text006
                                                        else
                                                            BreakdownTitle:=Text003;
                                                    end;
                                                    if BrkIdx > ArrayLen(BreakdownAmt)then begin
                                                        BrkIdx:=BrkIdx - 1;
                                                        BreakdownLabel[BrkIdx]:=Text004;
                                                    end
                                                    else
                                                        BreakdownLabel[BrkIdx]:=CopyStr(StrSubstNo("Print Description", "Tax %"), 1, MaxStrLen(BreakdownLabel[BrkIdx]));
                                                end;
                                                BreakdownAmt[BrkIdx]:=BreakdownAmt[BrkIdx] + "Tax Amount";
                                                TaxAmount:=TaxAmount + "Tax Amount";
                                            until Next() = 0;
                                    end;
                                    if BrkIdx = 1 then begin
                                        Clear(BreakdownLabel);
                                        Clear(BreakdownAmt);
                                    end;
                                end;
                            end;
                        end;
                        trigger OnPreDataItem()
                        begin
                            Clear(AmountExclInvDisc);
                            NumberOfLines:=Count;
                            OnLineNumber:=0;
                            PrintFooter:=false;
                        end;
                    }
                }
                trigger OnAfterGetRecord()
                begin
                    if CopyNo = NoLoops then begin
                        if not CurrReport.Preview then PurchasePrinted.Run("Purchase Header");
                        CurrReport.Break();
                    end;
                    CopyNo:=CopyNo + 1;
                    if CopyNo = 1 then // Original
 Clear(CopyTxt)
                    else
                        CopyTxt:=Text000;
                    TaxAmount:=0;
                    Clear(BreakdownTitle);
                    Clear(BreakdownLabel);
                    Clear(BreakdownAmt);
                    TotalTaxLabel:=Text008;
                    if "Purchase Header"."Tax Area Code" <> '' then begin
                        TaxArea.Get("Purchase Header"."Tax Area Code");
                        case TaxArea."Country/Region" of TaxArea."Country/Region"::US: TotalTaxLabel:=Text005;
                        TaxArea."Country/Region"::CA: TotalTaxLabel:=Text007;
                        end;
                        UseExternalTaxEngine:=TaxArea."Use External Tax Engine";
                        SalesTaxCalc.StartSalesTaxCalculation();
                    end;
                end;
                trigger OnPreDataItem()
                begin
                    NoLoops:=1 + Abs(NoCopies);
                    if NoLoops <= 0 then NoLoops:=1;
                    CopyNo:=0;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                if PrintCompany then /*
                    if RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                    */
                    CurrReport.Language:=LanguageCU.GetLanguageIdOrDefault("Language Code");
                if "Purchaser Code" = '' then Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.Get("Purchaser Code");
                if "Payment Terms Code" = '' then Clear(PaymentTerms)
                else
                    PaymentTerms.Get("Payment Terms Code");
                if "Shipment Method Code" = '' then Clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");
                //FormatAddress.PurchHeaderBuyFrom(BuyFromAddress, "Purchase Header");
                //FormatAddress.PurchHeaderShipTo(ShipToAddress, "Purchase Header");
                FormatAddress.FormatAddr(BuyFromAddress, "Buy-from Vendor Name", '', '', "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from Post Code", "Buy-from County", "Buy-from Country/Region Code");
                FormatAddress.FormatAddr(ShipToAddress, "Ship-to Name", '', '', "Ship-to Address", "Ship-to Address 2", "Ship-to City", "Ship-to Post Code", "Ship-to County", "Ship-to Country/Region Code");
                if not CurrReport.Preview then begin
                    if ArchiveDocument then ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);
                    if LogInteraction then begin
                        CalcFields("No. of Archived Versions");
                        SegManagement.LogDocument(13, "No.", "Doc. No. Occurrence", "No. of Archived Versions", DATABASE::Vendor, "Buy-from Vendor No.", "Purchaser Code", '', "Posting Description", '');
                    end;
                end;
                if "Posting Date" <> 0D then UseDate:="Posting Date"
                else
                    UseDate:=WorkDate();
                PlannedRcptDateHdrVarGbl:=0D;
                PurchLineRecGbl.Reset();
                PurchLineRecGbl.SetRange("Document Type", "Document Type");
                PurchLineRecGbl.SetRange("Document No.", "No.");
                PurchLineRecGbl.SetFilter("Planned Receipt Date", '<>%1', 0D);
                if PurchLineRecGbl.FindFirst()then PlannedRcptDateHdrVarGbl:=PurchLineRecGbl."Planned Receipt Date";
                CurrencyCodeVarGbl:='';
                CurrencySignVarGbl:='';
                if "Currency Code" = '' then begin
                    CurrencyCodeVarGbl:='USD';
                    CurrencySignVarGbl:='$';
                end
                else
                begin
                    CurrencyCodeVarGbl:="Currency Code";
                    CurrencyRecGbl.reset;
                    if not CurrencyRecGbl.get("Currency Code")then CurrencyRecGbl.Init();
                    CurrencySignVarGbl:=CurrencyRecGbl.Symbol;
                end;
            end;
            trigger OnPreDataItem()
            begin
                if PrintCompany then begin
                    //FormatAddress.Company(CompanyAddress, CompanyInformation);
                    FormatAddress.FormatAddr(CompanyAddress, CompanyInformation.Name, '', '', CompanyInformation.Address, CompanyInformation."Address 2", CompanyInformation.City, CompanyInformation."Post Code", CompanyInformation.County, CompanyInformation."Country/Region Code");
                end
                else
                    Clear(CompanyAddress);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(NumberOfCopies; NoCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Number of Copies';
                        ToolTip = 'Specifies the number of copies of each blanket purchase order, in addition to the original, that you want to print.';
                    }
                    field(PrintCompanyAddress; PrintCompany)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Company Address';
                        Visible = false;
                        ToolTip = 'Specifies if you are printing on plain paper or if your company address is not pre-printed on your forms. If you do not select this field, the report will omit your company''s address.';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archive Document';
                        Enabled = ArchiveDocumentEnable;
                        ToolTip = 'Specifies if the document is archived when you run the report.';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocument then LogInteraction:=false;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if the interaction with the vendor is logged when ,you run the report.';

                        trigger OnValidate()
                        begin
                            if LogInteraction then ArchiveDocument:=ArchiveDocumentEnable;
                        end;
                    }
                }
            }
        }
        actions
        {
        }
        trigger OnInit()
        begin
            LogInteractionEnable:=true;
            ArchiveDocumentEnable:=true;
            PrintCompany:=true;
        end;
        trigger OnOpenPage()
        begin
            ArchiveDocument:=ArchiveManagement.PurchaseDocArchiveGranule();
            LogInteraction:=SegManagement.FindInteractionTemplateCode("Interaction Log Entry Document Type"::"Purch. Ord.") <> '';
            ArchiveDocumentEnable:=ArchiveDocument;
            LogInteractionEnable:=LogInteraction;
            PrintCompany:=true;
        end;
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get('');
        CompanyInformation.CalcFields(Picture);
    end;
    var UnitPriceToPrint: Decimal;
    AmountExclInvDisc: Decimal;
    ShipmentMethod: Record "Shipment Method";
    PaymentTerms: Record "Payment Terms";
    SalesPurchPerson: Record "Salesperson/Purchaser";
    CompanyInformation: Record "Company Information";
    RespCenter: Record "Responsibility Center";
    TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
    TaxArea: Record "Tax Area";
    Vend: Record Vendor;
    LanguageCU: Codeunit Language;
    CompanyAddress: array[8]of Text[100];
    BuyFromAddress: array[8]of Text[100];
    ShipToAddress: array[8]of Text[100];
    CopyTxt: Text[10];
    ItemNumberToPrint: Text[20];
    PrintCompany: Boolean;
    PrintFooter: Boolean;
    NoCopies: Integer;
    NoLoops: Integer;
    CopyNo: Integer;
    NumberOfLines: Integer;
    OnLineNumber: Integer;
    PurchasePrinted: Codeunit "Purch.Header-Printed";
    FormatAddress: Codeunit "Format Address";
    SalesTaxCalc: Codeunit "Sales Tax Calculate";
    ArchiveManagement: Codeunit ArchiveManagement;
    SegManagement: Codeunit SegManagement;
    ArchiveDocument: Boolean;
    LogInteraction: Boolean;
    TaxAmount: Decimal;
    TotalTaxLabel: Text[30];
    BreakdownTitle: Text[30];
    BreakdownLabel: array[4]of Text[30];
    BreakdownAmt: array[4]of Decimal;
    BrkIdx: Integer;
    PrevPrintOrder: Integer;
    PrevTaxPercent: Decimal;
    UseDate: Date;
    Text000: Label 'COPY';
    Text003: Label 'Sales Tax Breakdown:';
    Text004: Label 'Other Taxes';
    Text005: Label 'Total Sales Tax:';
    Text006: Label 'Tax Breakdown:';
    Text007: Label 'Total Tax:';
    Text008: Label 'Tax:';
    UseExternalTaxEngine: Boolean;
    [InDataSet]
    ArchiveDocumentEnable: Boolean;
    [InDataSet]
    LogInteractionEnable: Boolean;
    ToCaptionLbl: Label 'To:';
    ReceiveByCaptionLbl: Label 'Receive By';
    VendorIDCaptionLbl: Label 'Vendor ID';
    ConfirmToCaptionLbl: Label 'Confirm To';
    BuyerCaptionLbl: Label 'Buyer';
    ShipCaptionLbl: Label 'Ship-to Address';
    ToCaption1Lbl: Label 'To:';
    PurchOrderCaptionLbl: Label 'Purchase Order';
    PurchOrderNumCaptionLbl: Label 'Purchase Order Number:';
    PurchOrderDateCaptionLbl: Label 'Purchase Order Date:';
    PageCaptionLbl: Label 'Page:';
    ShipViaCaptionLbl: Label 'Shipment Method';
    TermsCaptionLbl: Label 'Payment Terms';
    PhoneNoCaptionLbl: Label 'Phone No.';
    TaxIdentTypeCaptionLbl: Label 'Tax Ident. Type';
    ItemNoCaptionLbl: Label 'No.';
    UnitCaptionLbl: Label 'Unit';
    DescriptionCaptionLbl: Label 'Description';
    QuantityCaptionLbl: Label 'Quantity';
    UnitPriceCaptionLbl: Label 'Unit Price';
    TotalPriceCaptionLbl: Label 'Ext. Price';
    SubtotalCaptionLbl: Label 'Subtotal:';
    InvDiscCaptionLbl: Label 'Invoice Discount:';
    TotalCaptionLbl: Label 'Total:';
    VendorOrderNoLbl: Label 'Vendor Quote #';
    VendorInvoiceNoLbl: Label 'Vendor Invoice No.';
    BillToCaptionLbl: Label 'Bill-to Address';
    ReceiptDateCaptionLbl: Label 'Receipt Date';
    TomaHawkItemNoCaptionLbl: Label 'Tomahawk Item #';
    VendorItemNoCaptionLbl: Label 'Vendor Item #';
    CompanyHomePageCaptionLbl: Label 'Website:';
    CompanyPhoneCaptionLbl: Label 'Phone No.';
    CompanyEmailCaptionLbl: Label 'Email';
    PartialShipmentCaptionLbl: Label 'Partial shipments not accepted without prior authorization';
    ItemReferenceRecGbl: Record "Item Reference";
    ItemRefDescriptionVarGbl: Text[100];
    ItemRecGbl: Record Item;
    ItemDescriptionVarGbl: Text[100];
    InvoiceEmailCaptionLbl: Label 'E-mail Invoices to';
    ProdOrderNoCaptionLbl: Label 'Prod. Order No.';
    PlannedRcptDateHdrVarGbl: Date;
    PurchLineRecGbl: Record "Purchase Line";
    CurrencySignVarGbl: Text;
    CurrencyRecGbl: Record Currency;
    CurrencyCodeVarGbl: Text;
}
