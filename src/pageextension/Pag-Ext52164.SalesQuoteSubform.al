pageextension 52164 "THK Sales Quote Subform" extends "Sales Quote Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("THK Purchaser Code"; Rec."THK Purchaser Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Purchaser Code field.';
                Editable = false;
            }
        }
    }
}
