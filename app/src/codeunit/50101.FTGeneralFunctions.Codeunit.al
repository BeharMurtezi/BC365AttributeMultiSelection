codeunit 50101 "FT General Functions"
{
    //this function is called from the table Sales Line when the user selects an item
    procedure GetAttributeValue(var SalesLine: Record "Sales Line"; var Item: Record Item)
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        ItemAttributeValue: Record "Item Attribute Value";
    begin
        ItemAttributeValueMapping.SetRange("Table ID", Database::Item);
        ItemAttributeValueMapping.SetRange("No.", Item."No.");
        if ItemAttributeValueMapping.FindFirst() then
            repeat
                if ItemAttributeValue.Get(ItemAttributeValueMapping."Item Attribute ID", ItemAttributeValueMapping."Item Attribute Value ID") then begin
                    if SalesLine."FT Attribute Value" = '' then
                        SalesLine."FT Attribute Value" := ItemAttributeValue.Value
                    else
                        SalesLine."FT Attribute Value" := CopyStr(SalesLine."FT Attribute Value" + ', ' + ItemAttributeValue.Value, 1, MaxStrLen(SalesLine."FT Attribute Value"));
                end;
            until ItemAttributeValueMapping.Next() = 0;
    end;
    //this function is called from the page Item Attribute Value List when the user selects an attribute value or multiple attribute values
    procedure GetMultiSelectionValue(var ItemAttributeValueSelection: Record "Item Attribute Value Selection"; var RelatedRecordCode: Code[20])
    var
        ItemAttributeValue: Record "Item Attribute Value";
        ItemAttributeValues: Page "Item Attribute Values";
        ToLongTextErr: Label 'The value is too long more then 250 characters, Please select a shorter value.';
        TextValue: Text;
        ItemAttribute: Record "Item Attribute";
    begin
        ItemAttributeValue.SetRange("Attribute ID", ItemAttributeValueSelection."Attribute ID");
        ItemAttributeValue.FindSet();
        ItemAttributeValues.SetTableView(ItemAttributeValue);
        ItemAttributeValues.LookupMode := true;
        if ItemAttributeValues.RunModal() = Action::LookupOK then begin
            ItemAttributeValues.SetSelectionFilter(ItemAttributeValue);
            if ItemAttributeValue.FindSet() then
                repeat
                    ConncateText(ItemAttributeValue.Value, TextValue);
                until ItemAttributeValue.Next() = 0;

        end;
        if StrLen(TextValue) > 250 then
            Error(ToLongTextErr);

        ItemAttributeValueSelection.Value := TextValue;
        ValidateAttributeValue(ItemAttributeValueSelection, ItemAttributeValue, RelatedRecordCode);
    end;

    local procedure ConncateText(FromValue: Text[250]; var ToValue: Text)
    begin
        if ToValue = '' then
            ToValue := FromValue
        else
            ToValue := ToValue + ', ' + FromValue;
    end;

    local procedure ValidateAttributeValue(var ItemAttributeValueSelection: Record "Item Attribute Value Selection"; var ItemAttributeValue: Record "Item Attribute Value"; var RelatedRecordCode: Code[20])
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
    begin
        if not ItemAttributeValueSelection.FindAttributeValue(ItemAttributeValue) then begin
            ItemAttributeValueSelection.InsertItemAttributeValue(ItemAttributeValue, ItemAttributeValueSelection);
            ItemAttributeValue."FT Combine Attribute" := true;
            ItemAttributeValue.Modify();
        end;
        ItemAttributeValueMapping.SetRange("Table ID", Database::Item);
        ItemAttributeValueMapping.SetRange("No.", RelatedRecordCode);
        ItemAttributeValueMapping.SetRange("Item Attribute ID", ItemAttributeValue."Attribute ID");
        if ItemAttributeValueMapping.FindFirst() then begin
            ItemAttributeValueMapping."Item Attribute Value ID" := ItemAttributeValue.ID;
            ItemAttributeValueMapping.Modify();
        end;
    end;
}