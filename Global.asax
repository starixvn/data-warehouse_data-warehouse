<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
    }
    
    void Application_End(object sender, EventArgs e) 
    {
    }
        
    void Application_Error(object sender, EventArgs e) 
    {
		Context.ClearError();
 
    }

    void Session_Start(object sender, EventArgs e) 
    {
    }

    void Session_End(object sender, EventArgs e) 
    {
    }

    void Application_PreRequestHandlerExecute(object sender, EventArgs e)
    {
        try
        {
            HttpContext context = HttpContext.Current;
            string locale = Request.QueryString["locale"];
            string cacheLocale = (string)context.Cache.Get("locale");
            if (!string.IsNullOrEmpty(locale))
            {
                System.Globalization.CultureInfo ci = new System.Globalization.CultureInfo(locale);
                System.Threading.Thread.CurrentThread.CurrentCulture = ci;
                System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
                context.Cache.Insert("locale", locale);
                System.FrameWork.FWUser Core = new System.FrameWork.FWUser();
                string ApplicationName = System.Web.Hosting.HostingEnvironment.ApplicationVirtualPath;
                Core.UpdatePreferCulture(context.User.Identity.Name,locale);
            }
            else if (!string.IsNullOrEmpty(cacheLocale))
            {
                System.Globalization.CultureInfo ci = new System.Globalization.CultureInfo(cacheLocale);
                System.Threading.Thread.CurrentThread.CurrentCulture = ci;
                System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
                context.Cache.Insert("locale", locale);
            }
            else
            {
                locale = System.Utility.ServiceUtility.GetCultureUserName();
                System.Globalization.CultureInfo ci = new System.Globalization.CultureInfo(locale);
                System.Threading.Thread.CurrentThread.CurrentCulture = ci;
                System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
                context.Cache.Insert("locale", locale);
            }

            string exceptionPage = "forcechangepassword.aspx";
            string absolutePath = context.Request.Url.AbsolutePath.ToLower();
            if ((PasswordContraint.ReadFromSession() != null) && (!absolutePath.Contains(exceptionPage)))
            {
                //Condition: PasswordContraint.ReadFromSession() != null
                //This condition makes sure user is forced his password to change
                Response.Redirect("~/BackOffice/ForceChangePassword.aspx");
                Response.End();
            }
        }
        catch
        {
        }
    }
       
</script>
