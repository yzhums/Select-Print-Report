pageextension 50105 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field(ReportType; ReportType)
            {
                Caption = 'Report Type';
                ApplicationArea = All;
            }
        }
    }
}