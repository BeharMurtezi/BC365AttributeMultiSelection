pageextension 50102 "FT Item Attribute Values" extends "Item Attribute Values"
{
    //this is a trigger that is called when the page is opened
    //to filter out combine attributes
    trigger OnOpenPage()
    begin
        Rec.FilterGroup(20);
        Rec.SetRange("FT Combine Attribute", false);
        Rec.FilterGroup(0);
    end;
}
