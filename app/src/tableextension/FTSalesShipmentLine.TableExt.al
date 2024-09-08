tableextension 50102 "FT Sales Shipment Line" extends "Sales Shipment Line"
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

