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

public partial class _Roles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        string _RoleName = roleName.Text;
        string _LanguageCode = ddlLanguage.SelectedItem.Text;
        string _Title = TextBoxTitle.Text;
        FWRoles _FWRoles = new FWRoles();
        _FWRoles.InsertRolesInCulture(_RoleName,_LanguageCode,_Title);
        ModalPopupExtender.Show();
        GridViewPopUp.DataBind();
    }

    protected void GridViewRoles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow SelectedRow = GridViewRoles.Rows[index];
            roleName.Text = SelectedRow.Cells[2].Text;
            ddlLanguage.DataBind();
            ModalPopupExtender.Show();
        }
    }

    protected void GridViewPopUp_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ddlLanguage.DataBind();
        ModalPopupExtender.Show();
    }
}
