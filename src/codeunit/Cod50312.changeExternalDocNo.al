codeunit 50312 "changeExternalDocNo"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnValidateSellToCustomerNoOnAfterTestStatusOpen', '', false, false)]
    local procedure changeToDefault(var SalesHeader: Record "Sales Header")
    begin

        if (SalesHeader."Sell-to Customer No." = '10000') AND (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) then
            SalesHeader."External Document No." := 'DOC10000';
    end;
}