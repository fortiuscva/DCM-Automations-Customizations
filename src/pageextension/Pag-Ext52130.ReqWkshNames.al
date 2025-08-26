pageextension 52130 "THK Req. Wksh. Names" extends "Req. Wksh. Names"
{
    layout
    {
        addlast(Control1)
        {
            field("THK Generate From JobQueue"; rec."THK Run From JobQueue")
            {
                ApplicationArea = All;
                ToolTip = 'Specified the batch to include in MRP Job queue';
            }
            field("THK Vendor No."; rec."THK Vendor No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specified the Vendor No. to include in MRP Job queue';

                trigger OnLookup(var Text: Text): Boolean var
                    VendorList: Page "Vendor List";
                    PrevCode: Text;
                begin
                    PrevCode:=Text;
                    VendorList.LookupMode(true);
                    if not(VendorList.RunModal() = Action::LookupOK)then exit;
                    Text:=PrevCode + VendorList.GetSelectionFilter();
                    exit(true);
                end;
            }
            field("THK Monday"; rec."THK Monday")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Monday';
            }
            field("THK Tuesday"; rec."THK Tuesday")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Tuesday';
            }
            field("THK Wednesday"; rec."THK Wednesday")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Wednesday';
            }
            field("THK Thursday"; rec."THK Thursday")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Thursday';
            }
            field("THK Friday"; rec."THK Friday")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Friday';
            }
            field("THK Saturday"; rec."THK Saturday")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Saturday';
            }
            field("THK Sunday"; rec."THK Sunday")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Monday';
            }
        }
    }
}
