pageextension 52136 "THK Req. Worksheet" extends "Req. Worksheet"
{
    actions
    {
        addlast(processing)
        {
            action("THK Action Message Selection")
            {
                Caption = 'Action Message Selection';
                ApplicationArea = all;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    RequisitionLineRecLcl: Record "Requisition Line";
                begin
                    CurrPage.SetSelectionFilter(RequisitionLineRecLcl);
                    Report.RunModal(Report::"THK Action Requisition Line", true, false, RequisitionLineRecLcl);
                end;
            }
        }
    }
}
