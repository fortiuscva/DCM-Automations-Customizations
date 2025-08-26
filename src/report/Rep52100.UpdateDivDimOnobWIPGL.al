report 52100 "Update Div. Dim. On ob WIP G/L"
{
    ApplicationArea = All;
    Caption = 'Update Div. Dim. On ob WIP G/L';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    Permissions = tabledata "Job WIP G/L Entry"=rimd;

    dataset
    {
        dataitem(JobWIPGLEntry; "Job WIP G/L Entry")
        {
            RequestFilterFields = "Job No.";
            DataItemTableView = sorting("Job No.", Reversed, "Job Complete", Type);

            trigger OnAfterGetRecord()
            var
                TempDimSetEntry: Record "Dimension Set Entry" temporary;
                DimValueCode: Code[20];
                DimCode: Code[20];
                DimVal: Record "Dimension Value";
                DimMgmt: Codeunit DimensionManagement;
            begin
                DimCode:='DIVISION';
                if "Global Dimension 1 Code" = '' then begin
                    DefaultDimRecGbl.reset;
                    DefaultDimRecGbl.SetRange("Table ID", Database::Job);
                    DefaultDimRecGbl.SetRange("No.", "Job No.");
                    DefaultDimRecGbl.SetRange("Dimension Code", DimCode);
                    DefaultDimRecGbl.SetFilter("Dimension Value Code", '<>%1', '');
                    if DefaultDimRecGbl.FindFirst()then begin
                        DimValueCode:=DefaultDimRecGbl."Dimension Value Code";
                        GetDimensionSet(TempDimSetEntry, "Dimension Set ID");
                        if DimValueCode <> '' then begin
                            DimVal.Get(DimCode, DimValueCode);
                            if not CheckDim(DimVal."Dimension Code")then;
                            if not CheckDimValue(DimVal."Dimension Code", DimValueCode)then;
                            if TempDimSetEntry.Get(TempDimSetEntry."Dimension Set ID", DimVal."Dimension Code")then if TempDimSetEntry."Dimension Value Code" <> DimValueCode then TempDimSetEntry.Delete();
                            if DimValueCode <> '' then begin
                                TempDimSetEntry."Dimension Code":=DimVal."Dimension Code";
                                TempDimSetEntry."Dimension Value Code":=DimVal.Code;
                                TempDimSetEntry."Dimension Value ID":=DimVal."Dimension Value ID";
                                if TempDimSetEntry.Insert()then;
                            end;
                            "Dimension Set ID":=GetDimensionSetID(TempDimSetEntry);
                            DimMgmt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
                            Modify();
                        end;
                    end;
                end;
            end;
        }
    }
    procedure GetDimensionSet(var TempDimSetEntry: Record "Dimension Set Entry" temporary; DimSetID: Integer)
    var
        DimSetEntry: Record "Dimension Set Entry";
        IsHandled: Boolean;
    begin
        TempDimSetEntry.DeleteAll();
        DimSetEntry.SetRange("Dimension Set ID", DimSetID);
        if DimSetEntry.FindSet()then repeat TempDimSetEntry:=DimSetEntry;
                TempDimSetEntry.Insert();
            until DimSetEntry.Next() = 0;
    end;
    procedure GetDimensionSetID(var DimSetEntry2: Record "Dimension Set Entry"): Integer var
        DimSetEntry: Record "Dimension Set Entry";
    begin
        exit(DimSetEntry.GetDimensionSetID(DimSetEntry2));
    end;
    procedure CheckDim(DimCode: Code[20]): Boolean var
        Dim: Record Dimension;
        IsHandled: Boolean;
        Result: Boolean;
    begin
        if Dim.Get(DimCode)then begin
            if Dim.Blocked then begin
                LogError(Dim.RecordId, Dim.FieldNo(Blocked), StrSubstNo(Text014, Dim.TableCaption(), DimCode), '');
                exit(false);
            end;
        end
        else
        begin
            LogError(DATABASE::Dimension, 0, StrSubstNo(Text015, Dim.TableCaption(), DimCode), '');
            exit(false);
        end;
        exit(true);
    end;
    procedure CheckDimValue(DimCode: Code[20]; DimValCode: Code[20]): Boolean var
        DimVal: Record "Dimension Value";
        IsHandled: Boolean;
        Result: Boolean;
    begin
        if(DimCode <> '') and (DimValCode <> '')then if DimVal.Get(DimCode, DimValCode)then begin
                if DimVal.Blocked then begin
                    LogError(DimVal.RecordId, DimVal.FieldNo(Blocked), StrSubstNo(DimValueBlockedErr, DimVal.TableCaption(), DimCode, DimValCode), '');
                    exit(false);
                end;
                if not CheckDimValueAllowed(DimVal)then exit(false);
            end
            else
            begin
                LogError(DATABASE::"Dimension Value", 0, StrSubstNo(DimValueMissingErr, DimVal.TableCaption(), DimCode, DimValCode), '');
                exit(false);
            end;
        exit(true);
    end;
    local procedure CheckDimValueAllowed(DimVal: Record "Dimension Value")Result: Boolean var
        DimValueAllowed: Boolean;
        DimErr: Text[250];
        IsHandled: Boolean;
    begin
        DimValueAllowed:=(DimVal."Dimension Value Type" in[DimVal."Dimension Value Type"::Standard, DimVal."Dimension Value Type"::"Begin-Total"]);
        if not DimValueAllowed then DimErr:=StrSubstNo(DimValueMustNotBeErr, DimVal.TableCaption(), DimVal."Dimension Code", DimVal.Code, Format(DimVal."Dimension Value Type"));
        if not DimValueAllowed then LogError(DimVal.RecordId, DimVal.FieldNo("Dimension Value Type"), DimErr, '');
        exit(DimValueAllowed);
    end;
    procedure LogError(SourceRecVariant: Variant; SourceFieldNo: Integer; Message: Text; HelpArticleCode: Code[30])IsLogged: Boolean var
        ForwardLinkMgt: Codeunit "Forward Link Mgt.";
    begin
        Error(Message);
    end;
    var JobRecGbl: Record Job;
    DefaultDimRecGbl: Record "Default Dimension";
    DimValueBlockedErr: Label '%1 %2 - %3 is blocked.', Comment = '%1 = Dimension Value table caption, %2 = Dim Code, %3 = Dim Value';
    DimValueMustNotBeErr: Label 'Dimension Value Type for %1 %2 - %3 must not be %4.', Comment = '%1 = Dimension Value table caption, %2 = Dim Code, %3 = Dim Value, %4 = Dimension Value Type value';
    DimValueMissingErr: Label '%1 %2 - %3 is missing.', Comment = '%1 = Dimension Value table caption, %2 = Dim Code, %3 = Dim Value';
    Text014: Label '%1 %2 is blocked.';
    Text015: Label '%1 %2 can''t be found.';
}
