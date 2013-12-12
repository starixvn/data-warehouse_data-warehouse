using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Utility;

public partial class BackOffice_Default : System.Web.UI.Page
{
    System.FrameWork.FWUser _FWUser = new System.FrameWork.FWUser();
    System.FrameWork.FWRoles _FWRoles = new System.FrameWork.FWRoles();

    private string locale = string.Empty;
    private string RoleName = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        ProcessParams();
        NavigateRequest((new PasswordContraint(ServiceUtility.GetUserName()).IsForceChangePassword));
    }

    private void ProcessParams()
    {
        locale = _FWUser.GetUserLocale(HttpContext.Current.User.Identity.Name);
        RoleName = _FWRoles.GetFirstRoleName(HttpContext.Current.User.Identity.Name, System.FrameWork.FWServices.ApplicationNamePath);
    }

    private void NavigateRequest(bool isForceChangePwd)
    {
        string url = "~/BackOffice/Main/Default.aspx?showAnnouncement=true&RoleName=" + RoleName + "&locale=" + locale;
        if (isForceChangePwd)
        {
            url = "~/BackOffice/ForceChangePassword.aspx";
        }
        Response.Redirect(url);
        Response.End();
    }
}
