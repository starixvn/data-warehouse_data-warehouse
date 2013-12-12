using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.FrameWork;
using System.Utility;
using System.Data;

public partial class ForceChangePassword : System.Web.UI.Page
{
    private string locale = string.Empty;
    private string RoleName = string.Empty;
    private PasswordContraint _pwdContraint = null;

    public PasswordContraint PwdContraint
    {
        get 
        {
            if (this._pwdContraint == null)
            {
                this._pwdContraint = new PasswordContraint(ServiceUtility.GetUserName(), txNewPassword.Text);
            }
            return _pwdContraint; 
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        locale = (string.IsNullOrEmpty(Request.QueryString["locale"]) ? string.Empty : Request.QueryString["locale"]);
        RoleName = (string.IsNullOrEmpty(Request.QueryString["RoleName"]) ? string.Empty : Request.QueryString["RoleName"]);

        FWParams fwParams = new FWParams();
        lblPasswordPolicies.Text = "The new password must meet the following policies:<br/>" + fwParams.GetParamPolicyPassword();

        if (PwdContraint.IsForceChangePassword)
        {
            PasswordContraint.SaveToSession(PwdContraint.IsForceChangePassword);
        }
        else
        {
            Response.Redirect("~/BackOffice/Main/Default.aspx?RoleName=" + RoleName + "&locale=" + locale);
            Response.End();
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            ResultStatus.Text = string.Empty;
            string errorMsg = PwdContraint.CheckPasswordValid();

            if (errorMsg.Length > 0)
            {
                ResultStatus.Text = "The password does not meet password policy requirements.";
            }
            else
            {
                FWUser _fwUser = new FWUser();
                bool ResultBool = _fwUser.ChangePassword(System.Utility.SecurityData.Encrypt(txConfirmPassword.Text), ServiceUtility.GetUserID());
                if (ResultBool)
                {
                    if (PwdContraint.ForceChangePassword(false) == true)
                    {
                        if (PasswordContraint.ReadFromSession() != null)
                        {
                            PasswordContraint.SaveToSession(null);
                        }
                        Response.Redirect("~/BackOffice/Main/Default.aspx?RoleName=" + RoleName + "&locale=" + locale);
                        Response.End();
                    }
                    else
                    {
                        ResultStatus.Text = "ERROR!!!";
                    }
                }
                else
                {
                    ResultStatus.Text = "ERROR!!!";
                }
            }
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        System.Web.Security.FormsAuthentication.SignOut();
        Session.Abandon();
        Response.Redirect("~/BackOffice/Login.aspx");
        Response.End();
    }
}
