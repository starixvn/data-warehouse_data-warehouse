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
using System.FrameWork;

public partial class _GroupMailUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDLGroup.DataBind();

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

    protected void ImageButtonMoveLeft_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewUsersInGroup.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldGID = (HiddenField)gridrow.FindControl("HiddenFieldGID");
            HiddenField HiddenFieldUserId = (HiddenField)gridrow.FindControl("HiddenFieldUserId");
            if (CheckBoxSite.Checked)
            {
                string GID = HiddenFieldGID.Value;
                string UserId = HiddenFieldUserId.Value;
                GroupMailUsers _GroupMailUsers = new GroupMailUsers();
                if (_GroupMailUsers.DeleteGroupMailUsers(GID, UserId))
                {
                    GridViewUsers.DataBind();
                    GridViewUsersInGroup.DataBind();
                }
            }
        }
    }

    protected void ImageButtonMoveRight_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewUsers.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldUserId = (HiddenField)gridrow.FindControl("HiddenFieldUserId");
            if (CheckBoxSite.Checked)
            {
                string GID = DDLGroup.SelectedValue;
                string UserId = HiddenFieldUserId.Value;
                GroupMailUsers _GroupMailUsers = new GroupMailUsers();
                if (_GroupMailUsers.InsertGroupMailUsers(GID, UserId))
                {
                    GridViewUsers.DataBind();
                    GridViewUsersInGroup.DataBind();
                }
            }
        }
    }
}
