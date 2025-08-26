xmlport 52100 "THK Delete Orphan Customers"
{
    Format = VariableText;
    Direction = Import;
    FieldSeparator = ',';
    FieldDelimiter = '"';
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;
    Caption = 'Delete Orphan Customers';

    schema
    {
    textelement(CustomerDetails)
    {
    tableelement(Customer;
    "Customer")
    {
    AutoSave = false;
    AutoReplace = false;
    AutoUpdate = false;

    textelement(CustomerNo)
    {
    }
    trigger OnBeforeInsertRecord()
    begin
        if CustRec.get(CustomerNo)then begin
            CustRec.Delete(true);
        end;
    end;
    }
    }
    }
    trigger OnPostXmlPort()
    begin
    end;
    var CustRec: Record Customer;
}
