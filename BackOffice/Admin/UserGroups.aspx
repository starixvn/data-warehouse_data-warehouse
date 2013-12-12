<%@ Page Title="User Group" Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master"
    AutoEventWireup="true" CodeFile="UserGroups.aspx.cs" Inherits="BackOffice_Admin_UserGroups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <ajax:ScriptManager ID="ScriptManager1" runat="server" />
    <ajax:UpdatePanel ID="UpdatePanelUserGroup" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="4" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <table border="0" cellpadding="3" cellspacing="0" width="98%" class="whitebgBorder">
                            <tr class="HeaderStyle" height="16">
                                <td colspan="2" align="left">
                                    <asp:Label ID="LabelTitle" runat="server" Text=" User Group" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            <tr  align="left" class="RowStyle" height="30">
                                <td>
                                    <script type="text/javascript">
                                        function EnableSubGroup(chk) {
                                            var a = new Array();
                                            a = 'Group name:,SubGroup name:'.split(',');
                                            name = '<%=LabelGroupName.ClientID%>';
                                            document.getElementById(name).textContent = a[(chk.checked ? 1 : 0)];
                                        
                                            name = '<%=LabelParentGroup.ClientID%>';
                                            document.getElementById(name).style.display = (chk.checked ? "" : "none");
                                            
                                            name = '<%=DDLGroupOfInsertForm.ClientID%>';
                                            document.getElementById(name).style.display = (chk.checked ? "" : "none"); //document.getElementById(name).disabled = !chk.checked;
                                        }
                                    </script>
                                    <asp:CheckBox ID="CheckBoxCreatingSubGroup" runat="server" Text="Sub Group" Checked="false" 
                                    OnClick="EnableSubGroup(this);" />
                                </td>
                            </tr>
                            <tr align="left" class="AlternatingRowStyle" height="30">
                                <td width="80">
                                    <asp:Label ID="LabelGroupName" runat="server" Text="Group name:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxGroupName" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left" class="RowStyle" height="30">
                                <td width="80">
                                    <asp:Label ID="LabelParentGroup" runat="server" Text="Parent group:" style="display:none"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DDLGroupOfInsertForm" runat="server" 
                                        DataSourceID="ODSGroupsOfInsertForm" DataTextField="groupname" 
                                        DataValueField="groupid" style="display:none">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left" class="RowStyle" height="30">
                                <td width="80">
                                </td>
                                <td>
                                    <asp:Button ID="ButtonInsertUserGroup" runat="server" Text="Insert Group" 
                                        onclick="ButtonInsertUserGroup_Click" />
                                    <asp:Button ID="ButtonInsertCancel" runat="server" Text="Cancel" 
                                        onclick="ButtonInsertCancel_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="4" cellspacing="0" width="98%">
                            <%--Table contains 3 columns--%>
                            <tr>
                                <td width="48%" valign="top" style="height: 230px">
                                    <%--Column 1: contains user information--%>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Label ID="Label1" runat="server" Text="Keyword:"></asp:Label>&nbsp;
                                                            <asp:TextBox ID="TxKeyword" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Button ID="ButtonSearch" runat="server" Text="Search" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <asp:RadioButtonList ID="RadioButtonListOfRole" runat="server" 
                                                                RepeatDirection="Horizontal" AutoPostBack="True">
                                                                <asp:ListItem Value="4">Super</asp:ListItem>
                                                                <asp:ListItem Value="3">Master</asp:ListItem>
                                                                <asp:ListItem Value="2">Agent</asp:ListItem>
                                                                <asp:ListItem Selected="True" Value="1">Member</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" 
                                                    PageSize="50" Width="98%" DataSourceID="ODSUsers" DataKeyNames="CustID">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CheckBoxUser" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:BoundField DataField="CustID" HeaderText="ID" ReadOnly="true"></asp:BoundField>--%>
                                                        <asp:BoundField DataField="Username" HeaderText="UserName" ReadOnly="True">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="true"></asp:BoundField>
                                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="true"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="4%" align="center" style="height: 230px">
                                    <%--Column 2: contains left-to-right and right-to-left buttons--%>
                                    <asp:ImageButton ID="ImageButtonMoveLeft" runat="server" ImageUrl="~/BackOffice/include/images/moveleft.gif"
                                        OnClick="ImageButtonMoveLeft_Click" /><br />
                                    <br />
                                    <asp:ImageButton ID="ImageButtonMoveRight" runat="server" ImageUrl="~/BackOffice/include/images/moveright.gif"
                                        OnClick="ImageButtonMoveRight_Click" />
                                </td>
                                <td width="48%" valign="top" style="height: 230px">
                                    <%--Column 3: contains users in the group--%>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="70">
                                                            <asp:Label ID="Label2" runat="server" Text="Group:"></asp:Label>&nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DDLGroup" runat="server" Width="98%" AutoPostBack="True" DataSourceID="ODSGroups"
                                                                DataTextField="groupname" DataValueField="groupid">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" width="35">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="70">
                                                            <asp:Label ID="Label3" runat="server" Text="Sub Group:"></asp:Label>&nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DDLSubGroup" runat="server" Width="98%" AutoPostBack="True"
                                                                DataSourceID="ODSSubGroups" DataTextField="groupname" DataValueField="groupid">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" width="35">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridViewUsersInGroup" AutoGenerateColumns="False" runat="server"
                                                    Width="100%" PageSize="50" DataSourceID="ODSUsersInGroup" DataKeyNames="CustID">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CheckBoxUserInGroup" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:BoundField DataField="CustID" HeaderText="ID" ReadOnly="true"></asp:BoundField>--%>
                                                        <asp:BoundField DataField="GroupName" HeaderText="SubGroup" ReadOnly="true"></asp:BoundField>
                                                        <asp:BoundField DataField="Username" HeaderText="UserName" ReadOnly="True">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="true"></asp:BoundField>
                                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="true"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            
            
            <asp:ObjectDataSource ID="ODSGroupsOfInsertForm" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetGroupsAll" 
                TypeName="System.Account.ACGroups"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSUsers" runat="server" OldValuesParameterFormatString="original_{0}"
                EnablePaging="true" SelectMethod="GetCustomersNotInGroup" SelectCountMethod="GetCustomersNotInGroupCount"
                StartRowIndexParameterName="startRowIndex" MaximumRowsParameterName="maximumRows"
                TypeName="System.Account.ACCustomers" onselecting="ODSUsers_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TxKeyword" Name="username" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="RadioButtonListOfRole" Name="roleId" PropertyName="SelectedValue"
                        Type="String" />
                    <asp:ControlParameter ControlID="DDLGroup" Name="groupId" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSGroups" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetGroupsAll" TypeName="System.Account.ACGroups"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSSubGroups" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetSubGroups" TypeName="System.Account.ACGroups">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLGroup" Name="parentId" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSUsersInGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                EnablePaging="true" StartRowIndexParameterName="startRowIndex" MaximumRowsParameterName="maximumRows"
                SelectMethod="GetCustomersBySubGroup" SelectCountMethod="GetCustomersBySubGroupCount"
                TypeName="System.Account.ACCustomers" 
                onselecting="ODSUsersInGroup_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLGroup" Name="groupId" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="DDLSubGroup" Name="subGroupId" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>
