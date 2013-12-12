<%@ Page Language="C#" MasterPageFile="~/BackOffice/MasterPage/MasterSingleCanvas.master"
    AutoEventWireup="true" CodeFile="Roles.aspx.cs" Inherits="_Roles" Title="Roles Page" %>

<asp:Content ID="Roles" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <ajax:ScriptManager ID="ScriptManager1" runat="server">
    </ajax:ScriptManager>
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="center" valign="top">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
                            <tr>
                                <td align="left">
                                    <!-- Start-->
                                    <table width="100%">
                                        <tr>
                                            <td align="left" width="100%">
                                                <asp:DetailsView ID="DetailsViewRoles" runat="server" AutoGenerateInsertButton="True"
                                                    AutoGenerateRows="False" DataSourceID="ObjectDataSourceRoles" DefaultMode="Insert"
                                                    Height="50px" Width="100%" HeaderText="Roles">
                                                    <Fields>
                                                        <asp:TemplateField HeaderText="Role Name">
                                                            <InsertItemTemplate>
                                                                <asp:TextBox ID="TextBoxRoleName" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                                                            </InsertItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="LabelRoleName" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Application Name">
                                                            <InsertItemTemplate>
                                                                <asp:DropDownList ID="DropDownListApplicationName" runat="server" DataSourceID="ODSApplications"
                                                                    DataTextField="Description" DataValueField="ApplicationName" SelectedValue='<%# Bind("ApplicationName") %>'
                                                                    Width="160px">
                                                                </asp:DropDownList>
                                                            </InsertItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="LabelApplicationName" runat="server" Text='<%# Bind("ApplicationName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Fields>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:DetailsView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <br />
                                    <asp:GridView ID="GridViewRoles" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSourceRoles"
                                        PageSize="50" Width="100%" OnRowCommand="GridViewRoles_RowCommand" DataKeyNames="RoleName">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/BackOffice/Include/images/resource.gif"
                                                ShowSelectButton="True" />
                                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/BackOffice/include/images/deleteicon.gif"
                                                ShowDeleteButton="True" />
                                            <asp:BoundField DataField="RoleName" HeaderText="Role Name" />
                                            <asp:BoundField DataField="ApplicationName" HeaderText="Application Name" />
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                </td>
                            </tr>
                            <asp:ObjectDataSource ID="ObjectDataSourceRoles" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetRoles" TypeName="System.FrameWork.FWRoles" InsertMethod="InsertRoles"
                                DeleteMethod="DeleteRolesAll" UpdateMethod="UpdateRolesInCulture">
                                <InsertParameters>
                                    <asp:Parameter Name="RoleName" Type="String" />
                                    <asp:Parameter Name="ApplicationName" Type="String" />
                                </InsertParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_RoleName" Type="String" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Original_RoleName" Type="String" />
                                    <asp:Parameter Name="Original_CultureId" Type="String" />
                                    <asp:Parameter Name="Title" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ODSApplications" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetApplications" TypeName="System.FrameWork.FWApplications"></asp:ObjectDataSource>
                            <tr>
                                <td align="left">
                                    <br />
                                    <asp:Panel ID="panelRole" runat="server" CssClass="modalPopup" Style="display: none"
                                        Width="450">
                                        <center>
                                            <asp:ObjectDataSource ID="ObjectDataSourceRoleLocale" runat="server" InsertMethod="InsertRolesInCulture"
                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetRolesLocaleByRoleName"
                                                TypeName="System.FrameWork.FWRoles" UpdateMethod="UpdateRolesInCulture" DeleteMethod="DeleteRolesInCulture">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="roleName" Name="RoleName" PropertyName="Text" Type="String" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Original_RoleName" Type="String" />
                                                    <asp:Parameter Name="Original_CultureId" Type="String" />
                                                    <asp:Parameter Name="Title" Type="String" />
                                                </UpdateParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="RoleName" Type="String" />
                                                    <asp:Parameter Name="CultureId" Type="String" />
                                                    <asp:Parameter Name="Title" Type="String" />
                                                </InsertParameters>
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_RoleName" Type="String" />
                                                    <asp:Parameter Name="Original_CultureId" Type="String" />
                                                </DeleteParameters>
                                            </asp:ObjectDataSource>
                                            <asp:ObjectDataSource ID="ODSLanguage" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetRolesLocaleNotInLanguag" TypeName="System.FrameWork.FWRoles"
                                                DeleteMethod="DeleteRolesInCulture" InsertMethod="InsertRolesInCulture" UpdateMethod="UpdateRolesInCulture">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_RoleName" Type="String" />
                                                    <asp:Parameter Name="Original_CultureId" Type="String" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Original_RoleName" Type="String" />
                                                    <asp:Parameter Name="Original_CultureId" Type="String" />
                                                    <asp:Parameter Name="Title" Type="String" />
                                                </UpdateParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="roleName" Name="RoleName" PropertyName="Text" Type="String" />
                                                </SelectParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="RoleName" Type="String" />
                                                    <asp:Parameter Name="CultureId" Type="String" />
                                                    <asp:Parameter Name="Title" Type="String" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
                                            <asp:HiddenField ID="HidRoleName" runat="server" Value='<%# Eval("RoleName") %>' />
                                            <br />
                                            <table border="0" cellpadding="3" cellspacing="0" width="400" class="whitebgBorder">
                                                <tr class="HeaderStyle" height="16">
                                                    <td colspan="2" align="left">
                                                        <asp:Label ID="LabelRoleLocale" runat="server" Text="Role Locale" ForeColor="White"></asp:Label></td>
                                                </tr>
                                                <tr align="left" class="RowStyle" height="30">
                                                    <td width="80">
                                                        <asp:Label ID="LabelRoleName" runat="server" Text="Role Name"></asp:Label></td>
                                                    <td>
                                                        <asp:TextBox ID="roleName" runat="server" ReadOnly="True" Text='<%# Bind("RoleName") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr align="left" class="AlternatingRowStyle" height="30">
                                                    <td width="80">
                                                        <asp:Label ID="LabelLanguage" runat="server" Text="Culture"></asp:Label></td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="formStyle" DataSourceID="ODSLanguage"
                                                            DataTextField="CultureId" DataValueField="CultureId" Width="136px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr align="left" class="RowStyle" height="30">
                                                    <td width="80">
                                                        <asp:Label ID="LabelTitle" runat="server" Text="Title"></asp:Label></td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxTitle" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr class="AlternatingRowStyle" height="30">
                                                    <td colspan="2">
                                                        <asp:Button ID="BtnOk" runat="server" OnClick="BtnOk_Click" Text="Insert" />&nbsp;
                                                        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:GridView ID="GridViewPopUp" runat="server" AutoGenerateColumns="False" DataKeyNames="CultureId,RoleName"
                                                DataSourceID="ObjectDataSourceRoleLocale" Width="400px" OnRowCommand="GridViewPopUp_RowCommand">
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                                                        DeleteImageUrl="~/BackOffice/Include/images/deleteicon.gif" EditImageUrl="~/BackOffice/Include/images/editicon.gif"
                                                        ShowEditButton="True" UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif"
                                                        ValidationGroup="Update" ShowDeleteButton="True">
                                                        <HeaderStyle Width="5%" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="RoleName" HeaderText="Role Name" ReadOnly="True">
                                                        <HeaderStyle Width="70px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="CultureId" HeaderText="Locale" ReadOnly="True">
                                                        <HeaderStyle Width="80px" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Title">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("Title") %>' Width="190px"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <br />
                                        </center>
                                    </asp:Panel>
                                    <br />
                                </td>
                            </tr>
                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                CancelControlID="BtnCancel" DropShadow="true" PopupControlID="panelRole" TargetControlID="btnTrigger">
                            </ajaxToolkit:ModalPopupExtender>
                            <asp:Button ID="btnTrigger" runat="server" Style="display: none" /><!-- END--></table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>
