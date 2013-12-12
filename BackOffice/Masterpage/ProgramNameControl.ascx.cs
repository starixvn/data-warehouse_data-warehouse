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

public partial class BackOffice_Masterpage_ProgramNameControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string ProgramId = Request.QueryString["ProgramId"];
            if(!String.IsNullOrEmpty(ProgramId))
            {
                FWPrograms _FWPrograms = new FWPrograms();
                string Image = "<img src=\"../include/images/program/images_import.gif\" />";
                string Title = _FWPrograms.GetProgramName(ProgramId);
                LabelImage.Text = Image;
                ProgramName.Text = Title;
            }
        }
        catch { }
    }
}
