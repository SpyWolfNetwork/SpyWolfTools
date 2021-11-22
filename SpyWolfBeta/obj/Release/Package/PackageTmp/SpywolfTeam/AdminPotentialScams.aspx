<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="AdminPotentialScams.aspx.cs" Inherits="SpyWolfBeta.SpywolfTeam.AdminPotentialScams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">
    <h3 style="padding-left:20px; text-align:left">Admin : Potential Scams</h3>
    <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False" DataSourceID="PotentialScamDB" KeyFieldName="Id" Width="100%" OnCellEditorInitialize="grid_CellEditorInitialize">
        <Styles>
            <AlternatingRow Enabled="true" />
        </Styles>
        <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowEditButton="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataBinaryImageColumn FieldName="Photo" Caption="Logo" VisibleIndex="0" Width="40">
                <PropertiesBinaryImage ImageHeight="40" ImageWidth="40" EnableServerResize="True">
                    <EditingSettings Enabled="true" />
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>
            <dx:GridViewDataTextColumn FieldName="ProjectName" VisibleIndex="1"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="LaunchType" FieldName="LaunchType" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LaunchTypeDS" ValueField="Id" ValueType="System.Int32"
                    TextField="LaunchType" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" />
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="ReleaseDate" VisibleIndex="3"></dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Level" FieldName="SecurityLevel" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="SecLevelDS" ValueField="Id" ValueType="System.Int32"
                    TextField="SecurityLevel" EnableSynchronization="False" IncrementalFilteringMode="StartsWith">
                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" />
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataCheckColumn FieldName="Redflag1" VisibleIndex="6"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Redflag2" VisibleIndex="7"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Redflag3" VisibleIndex="8"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Redflag4" VisibleIndex="9"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Redflag5" VisibleIndex="10"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="Website" VisibleIndex="11"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Twitter" VisibleIndex="12"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Telegram" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="15"></dx:GridViewDataCheckColumn>
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
    <asp:SqlDataSource runat="server" ID="PotentialScamDB" ConnectionString="<%$ ConnectionStrings:eLearningDBConnectionString %>" DeleteCommand="DELETE FROM [tblSpyPotentialScam] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblSpyPotentialScam] ([ProjectName], [LaunchType], [ReleaseDate], [SecurityLevel], [Redflag1], [Redflag2], [Redflag3], [Redflag4], [Redflag5], [Website], [Twitter], [Telegram], [Remarks], [Active], [Photo]) VALUES (@ProjectName, @LaunchType, @ReleaseDate, @SecurityLevel, @Redflag1, @Redflag2, @Redflag3, @Redflag4, @Redflag5, @Website, @Twitter, @Telegram, @Remarks, @Active, @Photo)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblSpyPotentialScam]" UpdateCommand="UPDATE [tblSpyPotentialScam] SET [ProjectName] = @ProjectName, [LaunchType] = @LaunchType, [ReleaseDate] = @ReleaseDate, [SecurityLevel] = @SecurityLevel, [Redflag1] = @Redflag1, [Redflag2] = @Redflag2, [Redflag3] = @Redflag3, [Redflag4] = @Redflag4, [Redflag5] = @Redflag5, [Website] = @Website, [Twitter] = @Twitter, [Telegram] = @Telegram, [Remarks] = @Remarks, [Active] = @Active, [Photo] = @Photo WHERE [Id] = @Id">
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
