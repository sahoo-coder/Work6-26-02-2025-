codeunit 50146 changeBaseField
{
    [EventSubscriber(ObjectType::Table, Database::Item, 'OnAfterValidateEvent', 'Item Tracking Code', false, false)]
    local procedure modifyItemTrackingCode(var Rec: Record Item; var xRec: Record Item)
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        ItemRec: Record Item;
    begin
        ItemLedgEntry.SetRange("Item No.", Rec."No.");
        if not ItemLedgEntry.IsEmpty() then begin
            Message('Changing Item TraCking Code from "%1" to "%2"', xRec."Item Tracking Code", Rec."Item Tracking Code");

            if ItemRec.Get(Rec."No.") then begin
                ItemRec."Item Tracking Code" := Rec."Item Tracking Code"; //ERROR IS HERE
                ItemRec.Modify(true);
            end;
        end;
    end;
}
