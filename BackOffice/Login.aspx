<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="BackOffice_Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login System Page</title>
</head>
<body bgcolor="#d7d7d7">
    <form id="form1" runat="server" defaultfocus="LoginPage">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
        <tr>
            <td align="center">
                <table border="0" cellpadding="1" cellspacing="0" style="border-right: black 1px solid;
                    border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <img src="../App_Themes/Blue/images/login/MainLogin.jpg" />
                                    </td>
                                    <td valign="top" width="230" align="right">
                                        <table border="0" cellpadding="0" cellspacing="0" width="250" height="256" bgcolor="#FFFFFF">
                                            <tr>
                                                <td align="right" valign="top" height="105">
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <asp:Login ID="LoginPage" runat="server" LoginButtonImageUrl="~/App_Themes/Blue/images/login/images-enter.gif"
                                                        LoginButtonText="Login" LoginButtonType="Image" TitleText="" FailureText="Your login  not successful. Please try again."
                                                        MembershipProvider="FWUserProvider" ForeColor="White" Width="224px" DisplayRememberMe="False"
                                                        OnLoggedIn="LoginPage_LoggedIn">
                                                        <TextBoxStyle CssClass="formStyle" />
                                                        <LabelStyle Font-Bold="True" ForeColor="White" />
                                                        <TitleTextStyle ForeColor="White" />
                                                        <CheckBoxStyle ForeColor="White" />
                                                        <LayoutTemplate>
                                                            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" style="width: 224px">
                                                                            <tr>
                                                                                <td align="center" colspan="2" style="color: red">
                                                                                    &nbsp;<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" style="font-weight: bold; color: white">
                                                                                    <asp:Image ID="ImageUserName" runat="server" ImageUrl="~/App_Themes/Blue/images/login/log.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="UserName" runat="server" Width="120px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginPage">*</asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" style="font-weight: bold; color: white">
                                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Blue/images/login/pas.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="120px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginPage">*</asp:RequiredFieldValidator>
                                                                                </td>
                                                                                <tr>
                                                                                    <td align="right" colspan="2">
                                                                                        &nbsp;<asp:ImageButton ID="LoginImageButton" runat="server" AlternateText="Login"
                                                                                            CommandName="Login" ImageUrl="~/App_Themes/Blue/images/login/login_but.jpg" ValidationGroup="LoginPage" />
                                                                                        &nbsp;&nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </td> </tr> </table>
                                                        </LayoutTemplate>
                                                    </asp:Login>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
    <!-- Piwik -->
        <script type="text/javascript">
            var _paq = _paq || [];
            _paq.push(['trackPageView']);
            _paq.push(['enableLinkTracking']);
            (function () {
                var u = "https://pw.detecas.com/";
                _paq.push(['setTrackerUrl', u + 'piwik.php']);
                _paq.push(['setSiteId', 33]);
                var d = document, g = d.createElement('script'), s = d.getElementsByTagName('script')[0];
                g.type = 'text/javascript'; g.async = true; g.defer = true; g.src = u + 'piwik.js'; s.parentNode.insertBefore(g, s);
            })();
            </script>
            <noscript><p><img src="https://pw.detecas.com/piwik.php?rec=1&idsite=33" style="border:0;" alt="" /></p></noscript>
        <!--/ Piwik -->
</body>
</html>
