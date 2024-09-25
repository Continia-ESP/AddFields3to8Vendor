tableextension 60111 "CDC Vendor Ext." extends Vendor
{
    fields
    {
        field(50103; "CDC ShortcutDim3Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "CDC ShortcutDim3Code");
            end;
        }
    }

}