page 52103 "THK Item Prod. Design factBox"
{
    ApplicationArea = All;
    Caption = 'Item Prod. Design FactBox';
    PageType = CardPart;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            //field(RoutinghNo; GetRoutingNo(Rec))
            field(RoutinghNo; Rec."Routing No.")
            {
                ApplicationArea = all;
                Caption = 'Routing No.';

                trigger OnDrillDown()
                begin
                    CreateRoutingFromFactBox(Rec);
                end;
            }
            field(RoutinghVersion; GetRoutingVerison(Rec))
            {
                ApplicationArea = all;
                Caption = 'Routing Curr Verison';

                trigger OnDrillDown()
                var
                    RoutingVersion: Record "Routing Version";
                begin
                    if RoutingVersion.Get(GetRoutingNo(Rec), GetRoutingVerison(Rec))then page.RunModal(page::"Routing Version", RoutingVersion);
                end;
            }
            field(ProductionBom; Rec."Production BOM No.")
            {
                ApplicationArea = all;
                Caption = 'Prod. BOM No.';

                trigger OnDrillDown()
                begin
                    CreateProducitonBomFromFactBox(Rec);
                end;
            }
            field(ProdBomVerison; GetProdBomVerison(Rec))
            {
                ApplicationArea = all;
                Caption = 'Prod. Bom Verison';

                trigger OnDrillDown()
                var
                    ProductionBOMVersion: Record "Production BOM Version";
                begin
                    if ProductionBOMVersion.Get(GetProdBomNo(Rec), GetProdBomVerison(Rec))then Page.RunModal(page::"Production BOM Version", ProductionBOMVersion);
                end;
            }
        }
    }
    procedure GetRoutingNo(Item: Record Item): Code[20]begin
        exit(Item."Routing No.");
    end;
    procedure GetProdBomNo(Item: Record Item): Code[20]begin
        exit(Item."Production BOM No.");
    end;
    local procedure CreateRoutingFromFactBox(Item: Record Item)
    var
        RoutingHeader: Record "Routing Header";
        ConfirmManagement: Codeunit "Confirm Management";
        RoutingVersion: Record "Routing Version";
        RoutingVersionNo: Code[20];
    begin
        if item."Routing No." = '' then begin
            RoutingHeader.SetRange("No.", Item."No.");
            if RoutingHeader.IsEmpty then begin
                if ConfirmManagement.GetResponseOrDefault(StrSubstNo(RoutingCreationQst, item."No."), false)then begin
                    RoutingHeader.Init();
                    RoutingHeader."No.":=Item."No.";
                    RoutingHeader.Description:=Item.Description;
                    RoutingHeader.Status:=RoutingHeader.Status::"Under Development";
                    RoutingHeader.Insert(true);
                    Commit();
                    Page.RunModal(Page::Routing, RoutingHeader);
                    Item.validate("Routing No.", RoutingHeader."No.");
                    Item.Modify();
                end;
            end
            else
            begin
                RoutingHeader.FindFirst();
                Item.validate("Routing No.", RoutingHeader."No.");
                Item.Modify();
                Page.RunModal(Page::Routing, RoutingHeader);
            end;
        end
        else
        begin
            RoutingHeader.SetRange("No.", Item."Routing No.");
            RoutingHeader.FindFirst();
            Page.Runmodal(Page::Routing, RoutingHeader);
        end;
    end;
    local procedure CreateProducitonBomFromFactBox(Item: Record Item)
    var
        ProductionBomHeader: Record "Production BOM Header";
        ProdBOMVersion: Record "Production BOM Version";
        ConfirmManagement: Codeunit "Confirm Management";
        BOMVersionNo: Code[20];
    begin
        if item."Production BOM No." = '' then begin
            ProductionBomHeader.Reset();
            ProductionBomHeader.SetRange("No.", Item."No.");
            if ProductionBomHeader.IsEmpty then begin
                if ConfirmManagement.GetResponseOrDefault(StrSubstNo(ProdBomCreationQst, Item."No."), false)then begin
                    ProductionBomHeader.Init();
                    ProductionBomHeader."No.":=Item."No.";
                    ProductionBomHeader.Description:=Item.Description;
                    ProductionBomHeader."Unit of Measure Code":=Item."Base Unit of Measure";
                    ProductionBomHeader.Status:=ProductionBomHeader.Status::"Under Development";
                    ProductionBomHeader.Insert(true);
                    Commit();
                    Page.RunModal(Page::"Production BOM", ProductionBomHeader);
                    Item.Validate("Production BOM No.", ProductionBomHeader."No.");
                    Item.Modify();
                end;
            end
            else
            begin
                ProductionBomHeader.FindFirst();
                Item.Validate("Production BOM No.", ProductionBomHeader."No.");
                Item.Modify();
                Page.RunModal(Page::"Production BOM", ProductionBomHeader);
            end;
        end
        else
        begin
            ProductionBomHeader.Reset();
            ProductionBomHeader.SetRange("No.", Item."Production BOM No.");
            ProductionBomHeader.FindFirst();
            Page.Runmodal(Page::"Production BOM", ProductionBomHeader);
        end;
    end;
    local procedure GetRoutingVerison(Item: Record Item): code[20]begin
        exit(VersionMgt.GetRtngVersion(Item."Routing No.", WORKDATE, TRUE));
    end;
    local procedure GetProdBomVerison(Item: Record Item): code[20]begin
        exit(VersionMgt.GetBOMVersion(Item."Production BOM No.", WORKDATE, TRUE));
    end;
    var VersionMgt: Codeunit VersionManagement;
    RoutingCreationQst: label 'Routing Header does not exists for item %1. Would you like to create a one now?';
    ProdBomCreationQst: label 'Produciton BOM Header does not exists for item %1. Would you like to create a one now?';
}
