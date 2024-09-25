codeunit 60111 "CDC Dim Subs."
{
    [EventSubscriber(ObjectType::Table, Database::"Default Dimension", 'OnAfterModifyEvent', '', true, true)]
    local procedure OnAfterModifyDefaultDim(var Rec: Record "Default Dimension")
    begin
        UpdateDimCode(3, Rec."No.", Rec."Dimension Value Code");
    end;

    local procedure UpdateDimCode(DimCodeNo: integer; VendorNo: Code[20]; NewDimValue: Code[20])
    var
        Vend: Record Vendor;
    begin
        IF Vend.GET(VendorNo) THEN BEGIN
            CASE DimCodeNo OF
                3:
                    Vend."CDC ShortcutDim3Code" := NewDimValue;
            END;
            Vend.MODIFY(TRUE);
        END;
    end;
}