<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderControl.ascx.cs"
    Inherits="Masterpage_HeaderControl" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="header-top">
                <tr>
                    <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="bottom">
                                    <table width="166" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="logo">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="97%" align="left" valign="bottom">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="right" colspan="2">
                                                <table border="0" cellspacing="0" cellpadding="2">
                                                    <tr>
                                                        <td align="center" nowrap>
                                                            <asp:HyperLink ID="HLChangePassword" meta:resourcekey="HLChangePassword" Text="Change password"
                                                                CssClass="hearder-link" runat="server" NavigateUrl="~/BackOffice/Main/ChangePassword.aspx"></asp:HyperLink></td>
                                                        <td align="center" nowrap class="hearder-link" style="width: 10px">
                                                            |</td>
                                                        <td align="center" nowrap>
                                                            <asp:LoginStatus ID="LoginStatusPage" runat="server" CssClass="hearder-link" LogoutPageUrl="~/BackOffice/Login.aspx"
                                                                meta:resourcekey="LoginStatusPage" />
                                                        </td>
                                                        <td width="10" align="center" nowrap class="hearder-link">
                                                            |</td>
                                                        <td align="center" nowrap>
                                                            <asp:Label ID="RoleName" runat="server" CssClass="hearder-link" Visible="False" meta:resourcekey="RoleName"></asp:Label>
                                                            <asp:LoginName ID="LoginNameSystem" runat="server" CssClass="hearder-link" meta:resourcekey="LoginNameSystem" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <img src="../include/images/spacer.gif" width="1" height="8"></td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="bottom">
                                                <table border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td nowrap width="10" align="center">
                                                            &nbsp;</td>
                                                        <asp:Label ID="TabRoles" runat="server"></asp:Label></tr>
                                                </table>
                                            </td>
                                            <td width="15%" align="right" valign="bottom">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="1%" align="right" valign="top">
                        <img src="../include/images/spacer.gif" width="57" height="46"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="bluebase" height="6">
            <img src="../include/images/spacer.gif"></td>
    </tr>
    <tr class="rowEven">
        <td height="20" align="left" class="tab-language" style="no-repeat right bottom;">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="left" height="26" width="200">
                        &nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButtonUK" runat="server" ImageUrl="~/BackOffice/Include/images/locale/u-k.gif"
                            OnClick="ImageButtonUK_Click" />&nbsp;
                        <asp:ImageButton ID="ImageButtonCH" runat="server" ImageUrl="~/BackOffice/include/images/locale/ch.jpg"
                            OnClick="ImageButtonCH_Click" Height="12px" /></td>
                    <td align="right" width="100">
                        &nbsp;</td>
                    <td align="right">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
