tableextension 52113 "THK Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "THK Paid (Yes/No)"; Boolean)
        {
            Caption = 'Paid (Yes/No)';
            FieldClass = FlowField;
            CalcFormula = exist("Detailed Cust. Ledg. Entry" where("Cust. Ledger Entry No."=field("THK Detailed Cust Ledger No."), "Document Type"=const(Payment)));
            Editable = false;
        }
        field(50101; "THK Payment Date"; Date)
        {
            Caption = 'Payment Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Detailed Cust. Ledg. Entry"."Posting Date" where("Cust. Ledger Entry No."=field("THK Detailed Cust Ledger No."), "Document Type"=const(Payment)));
            Editable = false;
        }
        field(50103; "THK Detailed Cust Ledger No."; Integer)
        {
            Caption = 'Detailed Cust. Ledger Entry No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No." where("Document No."=field("No."), "Document Type"=const(Invoice), "Entry Type"=const("Initial Entry")));
            Editable = false;
        }
        field(50105; "THK Urgent"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Urgent';
        }
    }
}
