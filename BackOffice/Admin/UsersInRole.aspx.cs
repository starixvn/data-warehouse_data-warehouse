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

public partial class _UsersInRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        try
        {
            string UserID = TextBoxUserID.Text;
            string RoleName = ddRoleName.SelectedValue;
            string ApplcationName = ddApplicationName.SelectedValue;

            FWUser _FWUser = new FWUser();
           bool ResualtSave = _FWUser.InsertUserInRoles(UserID, RoleName, ApplcationName);
           if (ResualtSave)
           {
               GridViewUserInRoles.DataBind();
               ModalPopupExtender.Show();
           }
        }
        catch
        {
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void GridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow SelectedRow = GridViewUsers.Rows[index];
        TextBoxUserID.Text = SelectedRow.Cells[1].Text;
        ModalPopupExtender.Show();
    }

    protected void GridViewUserInRoles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("UP"))
        {
            if (index != 0)
            {
                int indexFrist = index - 1;
                GridViewRow SelectedRow = GridViewUserInRoles.Rows[index];
                GridViewRow SelectedFristRow = GridViewUserInRoles.Rows[indexFrist];

                string UserId = GridViewUserInRoles.DataKeys[index].Values["UserId"].ToString();
                string RoleName = GridViewUserInRoles.DataKeys[index].Values["RoleName"].ToString();
                string Seq = SelectedRow.Cells[4].Text;

                string UserIdFrist = GridViewUserInRoles.DataKeys[indexFrist].Values["UserId"].ToString();
                string RoleNameFrist = GridViewUserInRoles.DataKeys[indexFrist].Values["RoleName"].ToString();
                string SeqFrist = SelectedFristRow.Cells[4].Text;

                System.FrameWork.FWUser _FWUser = new System.FrameWork.FWUser();
                _FWUser.UpdateUserInRolesBySeq(UserId,RoleName,SeqFrist);
                _FWUser.UpdateUserInRolesBySeq(UserIdFrist,RoleNameFrist,Seq);
            }
        }
        else if (e.CommandName.Equals("DOWN"))
        {
            if (index != GridViewUserInRoles.Rows.Count - 1)
            {
                int indexLast = index + 1;
                GridViewRow SelectedRow = GridViewUserInRoles.Rows[index];
                GridViewRow SelectedLastRow = GridViewUserInRoles.Rows[indexLast];


                string UserId = GridViewUserInRoles.DataKeys[index].Values["UserId"].ToString();
                string RoleName = GridViewUserInRoles.DataKeys[index].Values["RoleName"].ToString();
                string Seq = SelectedRow.Cells[4].Text;

                string UserIdLast = GridViewUserInRoles.DataKeys[indexLast].Values["UserId"].ToString();
                string RoleNameLast = GridViewUserInRoles.DataKeys[indexLast].Values["RoleName"].ToString();

                string SeqLast = SelectedLastRow.Cells[4].Text;

                System.FrameWork.FWUser _FWUser = new System.FrameWork.FWUser();
                _FWUser.UpdateUserInRolesBySeq(UserId,RoleName,SeqLast);
                _FWUser.UpdateUserInRolesBySeq(UserIdLast,RoleNameLast,Seq);
            }
        }
        GridViewUserInRoles.DataBind();
        ModalPopupExtender.Show();
    }
}
