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

public partial class _ProgramsInSiteMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDLSitemaps.DataBind();
            RadioListRoles.SelectedIndex = 0;
        }
    }

    protected void ImageButtonMoveLeft_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewProgramsInSitemaps.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            if (CheckBoxSite.Checked)
            {
                string SiteId = gridrow.Cells[2].Text;
                System.FrameWork.FWSiteMap _FWSiteMap = new System.FrameWork.FWSiteMap();
                if (_FWSiteMap.DeleteSiteMap(SiteId))
                {
                    GridViewProgram.DataBind();
                    GridViewProgramsInSitemaps.DataBind();
                }
            }
        }
        LabelMessage.Text = "";
    }

    protected void ImageButtonMoveRight_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewProgram.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            if (CheckBoxSite.Checked)
            {
                string ProgramId = gridrow.Cells[1].Text;
                string SiteId = DDLSitemaps.SelectedValue;
                string ProgramName = gridrow.Cells[2].Text;
                System.FrameWork.FWSiteMap _FWSiteMap = new System.FrameWork.FWSiteMap();
                if (_FWSiteMap.InsertSiteMap(ProgramName, ProgramId, SiteId))
                {
                    GridViewProgram.DataBind();
                    GridViewProgramsInSitemaps.DataBind();
                }
            }
        }
        LabelMessage.Text = "";
    }

    protected void ImageButtonRoles_Click(object sender, ImageClickEventArgs e)
    {
        string SiteId = DDLSitemaps.SelectedValue;
        TextBoxUpdateSiteId.Text = SiteId;
        System.FrameWork.FWSiteMap _FWSiteMap = new System.FrameWork.FWSiteMap();
        string roles = _FWSiteMap.GetRolesBySiteId(SiteId);
        if (!String.IsNullOrEmpty(roles))
        {
            RadioUpdateRoles.SelectedValue = roles;
        }
        ModalPopupExtenderRoles.Show();
        LabelMessage.Text = "";
    }

    protected void ButtonInsertTabSiteMap_Click(object sender, EventArgs e)
    {
        string siteName = TextBoxName.Text;
        string Roles = RadioListRoles.SelectedValue.ToString();
        FWPrograms _Pro = new FWPrograms();
        string message = _Pro.InsertProgramsTab(siteName, Roles);
        FWSiteMap site = new FWSiteMap();
        TextBoxName.Text = string.Empty;
        RadioListRoles.DataBind();
        DDLSitemaps.DataBind();
        LabelMessage.Text = message;
    }

    protected void GridViewProgramsInSitemaps_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName.Equals("Roles"))
        {
            GridViewRow selectedRow = (GridViewRow)((Control)e.CommandSource).Parent.Parent;
            index = selectedRow.RowIndex;

            string SiteId = GridViewProgramsInSitemaps.DataKeys[index].Value.ToString();
            TextBoxUpdateSiteId.Text = SiteId;
            System.FrameWork.FWSiteMap _FWSiteMap = new System.FrameWork.FWSiteMap();
            string roles = _FWSiteMap.GetRolesBySiteId(SiteId);
            if (!String.IsNullOrEmpty(roles))
            {
                RadioUpdateRoles.SelectedValue = roles;
            }
            ModalPopupExtenderRoles.Show();
        }
        else if (e.CommandName.Equals("UP"))
        {
            if (index != 0)
            {
                GridViewRow selectedRow = (GridViewRow)((Control)e.CommandSource).Parent.Parent;
                index = selectedRow.RowIndex;

                int indexFrist = index - 1;
                GridViewRow SelectedRow = GridViewProgramsInSitemaps.Rows[index];
                GridViewRow SelectedFristRow = GridViewProgramsInSitemaps.Rows[indexFrist];

                string SiteMapID = GridViewProgramsInSitemaps.DataKeys[index].Value.ToString();
                string Seq = SelectedRow.Cells[5].Text;

                string SiteMapIDFrist = GridViewProgramsInSitemaps.DataKeys[indexFrist].Value.ToString();
                string SeqFrist = SelectedFristRow.Cells[5].Text;

                System.FrameWork.FWSiteMap _FWSiteMap = new System.FrameWork.FWSiteMap();
                _FWSiteMap.UpdateSiteMapBySeq(SiteMapID, SeqFrist);
                _FWSiteMap.UpdateSiteMapBySeq(SiteMapIDFrist, Seq);
            }
            GridViewProgramsInSitemaps.DataBind();
        }
        else if (e.CommandName.Equals("DOWN"))
        {
            if (index != GridViewProgramsInSitemaps.Rows.Count - 1)
            {
                GridViewRow selectedRow = (GridViewRow)((Control)e.CommandSource).Parent.Parent;
                index = selectedRow.RowIndex;

                int indexLast = index + 1;
                GridViewRow SelectedRow = GridViewProgramsInSitemaps.Rows[index];
                GridViewRow SelectedLastRow = GridViewProgramsInSitemaps.Rows[indexLast];


                string SiteMapID = GridViewProgramsInSitemaps.DataKeys[index].Value.ToString();
                string Seq = SelectedRow.Cells[5].Text;

                string SiteMapIDLast = GridViewProgramsInSitemaps.DataKeys[indexLast].Value.ToString();
                string SeqLast = SelectedLastRow.Cells[5].Text;

                System.FrameWork.FWSiteMap _FWSiteMap = new System.FrameWork.FWSiteMap();
                _FWSiteMap.UpdateSiteMapBySeq(SiteMapID, SeqLast);
                _FWSiteMap.UpdateSiteMapBySeq(SiteMapIDLast, Seq);
                GridViewProgramsInSitemaps.DataBind();
            }
        }
        LabelMessage.Text = "";
    }

    protected void ButtonUpdateRoles_Click(object sender, EventArgs e)
    {
        string SiteId = TextBoxUpdateSiteId.Text;
        string Roles = RadioUpdateRoles.SelectedValue.ToString();
        System.FrameWork.FWSiteMap _FWSiteMap = new System.FrameWork.FWSiteMap();
        _FWSiteMap.UpdateSitemapsRoles(SiteId, Roles);
        LabelMessage.Text = "";
    }

    protected void ButtonInsertCancel_Click(object sender, EventArgs e)
    {
        TextBoxName.Text = string.Empty;
        RadioListRoles.DataBind();
        DDLSitemaps.DataBind();
        LabelMessage.Text = "";
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        LabelMessage.Text = "";
    }
}
