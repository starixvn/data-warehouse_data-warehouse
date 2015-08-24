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
using System.FrameWork;

public partial class Masterpage_PopupSingleCanvas : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string ProgramId = Request.QueryString["ProgramId"];
            if (!string.IsNullOrEmpty(ProgramId))
            {
                FWPrograms programs = new FWPrograms();
                string title = programs.GetProgramName(ProgramId);
                string menu = Request.QueryString["RoleName"];
                string reportName = menu + " - " + title;
                Page.Title = reportName;
            }

            DataTable TableUsers = (DataTable)Session["Users"];

            if (TableUsers == null)
            {
                // Use JavaScript to trigger the Close popup window.
                string closewindowsscript = "<script language='javascript'> onClose(); </script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CloseWindowsScript", closewindowsscript,true);
            }

        }
        catch
        {

        }

    }
}
