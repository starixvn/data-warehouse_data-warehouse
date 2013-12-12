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

public partial class _Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridViewReports_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Pager)
        {
            System.Utility.Paging.SetPagerStates(GridViewReports, e.Row);
        }
    }
}
