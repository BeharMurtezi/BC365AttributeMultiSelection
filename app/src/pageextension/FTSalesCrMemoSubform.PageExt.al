
pageextension 50105 "FT Sales Cr. Memo Subform" extends "Sales Cr. Memo Subform"
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
