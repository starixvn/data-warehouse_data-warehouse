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

public partial class _Priority : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownListUserName.DataBind();
    }
    protected void GridViewCtrl_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow gidrow = GridViewCtrl.Rows[index];

                CheckBox CheckBoxSearch = (CheckBox)gidrow.FindControl("CheckboxSearch");
                CheckBox CheckBoxInsert = (CheckBox)gidrow.FindControl("CheckBoxInsert");
                CheckBox CheckBoxUpdate = (CheckBox)gidrow.FindControl("CheckBoxUpdate");
                CheckBox CheckBoxDelete = (CheckBox)gidrow.FindControl("CheckBoxDelete");
                string UserIdKey = GridViewCtrl.DataKeys[index].Values["UserId"].ToString();
                string ProgramIdKey = GridViewCtrl.DataKeys[index].Values["ProgramId"].ToString();

                FWPriority _priority = new FWPriority();
                bool Result = _priority.UpdatePriority(UserIdKey,
                            ProgramIdKey,
                            CheckBoxSearch.Checked,
                            CheckBoxInsert.Checked,
                            CheckBoxUpdate.Checked,
                            CheckBoxDelete.Checked);
                if (Result)
                {
                    GridViewCtrl.DataBind();
                }
        }
    }
}
