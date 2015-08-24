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

public partial class _Group : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridViewCtrl_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Pager)
        {
            System.Utility.Paging.SetPagerStates(GridViewCtrl, e.Row);
        }

        string ProgramId = Request.QueryString["ProgramId"];
        if (!string.IsNullOrEmpty(ProgramId))
        {
            FWPrograms _FWPrograms = new FWPrograms();
            string Title = _FWPrograms.GetProgramName(ProgramId);
            string menu = Request.QueryString["RoleName"];
            string reportName = menu + " - " + Title;
            Page.Title = reportName;
        }
    }
}
