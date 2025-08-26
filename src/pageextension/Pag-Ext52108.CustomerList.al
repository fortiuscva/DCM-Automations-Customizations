pageextension 52108 "THK Customer List" extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action("THK DeletedOrphanCustomers")
            {
                Caption = 'Delete Orphan Customers';
                ApplicationArea = all;
                RunObject = xmlport "THK Delete Orphan Customers";
            }
        }
    }
}
