<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Threading" %>
<script runat="server">
    void Page_Load()
    {
        byte[] delay = new byte[1];
        RandomNumberGenerator prng = new RNGCryptoServiceProvider();

        prng.GetBytes(delay);
        Thread.Sleep((int)delay[0]);

        IDisposable disposable = prng as IDisposable;
        if (disposable != null) { disposable.Dispose(); }
    }
</script>
<html>
<head id="Head1" runat="server">
    <title>Error</title>
</head>
<body>
    <div>
        An error occurred while processing your request.
    </div>
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
