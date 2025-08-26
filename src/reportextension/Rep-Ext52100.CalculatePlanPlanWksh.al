reportextension 52100 "THK Calculate Plan-Plan. Wksh." extends "Calculate Plan - Plan. Wksh."
{
    requestpage
    {
        layout
        {
            addafter(MRP)
            {
                field("THK BlockedVarGbl"; BlockedVarGbl)
                {
                    Caption = 'Blocked';
                    ApplicationArea = all;
                }
            // field("THK RedItemVarGbl"; RedItemVarGbl)
            // {
            //     Caption = 'RED_Item';
            //     ApplicationArea = all;
            // }
            }
        }
        trigger OnQueryClosePage(CloseAction: Action): Boolean var
            SingleInstanceVarLcl: Codeunit "THK Single Instance";
        begin
            SingleInstanceVarLcl.SetBlockedItem(BlockedVarGbl);
        //SingleInstanceVarLcl.SetRedItem(RedItemVarGbl);
        end;
    }
    var BlockedVarGbl: Boolean;
    RedItemVarGbl: Boolean;
    ReleasedProd: page "Released Production Order";
}
