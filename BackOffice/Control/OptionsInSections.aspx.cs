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
using System.Control;

public partial class _OptionsInSections : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DDLSections.DataBind();
    }

    protected void ImageButtonMoveLeft_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewOptionsInSections.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldSID = (HiddenField)gridrow.FindControl("HiddenFieldSID");
            HiddenField HiddenFieldOID = (HiddenField)gridrow.FindControl("HiddenFieldOID");
            if (CheckBoxSite.Checked)
            {
                string SID = HiddenFieldSID.Value;
                string OID = HiddenFieldOID.Value;
                OptionsInSections _OptionsInSections = new OptionsInSections();
                if (_OptionsInSections.DeleteOptionsInSections(SID,OID))
                {
                    GridViewOptions.DataBind();
                    GridViewOptionsInSections.DataBind();
                }
            }
        }
    }

    protected void ImageButtonMoveRight_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewOptions.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldOID = (HiddenField)gridrow.FindControl("HiddenFieldOID");
            if (CheckBoxSite.Checked)
            {
                string SID = DDLSections.SelectedValue;
                string OID = HiddenFieldOID.Value;
                OptionsInSections _OptionsInSections = new OptionsInSections();
                if (_OptionsInSections.InsertOptionsInSections(SID,OID))
                {
                    GridViewOptions.DataBind();
                    GridViewOptionsInSections.DataBind();
                }
            }
        }
    }

    protected void GridViewOptionsInSections_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("UP"))
        {
            if (index != 0)
            {
                int indexFrist = index - 1;
                GridViewRow SelectedRow = GridViewOptionsInSections.Rows[index];
                GridViewRow SelectedFristRow = GridViewOptionsInSections.Rows[indexFrist];

                string SID = GridViewOptionsInSections.DataKeys[index].Values["SID"].ToString();
                string OID = GridViewOptionsInSections.DataKeys[index].Values["OID"].ToString();

                string Seq = SelectedRow.Cells[2].Text;

                string SIDFrist = GridViewOptionsInSections.DataKeys[indexFrist].Values["SID"].ToString();
                string OIDFrist = GridViewOptionsInSections.DataKeys[indexFrist].Values["OID"].ToString();

                string SeqFrist = SelectedFristRow.Cells[2].Text;

                OptionsInSections _OptionsInSections = new OptionsInSections();
                _OptionsInSections.UpdateOptionsInSectionsBySeq(SID,OID,SeqFrist);
                _OptionsInSections.UpdateOptionsInSectionsBySeq(SIDFrist,OIDFrist, Seq);
                GridViewOptionsInSections.DataBind();
            }
        }
        else if (e.CommandName.Equals("DOWN"))
        {
            if (index != GridViewOptionsInSections.Rows.Count - 1)
            {
                int indexLast = index + 1;
                GridViewRow SelectedRow = GridViewOptionsInSections.Rows[index];
                GridViewRow SelectedLastRow = GridViewOptionsInSections.Rows[indexLast];

                string SID = GridViewOptionsInSections.DataKeys[index].Values["SID"].ToString();
                string OID = GridViewOptionsInSections.DataKeys[index].Values["OID"].ToString();

                string Seq = SelectedRow.Cells[2].Text;

                string SIDLast = GridViewOptionsInSections.DataKeys[indexLast].Values["SID"].ToString();
                string OIDLast = GridViewOptionsInSections.DataKeys[indexLast].Values["OID"].ToString();

                string SeqLast = SelectedLastRow.Cells[2].Text;

                OptionsInSections _OptionsInSections = new OptionsInSections();
                _OptionsInSections.UpdateOptionsInSectionsBySeq(SID,OID,SeqLast);
                _OptionsInSections.UpdateOptionsInSectionsBySeq(SIDLast,OIDLast,Seq);
                GridViewOptionsInSections.DataBind();
            }
        }
    }
}
