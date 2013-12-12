using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Admin_ReportFormats : System.Web.UI.Page
{
    public string DDLExcelColorsName
    {
        get
        {
            DropDownList ddl = DetailsViewFormat.FindControl("DDLExcelColors") as DropDownList;
            if (ddl != null)
            {
                return ddl.ClientID;
            }
            return string.Empty;
        }
    }

    public string TextBoxFormatValueName
    {
        get
        {
            TextBox textbox = DetailsViewFormat.FindControl("TextBoxFormatValue") as TextBox;
            if (textbox != null)
            {
                return textbox.ClientID;
            }
            return string.Empty;
        }
    }

    public string DDLFormatTypeName
    {
        get
        {
            DropDownList ddl = DetailsViewFormat.FindControl("DDLFormatType") as DropDownList;
            if (ddl != null)
            {
                return ddl.ClientID;
            }
            return string.Empty;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadExcelcolors();
    }

    private void LoadExcelcolors()
    {
        DropDownList ddl = DetailsViewFormat.FindControl("DDLExcelColors") as DropDownList;
        if (ddl != null)
        {
            ddl.Items.Clear();
            ddl.Attributes["onchange"] = "javascript:GetExcelColorIndex();";
            ddl.DataSource = System.Utility.Utilities.GetExcelColors();
            ddl.DataTextField = "Value";
            ddl.DataValueField = "Key";
            ddl.DataBind();
            if (ddl.Items.Count > 0)
            {
                foreach (ListItem item in ddl.Items)
                {
                    item.Attributes["style"] = "color:" + item.Text;
                }
            }
        }
    }
}
