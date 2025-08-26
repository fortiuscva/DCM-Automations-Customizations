pageextension 52140 "THK Prod. Order Components" extends "Prod. Order Components"
{
    layout
    {
        addlast(factboxes)
        {
            part("Item Replenishment FactBox"; "Item Replenishment FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "No."=field("Item No.");
                Visible = false;
            }
            part("THK SKU Planning FactBox"; "THK SKU Planning FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "Item No."=field("Item No."), "Location Code"=field("Location Code");
            }
        }
    }
    actions
    {
        addlast("F&unctions")
        {
            action("THK Update Unit Cost")
            {
                ApplicationArea = all;
                Image = UpdateUnitCost;
                Caption = 'Update Unit Cost';

                trigger OnAction()
                var
                    ProdOrderCompRecLcl: Record "Prod. Order Component";
                    ItemRecLcl: Record Item;
                begin
                    ProdOrderCompRecLcl.CopyFilters(Rec);
                    if ProdOrderCompRecLcl.FindSet()then begin
                        repeat if ItemRecLcl.get(ProdOrderCompRecLcl."Item No.")then begin
                                ProdOrderCompRecLcl.Validate("Unit Cost", ItemRecLcl."Unit Cost");
                                ProdOrderCompRecLcl.Modify();
                            end;
                        until ProdOrderCompRecLcl.Next() = 0;
                    end;
                    CurrPage.Update(false);
                    Message('Unit Cost Updated for the lines.');
                end;
            }
        }
    }
}
