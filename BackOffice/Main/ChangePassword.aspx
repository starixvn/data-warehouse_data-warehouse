<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" Title="Change Password Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <br />
    <table width="100%">
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td>
                        </td>
                        <td>
                <table border="0" cellpadding="3" cellspacing="0" class="whitebgBorder" width="100%">
                    <tr class="HeaderStyle" height="16">
                        <td align="left" colspan="2">
                            <asp:Label ID="LabelRoleLocale" runat="server" ForeColor="#2A3C4B" Text="Change Password"></asp:Label></td>
                    </tr>
                    <tr align="left" class="RowStyle" height="30">
                        <td>
                            <asp:Label ID="LabelRoleName" runat="server" Text="Old Password"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txOldPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txOldPassword"
                                Display="Dynamic" ErrorMessage="Old Password is Empty." ValidationGroup="a"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr align="left" class="AlternatingRowStyle" height="30">
                        <td>
                            <asp:Label ID="LabelLanguage" runat="server" Text="New Password"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txNewPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txNewPassword"
                                Display="Dynamic" ErrorMessage="New Password is Empty." ValidationGroup="a"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr align="left" class="RowStyle" height="30">
                        <td>
                            <asp:Label ID="LabelTitle" runat="server" Text="Confirm Password" Width="92px"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txConfirmPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirmation password is Empty" ControlToValidate="txConfirmPassword"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txNewPassword"
                                ControlToValidate="txConfirmPassword" ErrorMessage="Password does not match." Display="Dynamic" ValidationGroup="a"></asp:CompareValidator></td>
                    </tr>
                    <tr class="AlternatingRowStyle" height="30">
                        <td colspan="2">
                            <asp:Button ID="BtnOk" runat="server" OnClick="BtnOk_Click"
                                Text="Change" ValidationGroup="a" Width="60px" />&nbsp;
                            <asp:Button ID="BtnCancel" runat="server" OnClick="BtnCancel_Click"
                                Text="Cancel" Width="60px" />
                            <br />
                            <br />
                            <asp:Label ID="ResultStatus" runat="server" CssClass="error"></asp:Label></td>
                    </tr>
                </table>
                        </td>
                        <td>
                            <asp:Label ID="lblPasswordPolicies" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

