tableextension 50101 "FT Sales Invoice Line" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "FT Attribute Value"; Text[2048])
        {
            Caption = 'Attribute Value';
            DataClassification = ToBeClassified;
        }
    }
}
