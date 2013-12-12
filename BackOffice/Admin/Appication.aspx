<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master"
    AutoEventWireup="true" CodeFile="Appication.aspx.cs" Inherits="_Appication" Title="Appication Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <ajax:ScriptManager ID="ScriptManager1" runat="server" />
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="left" valign="top">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
                            <tr>
                                <td align="center">
                                    <asp:DetailsView ID="DetailsViewAplication" runat="server" Width="95%" AutoGenerateInsertButton="True"
                                        AutoGenerateRows="False" DataSourceID="ODSAplication" DefaultMode="Insert" HeaderText="Applications">
                                        <Fields>
                                            <asp:TemplateField HeaderText="Application Name">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxApplicationName" runat="server" Text='<%# Bind("ApplicationName") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelApplicationName" runat="server" Text='<%# Bind("ApplicationName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                    &nbsp; &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="GridViewCtrl" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicationName"
                                        DataSourceID="ODSAplication" Width="95%">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/BackOffice/include/images/deleteicon.gif"
                                                ShowDeleteButton="True">
                                                <HeaderStyle Width="50px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="ApplicationName" HeaderText="Application Name" ReadOnly="True" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="ODSAplication" runat="server" DeleteMethod="DeleteAplication"
                                        InsertMethod="InsertAplication" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetApplications" TypeName="System.FrameWork.FWApplications">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ApplicationName" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ApplicationName" Type="String" />
                                            <asp:Parameter Name="Description" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>
