pageextension 52135 "THK Planning Worksheet" extends "Planning Worksheet"
{
    layout
    {
        addlast(Control1)
        {
            field("THK RED_Item"; rec."THK RED_Item")
            {
                Caption = 'RED_Item';
                ApplicationArea = all;
                ToolTip = 'Specifies the Red item from Item.';
            }
        }
        addafter(Control11)
        {
            part("THK SKU Planning FactBox"; "THK SKU Planning FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "Item No."=field("No."), "Location Code"=field("Location Code");
            }
        }
    }
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
