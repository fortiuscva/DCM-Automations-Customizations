pageextension 52148 "THK Vendor List" extends "Vendor List"
{
    procedure GetSelectionFilter(): Text var
        Vendor: Record Vendor;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Vendor);
        Exit(SelectionFilterManagement.GetSelectionFilterForVendor(Vendor));
    end;
}
