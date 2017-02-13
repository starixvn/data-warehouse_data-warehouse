<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForceChangePassword.aspx.cs"
    Inherits="ForceChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Force Change Password</title>
    <style type="text/css">
        .AlternatingRowStyle
        {
            font-family: "MS Sans Serif" , Tahoma, sans-serif;
            background-color: #ECECEC;
            font-size: 12px;
            padding-left: 5px;
        }
        .RowStyle
        {
            font-family: "MS Sans Serif" , Tahoma, sans-serif;
            background-color: #FFFFFF;
            font-size: 12px;
            padding-left: 5px;
        }
        .error
        {
            font-weight: bold;
            font-size: 8pt;
            color: red;
            font-family: "MS Sans Serif" , Tahoma, sans-serif;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <table border="0" cellpadding="3" cellspacing="0" style="border: 1px solid #8CBAE8;"
                                    width="100%">
                                    <tr class="HeaderStyle" height="16">
                                        <td align="left" colspan="2">
                                            <asp:Label ID="LabelRoleLocale" runat="server" ForeColor="#2A3C4B" Text="Change Password"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="left" class="AlternatingRowStyle" height="30">
                                        <td>
                                            <asp:Label ID="LabelLanguage" runat="server" Text="New Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txNewPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txNewPassword"
                                                Display="Dynamic" ErrorMessage="New Password is Empty." ValidationGroup="a"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr align="left" class="RowStyle" height="30">
                                        <td>
                                            <asp:Label ID="LabelTitle" runat="server" Text="Confirm Password" Width="92px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txConfirmPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Confirmation Password is Empty"
                                                ControlToValidate="txConfirmPassword"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txNewPassword"
                                                ControlToValidate="txConfirmPassword" ErrorMessage="Password does not match."
                                                Display="Dynamic" ValidationGroup="a"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr class="AlternatingRowStyle" height="30">
                                        <td colspan="2">
                                            <asp:Button ID="BtnOk" runat="server" OnClick="BtnOk_Click" Text="Change" ValidationGroup="a"
                                                Width="60px" />&nbsp;
                                            <asp:Button ID="BtnCancel" runat="server" OnClick="BtnCancel_Click" Text="Cancel"
                                                Width="60px" CausesValidation="False" />
                                            <br />
                                            <br />
                                            <asp:Label ID="ResultStatus" runat="server" CssClass="error"></asp:Label>
                                        </td>
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
    </div>
    </form>

    <% 
        string username = System.Utility.ServiceUtility.GetUserName();
    %>
    <!-- Piwik -->
        <script type="text/javascript">
            var _paq = _paq || [];
            _paq.push(['trackPageView']);
            _paq.push(['enableLinkTracking']);
            (function () {
                var u = "https://pw.detecas.com/";
                _paq.push(['setTrackerUrl', u + 'piwik.php']);
                _paq.push(['setSiteId', 33]);
                _paq.push(['setUserId', '<%=username%>');
                var d = document, g = d.createElement('script'), s = d.getElementsByTagName('script')[0];
                g.type = 'text/javascript'; g.async = true; g.defer = true; g.src = u + 'piwik.js'; s.parentNode.insertBefore(g, s);
            })();
            </script>
            <noscript><p><img src="https://pw.detecas.com/piwik.php?rec=1&idsite=33" style="border:0;" alt="" /></p></noscript>
        <!--/ Piwik -->
</body>
</html>
