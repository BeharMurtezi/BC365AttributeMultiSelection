codeunit 50100 "FT EventsSub"
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterAssignItemValues', '', true, true)]
    local procedure OnAfterAssignItemValues(var SalesLine: Record "Sales Line"; Item: Record Item; SalesHeader: Record "Sales Header"; var xSalesLine: Record "Sales Line"; CurrentFieldNo: Integer)
    var
        FTGeneralFunctions: Codeunit "FT General Functions";
    begin
        FTGeneralFunctions.GetAttributeValue(SalesLine, Item);
    end;

}
