<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccessDenied.aspx.cs" Inherits="AccessDenied" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>
            Access is denied.</h2>
        <a href="#" onclick="history.back(); return false;">Click here to return previous page.</a>
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
