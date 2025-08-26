codeunit 52101 "THK Single Instance"
{
    SingleInstance = true;

    procedure SetProdLineForWhsePick(ProdLineNoPar: Integer)
    begin
        ProdLineNoVarGbl:=ProdLineNoPar;
    end;
    procedure GetProdLineForWhsePick(): Integer begin
        exit(ProdLineNoVarGbl);
    end;
    procedure SetBlockedItem(pBlocked: Boolean)
    begin
        BlockedVarGbl:=pBlocked;
    end;
    // procedure SetRedItem(pRedItem: Boolean)
    // begin
    //     RedItemVarGbl := pRedItem;
    // end;
    procedure GetBlockedItem(): Boolean begin
        Exit(BlockedVarGbl);
    end;
    // procedure GetRedItem(): Boolean
    // begin
    //     Exit(RedItemVarGbl);
    // end;
    var ProdLineNoVarGbl: Integer;
    BlockedVarGbl: Boolean;
//RedItemVarGbl: Boolean;
}
