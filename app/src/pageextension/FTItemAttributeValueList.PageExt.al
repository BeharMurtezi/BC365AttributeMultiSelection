pageextension 50100 "FT Item Attribute Value List" extends "Item Attribute Value List"
{
    layout
    {
        modify(Value)
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                FTGeneralFunctions: Codeunit "FT General Functions";
            begin
                if Rec."Attribute Type" <> Rec."Attribute Type"::Option then
                    exit;
                FTGeneralFunctions.GetMultiSelectionValue(Rec, RelatedRecordCode);
            end;
        }
    }

}
