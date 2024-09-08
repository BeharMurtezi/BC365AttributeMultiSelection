pageextension 50108 "FT Post. Sal. Cr. Memo Subform" extends "Posted Sales Cr. Memo Subform"
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
