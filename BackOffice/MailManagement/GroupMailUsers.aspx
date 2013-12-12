<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="GroupMailUsers.aspx.cs" Inherits="_GroupMailUsers" Title="Group Mail Users Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<ajax:ScriptManager ID="ScriptManager1" runat="server" />
    <ajax:UpdatePanel ID="UpdatePanelUser" runat="server">
        <ContentTemplate>
    <table border="0" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td>
               <table border="0" cellpadding="4" cellspacing="0" width="98%">
                <tr>
                    <td width="48%" valign="top">
                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="90">
                                                <asp:Label ID="LabelRName" runat="server" Text="Name"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxName" runat="server" Width="94%"></asp:TextBox>
                                            </td>
                                            <td width="60" align="right"> 
                                                <asp:Button ID="ButtonSearch" runat="server" Text="Search" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="ODSUsersNotInGroup" PageSize="25" Width="100%" AllowPaging="True">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="First Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenFieldUserId" runat="server" Value='<%# Bind("UserId") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="4%" align="center" style="height: 230px">
                        <asp:ImageButton ID="ImageButtonMoveLeft" runat="server" ImageUrl="~/BackOffice/include/images/moveleft.gif" OnClick="ImageButtonMoveLeft_Click"/><br /><br />
                        <asp:ImageButton ID="ImageButtonMoveRight" runat="server" ImageUrl="~/BackOffice/include/images/moveright.gif" OnClick="ImageButtonMoveRight_Click"/>
                    </td>
                    <td width="48%" valign="top" style="height: 230px">
                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="70">
                                                <asp:Label ID="LabelGroup" runat="server" Text="Group Mail"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DDLGroup" runat="server" DataTextField="GNAME" DataValueField="GID" Width="98%" AutoPostBack="True" DataSourceID="ODSGroup">
                                                </asp:DropDownList>
                                            </td>
                                            <td align="right" width="35">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridViewUsersInGroup" runat="server" AutoGenerateColumns="False" DataKeyNames="GID,UserId" DataSourceID="ODSUsersInGroup" Width="100%" PageSize="25" AllowPaging="True">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="First Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenFieldGID" runat="server" Value='<%# Bind("GID") %>' />
                                                    <asp:HiddenField ID="HiddenFieldUserId" runat="server" Value='<%# Bind("UserId") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
               </table>
                <asp:ObjectDataSource ID="ODSUsersInGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetUsersInGroupByGID" TypeName="System.MailManagement.GroupMailUsers">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLGroup" Name="Original_GID" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetGroup" TypeName="System.MailManagement.Group">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSUsersNotInGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetUsersNotInGroup" TypeName="System.MailManagement.GroupMailUsers">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLGroup" Name="Original_GID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="TextBoxName" Name="FirstName" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
              </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

