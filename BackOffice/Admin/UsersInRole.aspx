<%@ Page Language="C#" MasterPageFile="~/BackOffice/MasterPage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="UsersInRole.aspx.cs" Inherits="_UsersInRole" Title="Users In Role Page" %>
<asp:Content ID="UsersInRole" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <ajax:ScriptManager ID="ScriptManager1" runat="server"></ajax:ScriptManager>
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
      <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="left" valign="top">
                    <table align="center" border="0" cellpadding="0" cellspacing="2" 
                        width="100%">
                            <tr>
                            <td align="center">
                                     <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataSourceID="ODSUsers" PageSize="100" Width="100%" OnRowCommand="GridViewUsers_RowCommand">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/BackOffice/Include/images/resource.gif" ShowSelectButton="True" />
                                            <asp:BoundField DataField="UserId" HeaderText="User ID" />
                                            <asp:BoundField DataField="Username" HeaderText="User Name" />
                                            <asp:BoundField DataField="FirstName" HeaderText="Frist Name" />
                                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                        </Columns>
                                    </asp:GridView>
                                 <br />
                            </td>
                            </tr>                                                      
                        </table>
                    </td>
                </tr>
            </table>
        <asp:ObjectDataSource ID="ODSUsers" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetUser" TypeName="System.FrameWork.FWUser"></asp:ObjectDataSource>         
        <asp:Panel ID="panelRole" runat="server" CssClass="modalPopup" Style="display: none" Width="450">
           <center>
            <br />
            <table border="0" cellpadding="3" cellspacing="0" width="400" class="whitebgBorder">
                <tr class="HeaderStyle" height="16">
                    <td colspan="2" align="center"><asp:Label ID="LabelUserInRoles" runat="server" Text="User In Roles" ForeColor="White"></asp:Label></td>
                </tr>
                <tr align="left" class="RowStyle" height="30">
                    <td width="120"><asp:Label ID="LabelUserID" runat="server" Text="User ID"></asp:Label></td>
                    <td><asp:TextBox ID="TextBoxUserID" runat="server" ReadOnly="True" Width="140px"></asp:TextBox></td>
                </tr>
                <tr align="left" class="AlternatingRowStyle" height="30">
                    <td><asp:Label ID="LabelRoleName" runat="server" Text="Role Name"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="ddRoleName" runat="server" Width="140px" DataSourceID="ODSRoles" DataTextField="RoleName" DataValueField="RoleName"></asp:DropDownList>
                     </td>
                </tr>
                <tr align="left" class="RowStyle" height="30">
                    <td><asp:Label ID="LabelApplicationName" runat="server" Text="Application Name"></asp:Label></td>
                    <td>
                      <asp:DropDownList ID="ddApplicationName" runat="server" Width="140px" DataSourceID="ODSApplication" DataTextField="ApplicationName" DataValueField="ApplicationName"></asp:DropDownList>
                    </td>
                </tr>
                <tr class="AlternatingRowStyle" height="30">
                    <td></td>
                    <td align="left"> 
                        <asp:Button ID="BtnOk" runat="server"  Text="Insert" OnClick="BtnOk_Click" />&nbsp;
                        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click"/>                                    
                    </td>
                </tr>
            </table>       
            <br />      
            <asp:GridView ID="GridViewUserInRoles" runat="server" AutoGenerateColumns="False" DataSourceID="ODSUserInRoles" Width="400px" DataKeyNames="UserId,RoleName" OnRowCommand="GridViewUserInRoles_RowCommand">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/BackOffice/Include/images/deleteicon.gif" />
                    <asp:BoundField DataField="UserId" HeaderText="User ID" />
                    <asp:BoundField DataField="RoleName" HeaderText="Role Name" />
                    <asp:BoundField DataField="ApplicationName" HeaderText="Application Name" />
                    <asp:BoundField DataField="Seq" HeaderText="Seq" />
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButtonUP" runat="server"  CausesValidation="False" ImageUrl="~/BackOffice/include/images/up.gif"  CommandName="UP" CommandArgument='<%# Container.DataItemIndex %>'/>
                        <asp:ImageButton ID="ImageButtonDown" runat="server" CausesValidation="False" ImageUrl="~/BackOffice/include/images/down.gif" CommandName="DOWN" CommandArgument='<%# Container.DataItemIndex %>'/>
                    </ItemTemplate>
                    <HeaderStyle Width="35px" />
                </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            </center>
            <asp:ObjectDataSource ID="ODSUserInRoles" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetUserInRoleByUserID" TypeName="System.FrameWork.FWUser" InsertMethod="InsertUserInRoles" DeleteMethod="DeleteUserInRoles" UpdateMethod="UpdateUsers">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxUserID" Name="UserID" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserId" Type="String" />
                    <asp:Parameter Name="RoleName" Type="String" />
                    <asp:Parameter Name="ApplicationName" Type="String" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Original_UserId" Type="String" />
                    <asp:Parameter Name="Original_RoleName" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Original_UserId" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="PreferCultureId" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSRoles" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetRoles" TypeName="System.FrameWork.FWRoles">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSApplication" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetApplications" TypeName="System.FrameWork.FWApplications"></asp:ObjectDataSource>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
         CancelControlID="BtnCancel" DropShadow="true" PopupControlID="panelRole"
         TargetControlID="btnTrigger">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Button ID="btnTrigger" runat="server" Style="display: none" />
      </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

