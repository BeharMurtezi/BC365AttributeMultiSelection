tableextension 50103 "FT Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
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
