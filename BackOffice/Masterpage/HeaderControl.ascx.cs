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

public partial class Masterpage_HeaderControl : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                System.FrameWork.FWRoles Roleslocale = new System.FrameWork.FWRoles();

                string htmlString = "";
                string host = Request.Url.Host;
                string port = Request.Url.Port.ToString();
                string applicationPath = Request.ApplicationPath;
                string LinkUrl = "http://" + host + ":" + port + applicationPath + "/BackOffice/Main/";

                string _RoleName = Request.QueryString["RoleName"];
                string _Locale = Request.QueryString["locale"];

                DataTable RolesLocaleTable = Roleslocale.GetUserInRolesLocales();

                if (!string.IsNullOrEmpty(_RoleName))
                {
                    RoleName.Text = _RoleName;
                }

                if (RolesLocaleTable.Rows.Count > 0)
                {
                    foreach (DataRow RoleRow in RolesLocaleTable.Rows)
                    {
                        string role = RoleRow["RoleName"].ToString();
                        string roleTitle = RoleRow["Title"].ToString();

                        if (string.IsNullOrEmpty(RoleName.Text))
                        {
                            htmlString = htmlString + "<td valign=\"top\" class=\"tab_unsel_lefttaper\"><img src=\"../include/images/spacer.gif\"></td>";
                            htmlString = htmlString + "<td nowrap align=\"center\" class=\"celllink tab_unsel_bg\"><a href=\"" +
                                         LinkUrl + "?RoleName=" + role + "&locale=" + _Locale + "\" class=\"tablinkwhite\">" + roleTitle +
                                         "&nbsp;</a></td>";
                            htmlString = htmlString + "<td valign=\"top\" class=\"tab_unsel_righttaper\"><img src=\"../include/images/spacer.gif\"></td>";
                        }
                        else if (RoleName.Text.Equals(role))
                        {
                            htmlString = htmlString + "<td valign=\"top\"  class=\"tab_sel_lefttaper\"><img src=\"../include/images/spacer.gif\"></td>";
                            htmlString = htmlString + "<td nowrap align=\"center\" class=\"celllink tab_sel_bg\"><a href=\"" +
                                         LinkUrl + "?RoleName=" + role + "&locale=" + _Locale + "\" class=\"tablink\">" + roleTitle +
                                         "&nbsp;</a></td>";
                            htmlString = htmlString +
                                         "<td valign=\"top\" class=\"tab_sel_righttaper\"><img src=\"../include/images/spacer.gif\"></td>";
                        }
                        else
                        {
                            htmlString = htmlString + "<td valign=\"top\" class=\"tab_unsel_lefttaper\"><img src=\"../include/images/spacer.gif\"></td>";
                            htmlString = htmlString + "<td nowrap align=\"center\" class=\"celllink tab_unsel_bg\"><a href=\"" +
                                         LinkUrl + "?RoleName=" + role + "&locale=" + _Locale + "\" class=\"tablinkwhite\">" + roleTitle +
                                         "&nbsp;</a></td>";
                            htmlString = htmlString + "<td valign=\"top\" class=\"tab_unsel_righttaper\"><img src=\"../include/images/spacer.gif\"></td>";
                        }
                    }
                }

                TabRoles.Text = htmlString;
            }
            catch
            {

            }
        }
    }

    protected void ImageButtonCH_Click(object sender, ImageClickEventArgs e)
    {
        string host = Request.Url.Host;
        string port = Request.Url.Port.ToString();
        string RoleName = Request.QueryString["RoleName"].ToString();
        string ProgramId = Request.QueryString["ProgramId"];;
        string programURL = "http://" + host + ":" + port + Request.Url.AbsolutePath + "?RoleName=" + RoleName + "&ProgramId=" + ProgramId + "&locale=zh-CN";
        Response.Redirect(programURL);
    }

    protected void ImageButtonUK_Click(object sender, ImageClickEventArgs e)
    {
        string host = Request.Url.Host;
        string port = Request.Url.Port.ToString();
        string RoleName = Request.QueryString["RoleName"];
        string ProgramId = Request.QueryString["ProgramId"];
        string programURL = "http://" + host + ":" + port + Request.Url.AbsolutePath + "?RoleName=" + RoleName + "&ProgramId=" + ProgramId + "&locale=en-US";
        Response.Redirect(programURL);
    }
}
