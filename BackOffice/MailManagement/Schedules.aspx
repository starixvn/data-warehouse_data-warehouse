<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="Schedules.aspx.cs" Inherits="_Schedules" Title="Schedules Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <ajax:ScriptManager ID="ScriptManager1" runat="server">
    </ajax:ScriptManager>
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="left" valign="top">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="GridViewCtrl" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="SCID" DataSourceID="ODSCtrl" Width="98%">
                                        <PagerSettings Position="Top" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                                                EditImageUrl="~/BackOffice/Include/images/editicon.gif" ShowEditButton="True"
                                                UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif" ValidationGroup="Update">
                                                <HeaderStyle Width="70px" />
                                            </asp:CommandField>
                                            <asp:TemplateField HeaderText="Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxScheduleName" runat="server" Text='<%# Bind("ScheduleName") %>' Width="134px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelScheduleName" runat="server" Text='<%# Bind("ScheduleName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="200px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Time">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxTime" runat="server" Text='<%# Bind("Time", "{0:HH:mm}") %>' Width="39px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelTime" runat="server" Text='<%# Bind("Time", "{0:HH:mm}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="120px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delivery">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxDelivery" runat="server" Text='<%# Bind("Delivery") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDelivery" runat="server" Text='<%# Bind("Delivery") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="ODSCtrl" runat="server"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSchedules" TypeName="System.MailManagement.Schedules"
                                        UpdateMethod="UpdateGroup">
                                        <UpdateParameters>
                                            <asp:Parameter Name="Original_SCID" Type="String" />
                                            <asp:Parameter Name="ScheduleName" Type="String" />
                                            <asp:Parameter Name="Time" Type="String" />
                                            <asp:Parameter Name="Delivery" Type="String" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

