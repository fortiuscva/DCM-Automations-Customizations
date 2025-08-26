pageextension 52127 "THK Posted Sales Shipment" extends "Posted Sales Shipment"
{
    actions
    {
        addafter("&Print")
        {
            action("THK MfgPackingSlip")
            {
                Caption = 'Mfg. Packing Slip';
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Clear(THKFunctionsGbl);
                    THKFunctionsGbl.PrintPackingSlipFromSalesShpt(Rec, true);
                end;
            }
        }
    }
    var THKFunctionsGbl: Codeunit "THK Misc. Functions";
}
