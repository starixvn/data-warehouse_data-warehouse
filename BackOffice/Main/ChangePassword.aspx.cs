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

public partial class ChangePassword : System.Web.UI.Page
{
    FWUser _fwUser = new FWUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        FWParams fwParams = new FWParams();
        lblPasswordPolicies.Text = "The new password must meet the following policies:<br/>" + fwParams.GetParamPolicyPassword();
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            DataTable dt = _fwUser.GetUserByName(ServiceUtility.GetUserName());
            string PWD = System.Utility.SecurityData.Decrypt(dt.Rows[0]["Password"].ToString());
            if (txOldPassword.Text != PWD)
            {
                ResultStatus.Text = "Old Password not Correct!!";
            }
            else
            {
                ResultStatus.Text = string.Empty;

                string errorMsg = new PasswordContraint(ServiceUtility.GetUserName(), txNewPassword.Text).CheckPasswordValid();
                if (errorMsg.Length > 0)
                {
                    ResultStatus.Text = "The password does not meet password policy requirements.";
                }
                else
                {
                    bool ResultBool = _fwUser.ChangePassword(System.Utility.SecurityData.Encrypt(txNewPassword.Text), ServiceUtility.GetUserID());
                    if (ResultBool)
                    {
                        txConfirmPassword.Text = "";
                        txNewPassword.Text = "";
                        txOldPassword.Text = "";
                        ResultStatus.Text = "Successfully";
                    }
                    else
                    {
                        ResultStatus.Text = "ERROR!!!";
                    }
                }
            }
        }
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/BackOffice/Main/Default.aspx");
    }
}
