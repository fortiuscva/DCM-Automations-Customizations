report 52114 "THK Rolled-up Curr Cost Shares"
{
    // version MP13.0.00
    // //MP Original Design 1/6/06
    // 
    // This reports prints the details related to how current cost is calculated.
    // If the calculation date use on this report, is in the future, then the
    // report will calculate the current cost based on future settings of
    // BOM and Router revisions.
    // 
    // This report relies on you running the rolled-up (multi-level) current cost
    // calculation prior to running the report.  If you plan on using a future
    // calculation date on the report then run the current cost calculation
    // first with that same future date.
    // 
    // If you plan on applying a cost factor, new scrap %, new indirect cost %, or
    // new overhead rate, then run the current cost calculation first using the same parameters.
    // 
    // //MP7.0.05  Changed how Version code is retrieved
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rolled-up Curr Cost Shares.rdl';
    Caption = 'THK Rolled-up Cost Shares';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Search Description", "Inventory Posting Group";

            column(Text000___FORMAT__Calc_Date__; Text000 + FORMAT("Calc.Date"))
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column("TIME"; TIME)
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column("USERID"; USERID)
            {
            }
            column(Item_TABLECAPTION__________ItemFilter; Item.TABLECAPTION + ': ' + ItemFilter)
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(ProdLotSize; ProdLotSize)
            {
            }
            column(BOMNo; BOMNo)
            {
            }
            column(BOMVersion; BOMVersion)
            {
            }
            column(RTNo; RTNo)
            {
            }
            column(RTVersion; RTVersion)
            {
            }
            column(Rolled_up_Current_Cost_SharesCaption; Rolled_up_Current_Cost_SharesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Report___14004540Caption; Report___14004540CaptionLbl)
            {
            }
            column(TotalCostCaption; TotalCostCaptionLbl)
            {
            }
            column(OverheadCostCaption; OverheadCostCaptionLbl)
            {
            }
            column(CapacityCostCaption; CapacityCostCaptionLbl)
            {
            }
            column(MaterialCostCaption; MaterialCostCaptionLbl)
            {
            }
            column(Qty__Base_Caption; Qty__Base_CaptionLbl)
            {
            }
            column(ProdBOMLine_Index__DescriptionCaption; ProdBOMLine_Index__DescriptionCaptionLbl)
            {
            }
            column(ProdBOMLine_Index___No__Caption; ProdBOMLine_Index___No__CaptionLbl)
            {
            }
            column(PADSTR____Level________FORMAT_Level_Caption; PADSTR____Level________FORMAT_Level_CaptionLbl)
            {
            }
            column(Base_UoMCaption; Base_UoMCaptionLbl)
            {
            }
            column(Cost_FactorCaption; Cost_FactorCaptionLbl)
            {
            }
            column(Material_Cost_PlusCaption; Material_Cost_PlusCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(Lot_Size__Caption; Lot_Size__CaptionLbl)
            {
            }
            column(BOM_No___Caption; BOM_No___CaptionLbl)
            {
            }
            column(BOM_Rev___Caption; BOM_Rev___CaptionLbl)
            {
            }
            column(Rt_No_______Caption; Rt_No_______CaptionLbl)
            {
            }
            column(Rt_Rev_______Caption; Rt_Rev_______CaptionLbl)
            {
            }
            dataitem(BOMLoop; Integer)
            {
                DataItemTableView = SORTING(Number);

                column(Item__Rolled_up_Material_Cost_; Item."Rolled-up Material Cost")
                {
                AutoFormatType = 2;
                DecimalPlaces = 2: 5;
                }
                column(Item__Rolled_up_Capacity_Cost____Item__Rolled_up_Subcontracted_Cost_; Item."Rolled-up Capacity Cost" + Item."Rolled-up Subcontracted Cost")
                {
                AutoFormatType = 2;
                DecimalPlaces = 2: 5;
                }
                column(Item__Rolled_up_Mfg__Ovhd_Cost____Item__Rolled_up_Cap__Overhead_Cost_; Item."Rolled-up Mfg. Ovhd Cost" + Item."Rolled-up Cap. Overhead Cost")
                {
                AutoFormatType = 2;
                DecimalPlaces = 2: 5;
                }
                column(Item__Unit_Cost_; Item."Unit Cost")
                {
                AutoFormatType = 2;
                DecimalPlaces = 2: 5;
                }
                column(TotMaterialPlus; TotMaterialPlus)
                {
                }
                column(ItemCost; ItemCost)
                {
                AutoFormatType = 2;
                DecimalPlaces = 2: 5;
                }
                column(TotCapacity; TotCapacity)
                {
                AutoFormatType = 2;
                DecimalPlaces = 2: 5;
                }
                column(TotOverhd; TotOverhd)
                {
                AutoFormatType = 2;
                DecimalPlaces = 2: 5;
                }
                column(ItemCost___Item__Unit_Cost_; ItemCost - Item."Unit Cost")
                {
                }
                column(Standard_Cost_Shares_from_this_Item_s_CardCaption; Standard_Cost_Shares_from_this_Item_s_CardCaptionLbl)
                {
                }
                column(Current_Cost_Shares_from_this_Item_s_New_ParametersCaption; Current_Cost_Shares_from_this_Item_s_New_ParametersCaptionLbl)
                {
                }
                column(Standard_Cost_vs_Current_Cost_VarianceCaption; Standard_Cost_vs_Current_Cost_VarianceCaptionLbl)
                {
                }
                column(BOMLoop_Number; Number)
                {
                }
                dataitem(DataItem5444; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;

                    column(ProdBOMLine_Index___No__; ProdBOMLine[Index]."No.")
                    {
                    }
                    column(ProdBOMLine_Index__Description; ProdBOMLine[Index].Description)
                    {
                    }
                    column(BOMCompQtyBase; BOMCompQtyBase)
                    {
                    AutoFormatType = 2;
                    DecimalPlaces = 0: 0;
                    }
                    column(PADSTR____Level________FORMAT_Level_; PADSTR('', Level, ' ') + FORMAT(Level))
                    {
                    }
                    column(MaterialCost; MaterialCost)
                    {
                    AutoFormatType = 2;
                    DecimalPlaces = 2: 5;
                    }
                    column(CapacityCost; CapacityCost)
                    {
                    AutoFormatType = 2;
                    DecimalPlaces = 2: 5;
                    }
                    column(OverheadCost; OverheadCost)
                    {
                    AutoFormatType = 2;
                    DecimalPlaces = 2: 5;
                    }
                    column(TotalCost; TotalCost)
                    {
                    AutoFormatType = 2;
                    DecimalPlaces = 2: 5;
                    }
                    column(ProdBOMLine_Level___Unit_of_Measure_Code_; ProdBOMLine[Level]."Unit of Measure Code")
                    {
                    }
                    column(CostFactor_NextIndex_; CostFactor[NextIndex])
                    {
                    }
                    column(MatCostPlus; MatCostPlus)
                    {
                    }
                    column(ItemT5__Unit_Cost_; ItemT5."Unit Cost")
                    {
                    }
                    column(Integer_Number; Number)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        BOMCompQtyBase:=Quantity[Index] * CompItemQtyBase / LotSize[Index];
                        /*
                        MaterialCost :=
                          ROUND(
                            BOMCompQtyBase * CompItem."Rolled-up Material Cost",
                            GLSetup."Unit-Amount Rounding Precision");.................*/
                        //PM
                        //CCS Comment
                        // IF ItemCostT2.GET(CompItem."No.") THEN BEGIN
                        //     MaterialCost :=
                        //       ROUND(
                        //         BOMCompQtyBase * ItemCostT2."CurrRolled-up Material Cost",
                        //         GLSetup."Unit-Amount Rounding Precision");
                        //     //PM
                        //     IF ItemT5.GET(ItemCostT2."Item No.") THEN;   //used for printing the unit price
                        // END ELSE BEGIN
                        MaterialCost:=ROUND(BOMCompQtyBase * CompItem."Rolled-up Material Cost", GLSetup."Unit-Amount Rounding Precision");
                        //PM
                        IF ItemT5.GET(CompItem."No.")THEN; //used for printing the unit price
                        //END;
                        MatCostPlus:=MaterialCost * CostFactor[NextIndex];
                        CapacityCost:=ROUND(BOMCompQtyBase * (CompItem."Rolled-up Capacity Cost" + CompItem."Rolled-up Subcontracted Cost"), GLSetup."Unit-Amount Rounding Precision");
                        OverheadCost:=ROUND(BOMCompQtyBase * (CompItem."Rolled-up Mfg. Ovhd Cost" + CompItem."Rolled-up Cap. Overhead Cost"), GLSetup."Unit-Amount Rounding Precision");
                        //TotalCost := MaterialCost + CapacityCost + OverheadCost;
                        TotalCost:=MatCostPlus + CapacityCost + OverheadCost;
                        IF Level = 1 THEN BEGIN
                            TotMaterial:=TotMaterial + MaterialCost;
                            TotMaterialPlus:=TotMaterialPlus + MatCostPlus;
                            ItemCost:=ROUND(TotMaterialPlus + TotCapacity + TotOverhd, GLSetup."Unit-Amount Rounding Precision");
                        END;
                    end;
                    trigger OnPostDataItem()
                    begin
                        Index:=NextIndex;
                        IF CompItem.IsMfgItem AND (CompItem."Production BOM No." <> '')THEN BEGIN
                            MfgItem:=CompItem;
                            Level:=Level + 1;
                        END;
                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    WHILE ProdBOMLine[Index].NEXT = 0 DO BEGIN
                        IF NoListType[Index] = NoListType[Index]::Item THEN Level:=Level - 1;
                        Index:=Index - 1;
                        IF Index < 1 THEN CurrReport.BREAK;
                        IF NoListType[Index] = NoListType[Index]::Item THEN MfgItem.GET(NoList[Index])
                        ELSE
                            MfgItem."Production BOM No.":=NoList[Index];
                        ProdBOMLine[Index].SETRANGE("Production BOM No.", MfgItem."Production BOM No.");
                        ProdBOMLine[Index].SETRANGE("Version Code", VersionCode[Index]);
                    END;
                    NextIndex:=Index;
                    CompItemQtyBase:=CostCalcMgt.CalcCompItemQtyBase(ProdBOMLine[Index], "Calc.Date", MfgItemQtyBase[Index], MfgItem."Routing No.", NoListType[Index] = NoListType[Index]::Item);
                    CLEAR(CompItem);
                    CASE ProdBOMLine[Index].Type OF ProdBOMLine[Index].Type::Item: BEGIN
                        CompItem.GET(ProdBOMLine[Index]."No.");
                        //CCS Comment
                        // IF ItemCostT2.GET(ProdBOMLine[Index]."No.") THEN
                        //     IF ItemCostT2."New Production BOM No." <> '' THEN
                        //         CompItemBOM := ItemCostT2."New Production BOM No."
                        //     ELSE
                        CompItemBOM:=CompItem."Production BOM No.";
                        //IF CompItem.IsMfgItem AND (CompItem."Production BOM No." <> '') THEN BEGIN
                        IF CompItem.IsMfgItem AND (CompItemBOM <> '')THEN BEGIN
                            NextIndex:=Index + 1;
                            /*
                                    VersionCode[NextIndex] :=
                                      VersionMgt.GetAndTestCertifiedBOMVersion(
                                        ProdBOMHeader,ProdBOMVersion,CompItem."Production BOM No.","Calc.Date",FALSE);   */
                            //MP7.0.05
                            //VersionCode[NextIndex] :=
                            //VersionMgt.GetAndTestCertifiedBOMVersion(
                            //ProdBOMHeader,ProdBOMVersion,CompItemBOM,"Calc.Date",FALSE);
                            VersionCode[NextIndex]:=VersionMgt.GetBOMVersion(CompItem."Production BOM No.", "Calc.Date", TRUE);
                            //end MP7.0.05
                            //PM
                            IF Level = 1 THEN //CCS Comment
                                // IF CostItemT.GET(CompItem."No.") THEN BEGIN
                                //     IF CostItemT."New Cost Factor" <> 0 THEN
                                //         CostFactor[NextIndex] := CostItemT."New Cost Factor"
                                //     ELSE
                                CostFactor[NextIndex]:=1;
                            LastCostFactor:=CostFactor[NextIndex];
                            //END;
                            IF Level > 1 THEN IF LastCostFactor <> 0 THEN CostFactor[NextIndex]:=LastCostFactor
                                ELSE
                                    CostFactor[NextIndex]:=1;
                            //end
                            NoListType[NextIndex]:=NoListType[NextIndex]::Item;
                            NoList[NextIndex]:=CompItem."No.";
                            CLEAR(ProdBOMLine[NextIndex]);
                            ProdBOMLine[NextIndex].SETRANGE("Production BOM No.", CompItem."Production BOM No.");
                            ProdBOMLine[NextIndex].SETRANGE("Version Code", VersionCode[NextIndex]);
                            LotSize[NextIndex]:=GetLotSize(CompItem);
                            MfgItemQtyBase[NextIndex]:=CalcMfgItemQtyBase(CompItem, VersionCode[NextIndex], LotSize[NextIndex]);
                            Quantity[NextIndex]:=Quantity[Index] * CompItemQtyBase / LotSize[Index];
                        END
                        ELSE
                        BEGIN // non mfgitem
                            IF Level = 1 THEN IF CostFactor[NextIndex] = 0 THEN //CCS Comment
                                    // IF CostItemT.GET(Item."No.") THEN BEGIN
                                    //     IF CostItemT."New Cost Factor" <> 0 THEN
                                    //         CostFactor[NextIndex] := CostItemT."New Cost Factor"
                                    //     ELSE
                                    //         CostFactor[NextIndex] := 1;
                                    // END ELSE
                                    CostFactor[NextIndex]:=1;
                            IF Level > 1 THEN IF LastCostFactor <> 0 THEN CostFactor[NextIndex]:=LastCostFactor
                                ELSE
                                    CostFactor[NextIndex]:=1;
                        END;
                    END;
                    ProdBOMLine[Index].Type::"Production BOM": BEGIN
                        NextIndex:=Index + 1;
                        ProdBOMHeader.GET(ProdBOMLine[Index]."No.");
                        //MP7.0.05
                        //VersionCode[NextIndex] :=
                        //VersionMgt.GetAndTestCertifiedBOMVersion(
                        //ProdBOMHeader,ProdBOMVersion,ProdBOMHeader."No.","Calc.Date",FALSE);
                        VersionCode[NextIndex]:=VersionMgt.GetBOMVersion(ProdBOMHeader."No.", "Calc.Date", TRUE);
                        //end MP7.0.05
                        NoListType[NextIndex]:=NoListType[NextIndex]::"Production BOM";
                        NoList[NextIndex]:=ProdBOMHeader."No.";
                        CLEAR(ProdBOMLine[NextIndex]);
                        ProdBOMLine[NextIndex].SETRANGE("Production BOM No.", NoList[NextIndex]);
                        ProdBOMLine[NextIndex].SETRANGE("Version Code", VersionCode[NextIndex]);
                        LotSize[NextIndex]:=LotSize[Index];
                        MfgItemQtyBase[NextIndex]:=CompItemQtyBase;
                        Quantity[NextIndex]:=Quantity[Index];
                    END;
                    END;
                end;
                trigger OnPreDataItem()
                begin
                    Index:=1;
                    Level:=1;
                    //MP7.0.05
                    //VersionCode[Index] :=
                    //VersionMgt.GetAndTestCertifiedBOMVersion(
                    //ProdBOMHeader,ProdBOMVersion,Item."Production BOM No.","Calc.Date",FALSE);
                    VersionCode[Index]:=VersionMgt.GetBOMVersion(Item."Production BOM No.", "Calc.Date", TRUE);
                    //end MP7.0.05
                    NoListType[Index]:=NoListType[Index]::Item;
                    NoList[Index]:=Item."No.";
                    CLEAR(ProdBOMLine);
                    ProdBOMLine[Index].SETRANGE("Production BOM No.", Item."Production BOM No.");
                    ProdBOMLine[Index].SETRANGE("Version Code", VersionCode[Index]);
                    ProdBOMLine[Index].SETFILTER("Starting Date", '%1|..%2', 0D, "Calc.Date");
                    ProdBOMLine[Index].SETFILTER("Ending Date", '%1|%2..', 0D, "Calc.Date");
                    LotSize[Index]:=GetLotSize(Item);
                    MfgItemQtyBase[Index]:=CalcMfgItemQtyBase(Item, VersionCode[Index], LotSize[Index]);
                    Quantity[Index]:=1;
                    MfgItem:=Item;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                IF NOT IsMfgItem OR ("Production BOM No." = '')THEN CurrReport.SKIP;
                TotMaterial:=0;
                TotCapacity:=0;
                TotMaterialPlus:=0;
                TotOverhd:=0;
                BOMNo:=Item."Production BOM No.";
                RTNo:=Item."Routing No.";
                BOMVersion:=VersionMgt.GetBOMVersion(BOMNo, "Calc.Date", TRUE);
                RTVersion:=VersionMgt.GetRtngVersion(RTNo, "Calc.Date", TRUE);
                IF Lot = 0 THEN //from request panel
 ProdLotSize:=Item."Lot Size";
            //CCS Comment >>
            // IF ProdItemStatT.GET(Item."No.") THEN BEGIN
            //     IF ProdItemStatT."New Production BOM No." <> '' THEN BEGIN
            //         BOMNo := ProdItemStatT."New Production BOM No.";
            //         BOMVersion := VersionMgt.GetBOMVersion(BOMNo, "Calc.Date", TRUE);
            //     END;
            //     IF ProdItemStatT."New Routing No." <> '' THEN BEGIN
            //         RTNo := ProdItemStatT."New Routing No.";
            //         RTVersion := VersionMgt.GetRtngVersion(RTNo, "Calc.Date", TRUE);
            //     END;
            //     IF Lot = 0 THEN
            //         IF ProdItemStatT."New Lot Size" <> 0 THEN
            //             ProdLotSize := ProdItemStatT."New Lot Size";
            //     TotCapacity := ProdItemStatT."CurrRolled-up Capacity Cost" + ProdItemStatT."CurrRolled-up Subcontrd Cost";
            //     TotOverhd := ProdItemStatT."CurrRolled-up Mfg. Ovhd Cost" + ProdItemStatT."CurrRolled-up Cap. Overhd Cost";
            //CCS Comment <<
            //TotMaterialPlus := ProdItemStatT."CurrRolled-up Material Cost";   //
            //END;
            end;
            trigger OnPreDataItem()
            begin
                ItemFilter:=Item.GETFILTERS;
                GLSetup.GET;
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

                    field("Calc.Date"; "Calc.Date")
                    {
                        Caption = 'Calculation Date';
                        ApplicationArea = all;
                    }
                    field(Scrap; Scrap)
                    {
                        Caption = 'New Scrap %';
                        ApplicationArea = all;
                    }
                    field(Indirect; Indirect)
                    {
                        Caption = 'New Indirect Cost %';
                        ApplicationArea = all;
                    }
                    field(Overhd; Overhd)
                    {
                        Caption = 'New Overhead Rate';
                        ApplicationArea = all;
                    }
                    field(Lot; Lot)
                    {
                        Caption = 'New Lot Size';
                        ApplicationArea = all;
                    }
                    field(CostFactor; CostFactor[1])
                    {
                        Caption = 'Cost Increase Factor';
                        ApplicationArea = all;
                    }
                }
            }
        }
        actions
        {
        }
        trigger OnInit()
        begin
            "Calc.Date":=WORKDATE;
        end;
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        CompanyInformation.GET;
    end;
    var Text000: Label 'As of ';
    GLSetup: Record "General Ledger Setup";
    ProdBOMHeader: Record "Production BOM Header";
    ProdBOMVersion: Record "Production BOM Version";
    ProdBOMLine: array[99]of Record "Production BOM Line";
    MfgItem: Record Item;
    CompItem: Record Item;
    CompanyInformation: Record "Company Information";
    UOMMgt: Codeunit "Unit of Measure Management";
    VersionMgt: Codeunit VersionManagement;
    CostCalcMgt: Codeunit "Cost Calculation Management";
    ItemFilter: Text[250];
    "Calc.Date": Date;
    Level: Integer;
    Index: Integer;
    NextIndex: Integer;
    VersionCode: array[99]of Code[10];
    NoListType: array[99]of Option Item, "Production BOM";
    NoList: array[99]of Code[20];
    LotSize: array[99]of Decimal;
    MfgItemQtyBase: array[99]of Decimal;
    Quantity: array[99]of Decimal;
    BOMCompQtyBase: Decimal;
    MaterialCost: Decimal;
    CapacityCost: Decimal;
    OverheadCost: Decimal;
    TotalCost: Decimal;
    CompItemQtyBase: Decimal;
    //CostItemT: Record "CCS Item Cost Statistics";
    Scrap: Decimal;
    Indirect: Decimal;
    Overhd: Decimal;
    Lot: Decimal;
    CostFactor: array[99]of Decimal;
    LastCostFactor: Decimal;
    UseVendor: Boolean;
    MatCostPlus: Decimal;
    TotMaterial: Decimal;
    TotMaterialPlus: Decimal;
    TotCapacity: Decimal;
    TotOverhd: Decimal;
    ItemCost: Decimal;
    BOMNo: Code[20];
    RTNo: Code[20];
    BOMVersion: Code[20];
    RTVersion: Code[20];
    //ProdItemStatT: Record 14004540;
    ProdLotSize: Decimal;
    CompItemBOM: Code[20];
    //ItemCostT2: Record 14004540;
    ItemT5: Record Item;
    Rolled_up_Current_Cost_SharesCaptionLbl: Label 'Rolled-up Current Cost Shares';
    CurrReport_PAGENOCaptionLbl: Label 'Page';
    Report___14004540CaptionLbl: Label 'Report # 14004540';
    TotalCostCaptionLbl: Label 'Total Cost';
    OverheadCostCaptionLbl: Label 'Overhead Cost';
    CapacityCostCaptionLbl: Label 'Capacity Cost';
    MaterialCostCaptionLbl: Label 'Material Cost';
    Qty__Base_CaptionLbl: Label 'Qty (Base)';
    ProdBOMLine_Index__DescriptionCaptionLbl: Label 'Description';
    ProdBOMLine_Index___No__CaptionLbl: Label 'No.';
    PADSTR____Level________FORMAT_Level_CaptionLbl: Label 'Level';
    Base_UoMCaptionLbl: Label 'Base UoM';
    Cost_FactorCaptionLbl: Label 'Cost Factor';
    Material_Cost_PlusCaptionLbl: Label 'Material Cost Plus';
    Unit_CostCaptionLbl: Label 'Unit Cost';
    Lot_Size__CaptionLbl: Label 'Lot Size =';
    BOM_No___CaptionLbl: Label 'BOM No. =';
    BOM_Rev___CaptionLbl: Label 'BOM Rev. =';
    Rt_No_______CaptionLbl: Label 'Rt No      =';
    Rt_Rev_______CaptionLbl: Label 'Rt Rev.     =';
    Standard_Cost_Shares_from_this_Item_s_CardCaptionLbl: Label 'Standard Cost Shares from this Item''s Card';
    Current_Cost_Shares_from_this_Item_s_New_ParametersCaptionLbl: Label 'Current Cost Shares from this Item''s New Parameters';
    Standard_Cost_vs_Current_Cost_VarianceCaptionLbl: Label 'Standard Cost vs Current Cost Variance';
    local procedure GetLotSize(Item: Record Item): Decimal var
    //ItemCostStatT: Record "14004540";
    begin
        //CCS Comment
        // IF ItemCostStatT.GET(Item."No.") THEN BEGIN
        //     IF ItemCostStatT."New Lot Size" <> 0 THEN
        //         EXIT(ItemCostStatT."New Lot Size")
        //     ELSE
        //         IF Item."Lot Size" <> 0 THEN
        //             EXIT(Item."Lot Size")
        //         ELSE
        //             EXIT(1);
        // END ELSE BEGIN
        IF Item."Lot Size" <> 0 THEN EXIT(Item."Lot Size")
        ELSE
            EXIT(1);
    //END;
    end;
    local procedure CalcMfgItemQtyBase(Item: Record Item; VersionCode: Code[20]; LotSize: Decimal): Decimal begin
        EXIT(CostCalcMgt.CalcQtyAdjdForBOMScrap(LotSize, Item."Scrap %") / UOMMgt.GetQtyPerUnitOfMeasure(Item, VersionMgt.GetBOMUnitOfMeasure(Item."Production BOM No.", VersionCode)));
    end;
}
