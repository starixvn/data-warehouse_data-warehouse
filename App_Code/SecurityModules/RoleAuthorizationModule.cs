using System;
using System.Web;

/// <summary>
/// Summary description for RoleAuthorizationModule
/// </summary>
public class RoleAuthorizationModule : IHttpModule
{
    private System.FrameWork.FWRoles _FWRoles;


    #region Constructor

    public RoleAuthorizationModule()
    {
        this._FWRoles = new System.FrameWork.FWRoles();
    }

    #endregion


    #region IHttpModule Members

    void IHttpModule.Dispose()
    {
    }

    void IHttpModule.Init(HttpApplication context)
    {
        context.AuthorizeRequest += new EventHandler(this.AuthorizeRequest);
    }

    #endregion


    #region Process

    private void AuthorizeRequest(object sender, EventArgs e)
    {
        HttpApplication appl = (HttpApplication)sender;
        HttpContext context = appl.Context;

        //Check user is authenticated
        if ((!context.User.Identity.IsAuthenticated))
        {
            return;
        }
        if (!context.Request.Url.AbsolutePath.Contains(".aspx"))
        {
            return;
        }

        bool isValid = true;
        int index = 0;
        string roleName = string.Empty;
        string[] userRoles = null;

        roleName = appl.Request["RoleName"];
        if (string.IsNullOrEmpty(roleName))
        {
            string[] exceptionUrl = new string[] { "/backoffice/main/changepassword.aspx", "/backoffice/default.aspx", "/backoffice/main/default.aspx", "/backoffice/forcechangepassword.aspx" };
            string absolutePath = context.Request.Url.AbsolutePath.ToLower();
            for (index = 0; index < exceptionUrl.Length; index++)
            {
                if (absolutePath.Contains(exceptionUrl[index]))
                {
                    return;
                }
            }

            isValid = false;
        }

        if (isValid)
        {
            userRoles = this._FWRoles.GetRolesForUser(context.User.Identity.Name);
            if ((userRoles != null) && (userRoles.Length > 0))
            {
                for (index = 0; index < userRoles.Length; index++)
                {
                    if (roleName.ToLower().Equals(userRoles[index].ToLower()))
                    {
                        break;
                    }
                }

                isValid = (index != userRoles.Length);
            }
        }

        if (!isValid)
        {
            context.RewritePath(context.Request.ApplicationPath + "/AccessDenied.aspx");
        }
    }

    #endregion
}
