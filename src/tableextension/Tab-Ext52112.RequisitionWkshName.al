tableextension 52112 "THK Requisition Wksh. Name" extends "Requisition Wksh. Name"
{
    fields
    {
        field(52001; "THK Run From JobQueue"; Boolean)
        {
            Caption = 'Run From JobQueue';
            DataClassification = CustomerContent;
        }
        field(52002; "THK Vendor No."; Code[100])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor."No.";
            ValidateTableRelation = false;
        }
        field(52103; "THK Monday"; Boolean)
        {
            Caption = 'Monday';
        }
        field(52104; "THK Tuesday"; Boolean)
        {
            Caption = 'Tuesday';
        }
        field(52105; "THK Wednesday"; Boolean)
        {
            Caption = 'Wednesday';
        }
        field(52106; "THK Thursday"; Boolean)
        {
            Caption = 'Thursday';
        }
        field(52107; "THK Friday"; Boolean)
        {
            Caption = 'Friday';
        }
        field(52108; "THK Saturday"; Boolean)
        {
            Caption = 'Saturday';
        }
        field(52109; "THK Sunday"; Boolean)
        {
            Caption = 'Sunday';
        }
    }
}
