<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maintenance.aspx.cs" Inherits="_Maintenance" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Back Office Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>
            This website is under maintenance and temporarily inaccessible. Please come back
            in 4 hours later. Sorry for inconvenience caused!
        </h3>
    </div>
    </form>
    <!-- Piwik -->
    <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(["trackPageView"]);
        _paq.push(["enableLinkTracking"]);

        (function () {
            var u = (("https:" == document.location.protocol) ? "https" : "http") + "://piwik.starific.net/";
            _paq.push(["setTrackerUrl", u + "piwik.php"]);
            _paq.push(["setSiteId", "7"]);
            var d = document, g = d.createElement("script"), s = d.getElementsByTagName("script")[0]; g.type = "text/javascript";
            g.defer = true; g.async = true; g.src = u + "piwik.js"; s.parentNode.insertBefore(g, s);
        })();
    </script>
    <!-- End Piwik Code -->
</body>
</html>
