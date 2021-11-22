<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="WalletInfo.aspx.cs" Inherits="SpyWolfBeta.BetaDashboard.WalletInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">
    <script src="/content/fusioncharts.js"></script>
    <script src="/content/fusioncharts.charts.js"></script>
    <script src="/content/fusioncharts.theme.candy.js"></script>
    <script type="text/javascript">
    </script>
    <h3 style="padding-left: 20px">Spy Wallet Information</h3>
    <table style="width: 700px; padding-left: 20px">
        <tr style="padding-bottom: 10px;">
            <td style="width: 140px">Address : 
            </td>
            <td style="width: 410px">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="400">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="cmdTrack" runat="server" Text="View" OnClick="cmdTrack_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <div id="chart-container"></div>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" KeyFieldName="Id" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnCellEditorInitialize="grid_CellEditorInitialize">
        <Styles>
            <AlternatingRow Enabled="true" />
        </Styles>
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
            <dx:GridViewDataTextColumn FieldName="blockNumber" VisibleIndex="2" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DateFormat1" Caption="Date" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" Caption="Timestamp" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="hash" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nonce" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn Caption="From" VisibleIndex="1" Width="100" Visible="false">
                <DataItemTemplate>
                    <table class="categoryTable">
                        <tr>
                            <td class="textCell" style="width: 33%">
                                <a href='BetaDashboard.aspx?add=<%# Eval("from") %>'><%# Eval("from") %></a>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="To" VisibleIndex="1" Width="100" Visible="false">
                <DataItemTemplate>
                    <table class="categoryTable">
                        <tr>
                            <td class="textCell" style="width: 33%">
                                <a href='BetaDashboard.aspx?add=<%# Eval("to") %>'><%# Eval("to") %></a>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="value1" Caption="BNB" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="gas" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="gasPrice" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="isError" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="txreceipt_status" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="input" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="contractAddress" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="cumulativeGasUsed" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="gasUsed" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="confirmations" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
        </Columns>
        <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>
        <SettingsPopup>
            <EditForm Width="900" HorizontalAlign="Center" VerticalAlign="WindowCenter">
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
        <SettingsPager Position="TopAndBottom" PageSize="200">
        </SettingsPager>
    </dx:ASPxGridView>
</asp:Content>
