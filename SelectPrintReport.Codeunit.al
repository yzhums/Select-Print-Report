codeunit 50105 SelectPrintReport
{
    [EventSubscriber(ObjectType::Table, Database::"Report Selections", 'OnBeforePrintWithGUIYesNo', '', true, true)]
    local procedure PrintSalesOrder(ReportUsage: Integer; RecordVariant: Variant; IsGUI: Boolean; CustomerNoFieldNo: Integer; var Handled: Boolean)
    var
        DataTypeMGT: Codeunit "Data Type Management";
        SalesHeaderRecordRef: RecordRef;
        ReportSelectionTemp: Record "Report Selections" temporary;
        SalesHeader: Record "Sales Header";
    begin
        DataTypeMGT.GetRecordRef(RecordVariant, SalesHeaderRecordRef);
        if SalesHeaderRecordRef.Number <> Database::"Sales Header" then
            exit;
        if ReportUsage <> ReportSelectionTemp.Usage::"S.Order" then
            exit;

        SalesHeader := RecordVariant;

        with SalesHeader do
            case ReportType of
                Reporttype::" ":
                    exit;
                ReportType::"Sales – Quote (204)":
                    Report.RunModal(Report::"Sales - Quote", IsGUI, false, RecordVariant);
                ReportType::"Order Confirmation (205)":
                    Report.RunModal(Report::"Order Confirmation", IsGUI, false, RecordVariant);
                ReportType::"Standard Sales-Quote (1304)":
                    Report.RunModal(Report::"Standard Sales - Quote", IsGUI, false, RecordVariant);
                ReportType::"Standard Sales-Order Conf. (1305)":
                    Report.RunModal(Report::"Standard Sales - Order Conf.", IsGUI, false, RecordVariant);
            end;

        Handled := true;
    end;
}