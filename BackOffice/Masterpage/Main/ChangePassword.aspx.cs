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
             ResultStatus.Text = "";
             bool ResultBool = _fwUser.ChangePassword(System.Utility.SecurityData.Encrypt(txConfirmPassword.Text), ServiceUtility.GetUserID());
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
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/BackOffice/Main/Default.aspx");
    }
}
