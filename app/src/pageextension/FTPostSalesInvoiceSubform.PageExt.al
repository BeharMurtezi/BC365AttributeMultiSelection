
pageextension 50106 "FT Post. Sales Invoice Subform" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("FT Attribute Value"; Rec."FT Attribute Value")
            {
                ApplicationArea = All;
                Caption = 'Attribute Value';
                ToolTip = 'Specifies the Attribute Value of transaction that was posted with the line.';
            }
        }
    }
}
