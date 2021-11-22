<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="MigrationDashboard.aspx.cs" Inherits="SpyWolfBeta.BetaDashboard.MigrationDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">
    <h3 style="padding-left: 20px">Secured Ship Migration Wallet</h3>
    <table style="width: 700px; padding-left: 20px">
        <tr style="padding-bottom: 10px;">
            <td style="width: 80px">Address : 
            </td>
            <td style="width: 410px">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="400"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="cmdTrack" runat="server" Text="Track" OnClick="cmdTrack_Click"></dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">BNB : 
            </td>
            <td style="width: 410px; padding-top: 10px">
                <dx:ASPxTextBox ID="txtBalance2" runat="server" Width="400" ReadOnly="true"></dx:ASPxTextBox>
            </td>
            <td>
                <br />
            </td>
        </tr>

    </table>
    <br />
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporterMigration" runat="server" GridViewID="grid">
    </dx:ASPxGridViewExporter>
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" KeyFieldName="Id" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnCellEditorInitialize="grid_CellEditorInitialize">
        <Styles>
            <AlternatingRow Enabled="true" />
        </Styles>
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
        <Toolbars>
            <dx:GridViewToolbar>
                <SettingsAdaptivity Enabled="true" EnableCollapseRootItemsToIcons="true" />
                <Items>
                    <dx:GridViewToolbarItem Command="ExportToPdf" />
                    <dx:GridViewToolbarItem Command="ExportToXls" />
                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                    <dx:GridViewToolbarItem Command="ExportToDocx" />
                    <dx:GridViewToolbarItem Command="ExportToRtf" />
                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn Caption="TX" VisibleIndex="1" Width="20">
                <DataItemTemplate>
                    <table class="categoryTable">
                        <tr>
                            <td class="textCell" style="width: 33%">
                                <a href='<%# Eval("PooLink") %>' target="_blank">
                                    <img src="/Content/images/Web.png" alt="Website" width="20" height="20" /></a>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="from" Caption="From" VisibleIndex="1" Width="100"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="blockNumber" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="hash" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nonce" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn Caption="From" VisibleIndex="1" Width="100" Visible="false">
                <DataItemTemplate>
                    <table class="categoryTable">
                        <tr>
                            <td class="textCell" style="width: 33%">
                                <a href='MigrationDashboard.aspx?add=<%# Eval("from") %>'><%# Eval("from") %></a>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="To" VisibleIndex="1" Width="100">
                <DataItemTemplate>
                    <table class="categoryTable">
                        <tr>
                            <td class="textCell" style="width: 33%">
                                <a href='MigrationBetaDashboard.aspx?add=<%# Eval("to") %>'><%# Eval("to") %></a>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="valueShip" Caption="value" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="gas" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DateFormat1" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="gasPrice" VisibleIndex="3"><PropertiesTextEdit DisplayFormatString="c" /></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="isError" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="txreceipt_status" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="input" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="contractAddress" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="cumulativeGasUsed" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="gasUsed" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="confirmations" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CsvText" VisibleIndex="3"></dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="true" />
        <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>
        <SettingsPopup>
            <EditForm Width="900" HorizontalAlign="Center" VerticalAlign="WindowCenter">
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
        <SettingsPager Position="TopAndBottom" PageSize="100">
        </SettingsPager>
    </dx:ASPxGridView>
</asp:Content>
