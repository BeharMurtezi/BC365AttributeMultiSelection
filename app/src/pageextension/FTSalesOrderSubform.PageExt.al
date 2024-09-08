
pageextension 50104 "FT Sales Order Subform" extends "Sales Order Subform"
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

