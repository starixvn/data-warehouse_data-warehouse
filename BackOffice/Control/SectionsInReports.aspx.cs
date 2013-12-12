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

public partial class _SectionsInReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DDLReports.DataBind();
    }

    protected void ImageButtonMoveLeft_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewSectionsInReports.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldRID = (HiddenField)gridrow.FindControl("HiddenFieldRID");
            HiddenField HiddenFieldSID = (HiddenField)gridrow.FindControl("HiddenFieldSID");
            if (CheckBoxSite.Checked)
            {
                string RID = HiddenFieldRID.Value;
                string SID = HiddenFieldSID.Value;
                SectionsInReports _SectionsInReports = new SectionsInReports();
                if (_SectionsInReports.DeleteSectionsInReports(RID, SID))
                {
                    GridViewSections.DataBind();
                    GridViewSectionsInReports.DataBind();
                }
            }
        }
    }

    protected void ImageButtonMoveRight_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow gridrow in GridViewSections.Rows)
        {
            CheckBox CheckBoxSite = (CheckBox)gridrow.FindControl("CheckBoxSite");
            HiddenField HiddenFieldSID = (HiddenField)gridrow.FindControl("HiddenFieldSID");
            if (CheckBoxSite.Checked)
            {
                string RID = DDLReports.SelectedValue;
                string SID = HiddenFieldSID.Value;
                SectionsInReports _SectionsInReports = new SectionsInReports();
                if (_SectionsInReports.InsertSectionsInReports(RID, SID))
                {
                    GridViewSections.DataBind();
                    GridViewSectionsInReports.DataBind();
                }
            }
        }
    }

    protected void GridViewSectionsInReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Equals("UP"))
        {
            if (index != 0)
            {
                int indexFrist = index - 1;
                GridViewRow SelectedRow = GridViewSectionsInReports.Rows[index];
                GridViewRow SelectedFristRow = GridViewSectionsInReports.Rows[indexFrist];

                string RID = GridViewSectionsInReports.DataKeys[index].Values["RID"].ToString();
                string SID = GridViewSectionsInReports.DataKeys[index].Values["SID"].ToString();
                string Seq = SelectedRow.Cells[2].Text;

                string RIDFrist = GridViewSectionsInReports.DataKeys[indexFrist].Values["RID"].ToString();
                string SIDFrist = GridViewSectionsInReports.DataKeys[indexFrist].Values["SID"].ToString();
                string SeqFrist = SelectedFristRow.Cells[2].Text;

                SectionsInReports _SectionsInReports = new SectionsInReports();
                _SectionsInReports.UpdateSectionsInReportsBySeq(RID, SID, SeqFrist);
                _SectionsInReports.UpdateSectionsInReportsBySeq(RIDFrist, SIDFrist, Seq);
                GridViewSectionsInReports.DataBind();
            }
        }
        else if (e.CommandName.Equals("DOWN"))
        {
            if (index != GridViewSectionsInReports.Rows.Count - 1)
            {
                int indexLast = index + 1;
                GridViewRow SelectedRow = GridViewSectionsInReports.Rows[index];
                GridViewRow SelectedLastRow = GridViewSectionsInReports.Rows[indexLast];

                string RID = GridViewSectionsInReports.DataKeys[index].Values["RID"].ToString();
                string SID = GridViewSectionsInReports.DataKeys[index].Values["SID"].ToString();

                string Seq = SelectedRow.Cells[2].Text;

                string RIDLast = GridViewSectionsInReports.DataKeys[indexLast].Values["RID"].ToString();
                string SIDLast = GridViewSectionsInReports.DataKeys[indexLast].Values["SID"].ToString();

                string SeqLast = SelectedLastRow.Cells[2].Text;

                SectionsInReports _SectionsInReports = new SectionsInReports();
                _SectionsInReports.UpdateSectionsInReportsBySeq(RID, SID, SeqLast);
                _SectionsInReports.UpdateSectionsInReportsBySeq(RIDLast, SIDLast, Seq);
                GridViewSectionsInReports.DataBind();
            }
        }
    }
}
