pageextension 52109 "THK Company Information" extends "Company Information"
{
    layout
    {
        addlast(Payments)
        {
            field("THK Invoice E-mail"; Rec."THK Invoice E-mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Invoice E-mail field.';
            }
        }
        addlast(General)
        {
            field("THK PrintFreightInsurance"; Rec."THK PrintFreightInsurance")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Print Freight & Insurance Verbiage field.';
            }
        }
    }
}
