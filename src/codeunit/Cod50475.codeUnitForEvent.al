codeunit 50475 codeUnitForEvent
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
    local procedure removeDefault_quan_to_ship(var Rec: Record "Sales Line")
    begin
        Rec.Validate("Qty. to Ship", 0);
    end;

    var
        myInt: Integer;
}