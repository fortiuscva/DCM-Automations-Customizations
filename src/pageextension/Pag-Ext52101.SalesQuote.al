pageextension 52101 "THK Sales Quote" extends "Sales Quote"
{
    actions
    {
        addlast(processing)
        {
            action("THK RefreshPrices")
            {
                Caption = 'Refresh Prices';
                ApplicationArea = All;
                Image = RefreshDiscount;

                trigger OnAction()
                begin
                    THKMisFunctions.RefreshSalesQuoteLines(Rec);
                end;
            }
        }
    }
    var THKMisFunctions: Codeunit "THK Misc. Functions";
}
