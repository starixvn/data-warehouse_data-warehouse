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

public partial class _MailLogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBoxDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }
    //protected void TimerLoad_Tick(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        GridViewCtrl.DataBind();
    //    }
    //    catch { }
    //}
}
