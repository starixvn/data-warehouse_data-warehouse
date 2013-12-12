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


public partial class _Programs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridViewPrograms_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow SelectedRow = GridViewPrograms.Rows[index];
            TextBoxProgramID.Text = SelectedRow.Cells[3].Text;
            ModalPopupExtender.Show();
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        string ProgamID = TextBoxProgramID.Text;
        string LocaleID = ddLocale.SelectedValue;
        string Title = TextBoxTitle.Text;
        string Description = TextBoxDescription.Text;

        System.FrameWork.FWPrograms _FWProgram = new System.FrameWork.FWPrograms();
        bool isReturn = _FWProgram.InsertProgramsInCulture(ProgamID, LocaleID, Title, Description);

        GridViewProgramsLocale.DataBind();

        TextBoxTitle.Text = "";
        TextBoxDescription.Text = "";

        ModalPopupExtender.Show();
    }

    protected void GridViewProgramsLocale_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ModalPopupExtender.Show();
    }
    protected void GridViewPrograms_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Pager)
        {
            System.Utility.Paging.SetPagerStates(GridViewPrograms, e.Row);
        }
    }
}
