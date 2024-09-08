reportextension 50100 "FT Standard Sales - Invoice" extends "Standard Sales - Invoice"
{
    RDLCLayout = 'src\layouts\FT Sales - Invoice.rdl';
    WordLayout = 'src\layouts\FT Sales - Invoice.docx';
    dataset
    {
        add(Line)
        {
            column(FTAttributeValue; "FT Attribute Value")
            {
            }
        }
    }
}
