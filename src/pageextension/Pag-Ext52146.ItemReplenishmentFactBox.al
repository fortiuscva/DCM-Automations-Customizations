pageextension 52146 "THK Item Replenishment FactBox" extends "Item Replenishment FactBox"
{
    layout
    {
        addafter("Vendor No.")
        {
            field("THK Vendor Name"; VendorRecGbl.Name)
            {
                Caption = 'Vendor Name';
                ApplicationArea = all;
                Editable = false;
            }
            field("THK Purchasing Code"; ItemRecGbl."THK Purchaser Code")
            {
                Caption = 'Purchasing Code';
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if not VendorRecGbl.get(rec."Vendor No.")then VendorRecGbl.Init();
        if not ItemRecGbl.get(rec."No.")then ItemRecGbl.Init();
    end;
    var VendorRecGbl: Record Vendor;
    ItemRecGbl: Record Item;
}
