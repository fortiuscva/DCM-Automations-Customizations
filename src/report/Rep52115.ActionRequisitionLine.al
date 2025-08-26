report 52115 "THK Action Requisition Line"
{
    Caption = 'Action Requisition Line';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Requisition Line"; "Requisition Line")
        {
            DataItemTableView = sorting("Worksheet Template Name", "Journal Batch Name", "Line No.");

            trigger OnAfterGetRecord()
            begin
                if ActionType = ActionType::"Select All" then "Requisition Line"."Accept Action Message":=true
                else
                    "Requisition Line"."Accept Action Message":=false;
                "Requisition Line".Modify();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("Action Type"; ActionType)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }
    }
    var ActionType: Option "Select All", "Clear All";
}
