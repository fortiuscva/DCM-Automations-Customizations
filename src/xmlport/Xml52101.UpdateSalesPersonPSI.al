xmlport 52101 "THK Update SalesPerson PSI"
{
    Direction = Import;
    Permissions = tabledata "Sales Invoice Header"=rmid;
    UseRequestPage = false;
    Caption = 'Update SalesPerson PSI';
    TextEncoding = UTF8;
    Format = VariableText;

    schema
    {
    textelement(Root)
    {
    tableelement(SalesInvoiceHeader;
    "Sales Invoice Header")
    {
    AutoSave = false;
    AutoReplace = false;
    AutoUpdate = false;

    fieldelement(SalesInvHeaderNo;
    SalesInvoiceHeader."No.")
    {
    }
    fieldelement(SalesPersonCode;
    SalesInvoiceHeader."Salesperson Code")
    {
    }
    trigger OnBeforeInsertRecord()
    var
        SalesInvHdrRecLcl: Record "Sales Invoice Header";
    begin
        //SalesInvHdrRecLcl.Reset();
        //if SalesInvHdrRecLcl.get(SalesInvoiceHeader."No.") and (SalesInvoiceHeader."Salesperson Code" <> '') THEn begin
        if SalesInvHdrRecLcl.get(SalesInvoiceHeader."No.")then begin
            SalesInvHdrRecLcl.Validate("Salesperson Code", SalesInvoiceHeader."Salesperson Code");
            SalesInvHdrRecLcl.Modify(true);
        end;
    end;
    }
    }
    }
    trigger OnPostXmlPort()
    begin
        Message('Updated Successfully.');
    end;
}
