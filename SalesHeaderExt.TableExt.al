tableextension 50105 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50105; ReportType; option)
        {
            Caption = 'Report Type';
            OptionMembers = " ","Sales – Quote (204)","Order Confirmation (205)","Standard Sales-Quote (1304)","Standard Sales-Order Conf. (1305)";
            OptionCaption = ' ,Sales – Quote (204),Order Confirmation (205),Standard Sales-Quote (1304),Standard Sales-Order Conf. (1305)';
            DataClassification = CustomerContent;
        }
    }
}