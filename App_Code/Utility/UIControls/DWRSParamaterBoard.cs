using System;
using System.Web;
using System.Web.UI.WebControls;


/// <summary>
/// Summary description for ParamaterBoard
/// </summary>
public class ParamaterBoard
{
    private const string DELIMITER_UNDERSCORE = "_";

    Table _Container = null;
    System.Collections.Specialized.NameValueCollection _Params = null;


    #region Constructors

    public ParamaterBoard(Table container, System.Collections.Specialized.NameValueCollection requestParams)
    {
        this._Container = container;
        this._Params = requestParams;
    }

    #endregion


    #region Process Methods

    public void GenerateParameterBoard(string reportID, bool isSummary, ref bool isPeriod, ref string period)
    {
        if (this._Container == null)
        {
            return;
        }

        TableRow row = null;
        TableCell cell = null;

        System.Control.SectionsInReports sectionsInReports = new System.Control.SectionsInReports();
        System.Data.DataTable dtSectionsInReports = sectionsInReports.GetSectionsInReportsByRID(reportID);

        this._Container.Width = Unit.Percentage(100);
        this._Container.BorderWidth = Unit.Empty;
        this._Container.CellPadding = 0;
        this._Container.CellSpacing = 0;

        string SID = string.Empty;
        string _SNAME = string.Empty;
        string _SVALUE = string.Empty;
        string SSTATUS = string.Empty;
        System.Text.StringBuilder control = new System.Text.StringBuilder();
        foreach (System.Data.DataRow _Rows in dtSectionsInReports.Rows)
        {
            //RNAME = _Rows["RNAME"].ToString();
            SID = _Rows["SID"].ToString();
            _SNAME = _Rows["SNAME"].ToString();
            _SVALUE = _Rows["SVALUE"].ToString();
            SSTATUS = _Rows["SSTATUS"].ToString();


            #region Section Header

            row = new TableRow();
            row.Height = Unit.Pixel(25);
            row.CssClass = "HeaderStyle";
            cell = new TableCell();
            cell.Text = _SNAME;
            row.Cells.Add(cell);
            this._Container.Rows.Add(row);

            #endregion


            #region Load Controls for Section

            row = new TableRow();
            row.Height = Unit.Pixel(30);
            row.CssClass = "AlternatingRowStyle";
            cell = new TableCell();
            //************************************************

            string paramValue = GetParamValue(_SVALUE);
            control = new System.Text.StringBuilder();
            if (SSTATUS.ToUpper().Equals("TEXT"))
            {
                DWRSTextBox textbox = CreateTextBox(_SVALUE, paramValue);
                control.Append(textbox.Render()); // load controls
            }
            else
            {
                System.Data.DataTable dtOptionsInSection = new System.Control.OptionsInSections().GetOptionsInSectionsBySID(SID);
                if ((dtOptionsInSection != null) && (dtOptionsInSection.Rows.Count > 0))
                {
                    string SVALUE = string.Empty;
                    string ONAME = string.Empty;
                    string OVALUE = string.Empty;
                    string OSTATUS = string.Empty;
                    string OnClick = string.Empty;
                    bool flag = false;
                    DWRSRadioButton radio = null;
                    string name = string.Empty;
                    string value = string.Empty;
                    foreach (System.Data.DataRow option in dtOptionsInSection.Rows)
                    {
                        SVALUE = option["SVALUE"].ToString();
                        ONAME = option["ONAME"].ToString();
                        OVALUE = option["OVALUE"].ToString();
                        OSTATUS = option["OSTATUS"].ToString();
                        OnClick = string.Empty;

                        name = SVALUE;
                        value = (SVALUE.Equals("PERIODID") ? (ONAME + DELIMITER_UNDERSCORE + OVALUE) : OVALUE);
                        radio = CreateRadioButton(name, value);
                        if (!flag)
                        {
                            radio.IsCheck = true;
                            flag = true;
                            period = (SVALUE.Equals("PERIODID") ? OSTATUS : period);
                        }
                        if (paramValue.Equals(value)) // load previous status in case of post request
                        {
                            radio.IsCheck = true;
                            period = (SVALUE.Equals("PERIODID") ? OSTATUS : period);
                        }

                        if (SVALUE.Equals("PERIODID"))
                        {
                            if (OSTATUS.Equals("null")) OnClick = "javascript:CalendarView('0')";
                            if (OSTATUS.Equals("Daily")) OnClick = "javascript:CalendarView('1')";
                            if (OSTATUS.Equals("Weekly")) OnClick = "javascript:CalendarView('2')";
                            if (OSTATUS.Equals("Monthly")) OnClick = "javascript:CalendarView('3')";
                            if (OSTATUS.Equals("Yearly")) OnClick = "javascript:CalendarView('4')";
                            if (OSTATUS.Equals("MonthRange")) OnClick = "javascript:CalendarView('5')";

                            isPeriod = true; //mark signal to replace two params 'startdate' and 'enddate' later

                            radio.OnClick = OnClick;
                            control.Append(radio.Render(ONAME)); // load controls
                        }
                        else
                        {
                            control.Append(radio.Render(ONAME)); // load controls
                        }
                    }
                }
            }

            cell.Text = control.ToString();

            //************************************************
            row.Cells.Add(cell);
            this._Container.Rows.Add(row);

            #endregion
        }

        if (isSummary)
        {
            row = new TableRow();
            row.Height = Unit.Pixel(25);
            row.CssClass = "HeaderStyle";
            cell = new TableCell();
            DWRSCheckBox checkbox = CreateCheckBox("ISSUMMARY", string.Empty);
            string paramValue = GetParamValue("ISSUMMARY");
            checkbox.IsCheck = (paramValue.Length > 0);
            cell.Text = checkbox.Render("SUMMARY");
            row.Cells.Add(cell);
            this._Container.Rows.Add(row);
        }
    }

    #endregion


    #region Helpers

    private DWRSTextBox CreateTextBox(string name, string value)
    {
        DWRSTextBox textbox = new DWRSTextBox(name, value);
        return textbox;
    }

    private DWRSRadioButton CreateRadioButton(string name, string value)
    {
        DWRSRadioButton radio = new DWRSRadioButton(name, value);
        return radio;
    }

    private DWRSCheckBox CreateCheckBox(string name, string value)
    {
        DWRSCheckBox checkbox = new DWRSCheckBox(name, value);
        return checkbox;
    }

    private string GetParamValue(string key)
    {
        string value = string.Empty;
        if (_Params[key] != null)
        {
            value = _Params[key];
        }
        return value;
    }

    #endregion

}
