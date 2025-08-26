pageextension 52147 "THK Standard Cost Worksheet" extends "Standard Cost Worksheet"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Vendor No."; Rec."THK Vendor No.")
            {
                ApplicationArea = all;
                ToolTip = 'Vendor No.';
                Editable = false;
            }
            field("THK Vendor Name"; Rec."THK Vendor Name")
            {
                ApplicationArea = all;
                ToolTip = 'Vendor Name';
                Editable = false;
            }
        }
    }
}
