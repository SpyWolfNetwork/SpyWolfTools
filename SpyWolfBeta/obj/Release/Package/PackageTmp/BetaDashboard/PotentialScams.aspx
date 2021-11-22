<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="PotentialScams.aspx.cs" Inherits="SpyWolfBeta.BetaDashboard.PotentialScams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">
    <h3 style="padding-left: 20px; text-align: left">Potential Scams</h3>
    <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False" DataSourceID="PotentialScamDB" KeyFieldName="Id" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnCellEditorInitialize="grid_CellEditorInitialize">
        <Styles>
            <AlternatingRow Enabled="true"/>
            <Header HorizontalAlign="Center" Border-BorderStyle="None" Font-Bold="true"></Header>
            <Cell HorizontalAlign="Center" Border-BorderStyle="None" Font-Bold="true"></Cell>
        </Styles>
        <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
        <Columns>
            <dx:GridViewDataColumn Caption="Project" VisibleIndex="0" Width="150" Visible="false">
                <DataItemTemplate>
                    <table class="categoryTable" style="padding-right:10px;text-align:left">
                        <tr>
                            <td>
                                <dx:ASPxBinaryImage ID="ASPxBinaryImage1" Width="40" Height="40" runat="server" Value='<%# Eval("Photo") %>' />
                            </td>
                            <td>
                                <dx:ASPxLabel ID="aspxLabProjectName" runat="server" Font-Bold="true" Text='<%# Eval("ProjectName") %>' />
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataBinaryImageColumn FieldName="Photo" Caption=" " VisibleIndex="0" Width="40">
                <PropertiesBinaryImage ImageHeight="40" ImageWidth="40" EnableServerResize="True">
                    <EditingSettings Enabled="true" />
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>
            <dx:GridViewDataTextColumn FieldName="ProjectName" Caption="Project" VisibleIndex="1" HeaderStyle-HorizontalAlign="left" CellStyle-HorizontalAlign="left" CellStyle-Font-Bold="true" Width="150"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="LaunchType" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LaunchTypeDS" ValueField="Id" ValueType="System.Int32"
                    TextField="LaunchType" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" />
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="ReleaseDate" VisibleIndex="3" Width="180">
                <PropertiesDateEdit DisplayFormatString="ddd MMMM dd, yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Risk" FieldName="SecurityLevel" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="SecLevelDS" ValueField="Id" ValueType="System.Int32"
                    TextField="SecurityLevel" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" />
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn Caption="Links" VisibleIndex="6" Width="100">
                <DataItemTemplate>
                    <table class="categoryTable">
                        <tr>
                            <td class="textCell" style="width: 33%; padding-right: 10px">
                                <a href='<%# Eval("Telegram") %>' target="_blank">
                                    <img src="/Content/images/Telegram.png" alt="Telegram" width="20" height="20" /></a>
                            </td>
                            <td class="textCell" style="width: 33%; padding-right: 10px">
                                <a href='<%# Eval("Twitter") %>' target="_blank">
                                    <img src="/Content/images/Twitter.png" alt="Twitter" width="20" height="20" /></a>
                            </td>
                            <td class="textCell" style="width: 33%">
                                <a href='<%# Eval("Website") %>' target="_blank">
                                    <img src="/Content/images/Web.png" alt="Website" width="20" height="20" /></a>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Red Flags" VisibleIndex="5" Width="270">
                <DataItemTemplate>
                    <table class="categoryTable">
                        <tr>
                            <td class="textCell" style="width: 33%; padding-right: 10px">
                                <div style="float:left"><a href='<%# Eval("Telegram") %>' target="_blank" style="visibility:<%# Eval("RedFlag1").ToString() == "True" ? "Visible" : "Hidden" %>"><img src="/Content/images/Redflag1.png" alt="Telegram" width="80" height="20" /></a></div>
                                <div style="float:left"><a href='<%# Eval("Telegram") %>' target="_blank" style="visibility:<%# Eval("RedFlag2").ToString() == "True" ? "Visible" : "Hidden" %>"><img src="/Content/images/Redflag2.png" alt="Telegram" width="80" height="20" /></a></div>
                                <div style="float:left"><a href='<%# Eval("Telegram") %>' target="_blank" style="visibility:<%# Eval("RedFlag3").ToString() == "True" ? "Visible" : "Hidden" %>"><img src="/Content/images/Redflag3.png" alt="Telegram" width="80" height="20" /></a></div>
                                <div style="float:left"><a href='<%# Eval("Telegram") %>' target="_blank" style="visibility:<%# Eval("RedFlag4").ToString() == "True" ? "Visible" : "Hidden" %>"><img src="/Content/images/Redflag4.png" alt="Telegram" width="80" height="20" /></a></div>
                                <div style="float:left"><a href='<%# Eval("Telegram") %>' target="_blank" style="visibility:<%# Eval("RedFlag5").ToString() == "True" ? "Visible" : "Hidden" %>"><img src="/Content/images/Redflag5.png" alt="Telegram" width="80" height="20" /></a></div>

                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="14" Visible="false">
            </dx:GridViewDataTextColumn>
        </Columns>
        <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>
        <SettingsPopup>
            <EditForm Width="900" HorizontalAlign="Center" VerticalAlign="WindowCenter">
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="PotentialScamDB" ConnectionString="<%$ ConnectionStrings:eLearningDBConnectionString %>" DeleteCommand="DELETE FROM [tblSpyPotentialScam] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblSpyPotentialScam] ([ProjectName], [LaunchType], [ReleaseDate], [SecurityLevel], [Redflag1], [Redflag2], [Redflag3], [Redflag4], [Redflag5], [Website], [Twitter], [Telegram], [Remarks], [Active], [Photo]) VALUES (@ProjectName, @LaunchType, @ReleaseDate, @SecurityLevel, @Redflag1, @Redflag2, @Redflag3, @Redflag4, @Redflag5, @Website, @Twitter, @Telegram, @Remarks, @Active, @Photo)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblSpyPotentialScam] where active =1 Order By Id DESC" UpdateCommand="UPDATE [tblSpyPotentialScam] SET [ProjectName] = @ProjectName, [LaunchType] = @LaunchType, [ReleaseDate] = @ReleaseDate, [SecurityLevel] = @SecurityLevel, [Redflag1] = @Redflag1, [Redflag2] = @Redflag2, [Redflag3] = @Redflag3, [Redflag4] = @Redflag4, [Redflag5] = @Redflag5, [Website] = @Website, [Twitter] = @Twitter, [Telegram] = @Telegram, [Remarks] = @Remarks, [Active] = @Active, [Photo] = @Photo WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProjectName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LaunchType" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="SecurityLevel" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Redflag1" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag2" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag3" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag4" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag5" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Website" Type="String"></asp:Parameter>
            <asp:Parameter Name="Twitter" Type="String"></asp:Parameter>
            <asp:Parameter Name="Telegram" Type="String"></asp:Parameter>
            <asp:Parameter Name="Remarks" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Photo"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProjectName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LaunchType" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="SecurityLevel" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Redflag1" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag2" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag3" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag4" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Redflag5" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Website" Type="String"></asp:Parameter>
            <asp:Parameter Name="Twitter" Type="String"></asp:Parameter>
            <asp:Parameter Name="Telegram" Type="String"></asp:Parameter>
            <asp:Parameter Name="Remarks" Type="String"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Photo"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SecLevelDS" runat="server" ConnectionString='<%$ ConnectionStrings:eLearningDBConnectionString %>'
        SelectCommand="SELECT * FROM [tblCommonSpySecurityLevel]  " EnableCaching="true"></asp:SqlDataSource>
    <asp:SqlDataSource ID="LaunchTypeDS" runat="server" ConnectionString='<%$ ConnectionStrings:eLearningDBConnectionString %>'
        SelectCommand="SELECT * FROM [tblCommonSpyLaunchType]  " EnableCaching="true"></asp:SqlDataSource>

</asp:Content>
