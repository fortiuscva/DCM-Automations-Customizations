page 52100 "THK PPI Codes"
{
    ApplicationArea = All;
    Caption = 'PPI Codes';
    PageType = List;
    SourceTable = "THK PPI Codes";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
