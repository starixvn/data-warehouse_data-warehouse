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
using System.MailManagement;

public partial class _GroupReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DDLGroup.DataBind();
    }

    protected void ImageButtonMoveLeft_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewReportsInGroup.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldGID = (HiddenField)gridrow.FindControl("HiddenFieldGID");
            HiddenField HiddenFieldCID = (HiddenField)gridrow.FindControl("HiddenFieldCID");
            if (CheckBoxSite.Checked)
            {
                string GID = HiddenFieldGID.Value;
                string CID = HiddenFieldCID.Value;
                GroupReports _GroupReports = new GroupReports();
                if (_GroupReports.DeleteGroupReports(GID, CID))
                {
                    GridViewReports.DataBind();
                    GridViewReportsInGroup.DataBind();
                }
            }
        }
    }

    protected void ImageButtonMoveRight_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewReports.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldCID = (HiddenField)gridrow.FindControl("HiddenFieldCID");
            if (CheckBoxSite.Checked)
            {
                string GID = DDLGroup.SelectedValue;
                string CID = HiddenFieldCID.Value;
                GroupReports _GroupReports = new GroupReports();
                if (_GroupReports.InsertGroupReports(GID, CID))
                {
                    GridViewReports.DataBind();
                    GridViewReportsInGroup.DataBind();
                }
            }
        }
    }
}
