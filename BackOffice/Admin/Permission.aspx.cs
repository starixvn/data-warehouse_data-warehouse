using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.FrameWork;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Permission : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void GridViewPermission_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FWPermission _FWPermission = new FWPermission();
        int index = Convert.ToInt32(e.CommandArgument);

        GridViewRow SelectedRow = GridViewPermission.Rows[index];
        _FWPermission.DeletePermission(DDLProgramsPath.SelectedValue, SelectedRow.Cells[1].Text);
        GridViewPermission.DataBind();
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        FWPermission _FWPermission = new FWPermission();
        string Path = DDLProgramsPath.SelectedValue;
        string Type = "User";
        
        string Value = "";
        string Permission = "Allow";

        if (RBRole.Checked)
        {
            Type = "Role";
            Value = DropDownListRole.SelectedValue;
        }
        else if (RBUser.Checked)
        {
            Value = TextBoxUser.Text;
        }
        else if (RBAllUsers.Checked)
        {
            Value = "*";
        }
        else if (RBAnoymousUsers.Checked)
        {
            Value = "?";
        }

        if (RBDeny.Checked)
            Permission = "Deny";
        else
            Permission = "Allow";
        
        _FWPermission.InsertPermission(Path, Value, Type, Permission);
        GridViewPermission.DataBind();
    }
}
