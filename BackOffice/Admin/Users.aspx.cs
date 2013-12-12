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
using System.Utility;

public partial class _Users : System.Web.UI.Page
{
    FWUser _fwUser = new FWUser();
    private bool _flag = false;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        if (_flag)
        {
            GridViewCtrl.DataBind();
        }
    }

    protected void GridViewCtrl_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow SelectedRow = GridViewCtrl.Rows[index];
            LabelRoleLocale.Text = "Change Password - " + SelectedRow.Cells[4].Text;
            hFldUsername.Value = SelectedRow.Cells[4].Text;
            if (!ServiceUtility.GetUserName().Equals(hFldUsername.Value))
            {
                ModalPopupExtender.Show();
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        ResultStatus.Text = string.Empty;
        if (txNewPassword.Text.Length == 0)
        {
            ResultStatus.Text = "New Password is Empty.";
        }
        else if (!txConfirmPassword.Text.Equals(txNewPassword.Text))
        {
            ResultStatus.Text = "Password does not match.";
        }

        if (ResultStatus.Text.Length > 0)
            return;

        bool ResultBool = _fwUser.ChangePassword(System.Utility.SecurityData.Encrypt(txConfirmPassword.Text), _fwUser.GetUserIDByUserName(hFldUsername.Value));
        if (ResultBool)
        {
            (new PasswordContraint(hFldUsername.Value, txNewPassword.Text)).ForceChangePassword(true);
            _flag = true;
            txConfirmPassword.Text = string.Empty;
            txNewPassword.Text = string.Empty;
            ResultStatus.Text = "Successfully";
        }
        else
        {
            ResultStatus.Text = "ERROR!!!";
        }
    }

    protected void DetailsViewCtrl_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        string username = (DetailsViewCtrl.FindControl("TextBoxUserName") as TextBox).Text;
        string password = (DetailsViewCtrl.FindControl("TextBoxPassword") as TextBox).Text;
        string errorMsg = new PasswordContraint(username, password).CheckPasswordValid();
        if (errorMsg.Length > 0)
        {
            e.Cancel = true;
            MessageLabel.Text = "The new password must meet the following policies:<br/>" + errorMsg;
        }
        else
        {
            MessageLabel.Text = string.Empty;
        }
    }
}
