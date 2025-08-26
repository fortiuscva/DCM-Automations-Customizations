tableextension 52118 "THK Sales Shipment Header" extends "Sales Shipment Header"
{
    fields
    {
        field(50105; "THK Urgent"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Urgent';
        }
    }
}
