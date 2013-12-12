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
using System.Text;
using System.Control;
using System.Utility;
//using System.Control;
using System.DWRS;
using System.MailManagement;

public partial class _MailCommand : System.Web.UI.Page
{
    public StringBuilder SB = new StringBuilder();
    public StringBuilder RSB = new StringBuilder();
    public StringBuilder STR = new StringBuilder();
    public string RNAMEADDMORE = "";
    public string RID = "";
    public string SPCOMMAND = "";
    public string DEFINITION = "";
    public string PARAMETER = "";
    public string DBSOURCE = "";
    public string COMMAND = "";
    public string ISSUMMARY = "";
    public string DATAKEYNAME = "";
    public string RSTATUS = "";
    public bool ENABLE;
    public string SSTATUS = "";
    System.Collections.Specialized.NameValueCollection PARAMS;
    public bool isPeriod = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListReport.DataBind();
        }
        GetReportsDetail();
        PARAMS = Request.Params;

    }
    public void GetReportsDetail()
    {
        RID = DropDownListReport.SelectedValue.ToString() ;
        if (!String.IsNullOrEmpty(RID))
        {
            Reports _Reports = new Reports();
            DataTable DTReports = _Reports.GetReportsByRID(RID);
            if (DTReports != null && DTReports.Rows.Count > 0)
            {
                DEFINITION = DTReports.Rows[0]["DEFINITION"].ToString();
                PARAMETER = DTReports.Rows[0]["PARAMETER"].ToString();
                DBSOURCE = DTReports.Rows[0]["DBSOURCE"].ToString().Trim();
                COMMAND = DTReports.Rows[0]["COMMAND"].ToString();
                ISSUMMARY = DTReports.Rows[0]["ISSUMMARY"].ToString();
                DATAKEYNAME = DTReports.Rows[0]["DATAKEYNAME"].ToString();
                ENABLE = bool.Parse(DTReports.Rows[0]["ENABLE"].ToString());
                RSTATUS = DTReports.Rows[0]["RSTATUS"].ToString();
                if (ENABLE)
                {
                    SectionsInReports _SectionsInReports = new SectionsInReports();
                    DataTable DTSectionsInReports = _SectionsInReports.GetSectionsInReportsByRID(RID);
                    SB.Append("<table width='100%' border='0' cellpadding='0' cellspacing='0'>\n");
                    foreach (DataRow _Rows in DTSectionsInReports.Rows)
                    {
                        string SID = _Rows["SID"].ToString();
                        string _SNAME = _Rows["SNAME"].ToString();
                        string _SVALUE = _Rows["SVALUE"].ToString();
                        SSTATUS = _Rows["SSTATUS"].ToString();
                        SB.Append("<tr height='25' class='HeaderStyle'>\n");
                        SB.Append("<td>" + _SNAME + "</td>\n");
                        SB.Append("</tr>\n");
                        if (SSTATUS.ToUpper().Equals("TEXT"))
                        {
                            SB.Append("<tr  height=\"30\" class='AlternatingRowStyle'>\n");
                            SB.Append("<td>\n");
                            SB.Append("<input type='Text' name='" + _SVALUE + "'");
                            SB.Append("</td>\n");
                            SB.Append("</tr>\n");
                        }
                        else
                        {
                            if (_SVALUE.Equals("PERIODID"))
                            {
                                STR.Append("<input name=\"PERIOD\" type=\"radio\" value=\"1\" checked >Daily\n");
                                STR.Append("<input name=\"PERIOD\" type=\"radio\" value=\"2\" >Weekly\n");
                                STR.Append("<input name=\"PERIOD\" type=\"radio\" value=\"3\" >Monthly\n");
                            }
                            OptionsInSections _OptionsInSections = new OptionsInSections();
                            DataTable DTOptionsInSections = _OptionsInSections.GetOptionsInSectionsBySID(SID);
                            if (DTOptionsInSections != null && DTOptionsInSections.Rows.Count > 0)
                            {
                                SB.Append("<tr height=\"30\" class='AlternatingRowStyle'>\n");
                                SB.Append("<td>\n");
                                string check = "checked";
                                foreach (DataRow optionsInSections in DTOptionsInSections.Rows)
                                {
                                    string SVALUE = optionsInSections["SVALUE"].ToString();
                                    string ONAME = optionsInSections["ONAME"].ToString();
                                    string OVALUE = optionsInSections["OVALUE"].ToString();
                                    string OSTATUS = optionsInSections["OSTATUS"].ToString();

                                    if (SVALUE.Equals("PERIODID"))
                                    {
                                        isPeriod = true;
                                        SB.Append("<input name=\"" + SVALUE + "\" type=\"radio\" value=\"" + OVALUE + "\" " + check + " >" + ONAME + "\n");
                                    }
                                    else
                                    {
                                        SB.Append("<input " + check + " name=\"" + SVALUE + "\" type=\"radio\" value=\"" + OVALUE + "\">" + ONAME + "\n");
                                    }
                                    check = "";
                                }
                                SB.Append("</td>\n");
                                SB.Append("</tr>\n");
                            }
                        }
                    }
                    if (ISSUMMARY.Equals("ON"))
                    {
                        SB.Append("<tr class='HeaderStyle' height=\"25\">\n");
                        SB.Append("<td>\n");
                        SB.Append("<input type='checkbox' name='ISSUMMARY' checked> SUMMARY\n");
                        SB.Append("</td>\n");
                        SB.Append("</tr>\n");
                    }
                    SB.Append("</table>\n");
                }
                else
                {
                    DBSOURCE = "Sorry. Data not ready.";
                }
            }
            else
            {
                SB.Append("<B>Can not get report.</B>");
            }
        }
    }

    protected void ButtonProduceReport_Click(object sender, EventArgs e)
    {
        if (ENABLE)
        {
            SPCOMMAND = DWRSCommand.buildFormat(PARAMS, RID);
            if (RSTATUS.Equals("OFF"))
            {
                SPCOMMAND = SPCOMMAND.Replace(", 'PERIODID'", "");
            }
            else if (RSTATUS.Equals("SDATE"))
            {
                SPCOMMAND = SPCOMMAND.Replace(",'ENDDATE', 'PERIODID'", "");
            }

            if (!isPeriod)
            {
                SPCOMMAND = SPCOMMAND.Replace("'STARTDATE'", "");
                SPCOMMAND = SPCOMMAND.Replace("'ENDDATE'", "");
            }

            string temp_command = "";
            string sum_command = "";
            string detail = "OFF";
            string period = "";
            string isSummary = PARAMS.Get("ISSUMMARY") == null ? "" : PARAMS.Get("ISSUMMARY");
            string keyName = DATAKEYNAME == null ? "" : DATAKEYNAME;
            string periodId = PARAMS.Get("PERIOD") == null ? "" : PARAMS.Get("PERIOD");

            temp_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
            temp_command = DWRSCommand.CommandReplaceParameter(temp_command, PARAMS, true);
            

            if (ISSUMMARY.Equals("ON"))
            {
                sum_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
                sum_command = sum_command.Replace("'PERIODID'", "null");
                sum_command = DWRSCommand.CommandReplaceParameter(sum_command, PARAMS, true);
                
            }
            if (!String.IsNullOrEmpty(DATAKEYNAME))
            {
                if (!isSummary.ToLower().Equals("on"))
                {
                    detail = "ON";
                }
            }
            if (periodId == "1")
            {
                period = "Daily";
            }
            else if (periodId == "2")
            {
                period = "Weekly";
            }
            else if (periodId == "3")
            {
                period = "Monthly";
            }
            else
            {
                period = null;
            }
            RSB.Append("<B>ALL</B> " + temp_command.Replace("'", "\"") + " <BR/>");
            RSB.Append("<B>SUMMARY</B>" + sum_command.Replace("'", "\"") + "<BR/>");
            RSB.Append("<B>PERODID</B>" + period + "<BR/>");
            RSB.Append("<B>DETAIL</B>" + detail + "<BR/>");
            Command _Command = new Command();
            bool isValue = _Command.InsertMailCommand(DropDownListReport.SelectedValue,
                                                      temp_command.Replace("'", "\""),
                                                      sum_command.Replace("'", "\""),
                                                      detail,
                                                      period);
            GridViewCtrl.DataBind();
        }
    }
    protected void ButtonPreview_Click(object sender, EventArgs e)
    {
        if (ENABLE)
        {
            SPCOMMAND = DWRSCommand.buildFormat(PARAMS, RID);
            if (RSTATUS.Equals("OFF"))
            {
                SPCOMMAND = SPCOMMAND.Replace(", 'PERIODID'", "");
            }
            else if (RSTATUS.Equals("SDATE"))
            {
                SPCOMMAND = SPCOMMAND.Replace(",'ENDDATE', 'PERIODID'", "");
            }

            if (!isPeriod)
            {
                SPCOMMAND = SPCOMMAND.Replace("'STARTDATE'", "");
                SPCOMMAND = SPCOMMAND.Replace("'ENDDATE'", "");
            }

            string temp_command = "";
            string sum_command = "";
            string detail = "OFF";
            string period = "";
            string isSummary = PARAMS.Get("ISSUMMARY") == null ? "" : PARAMS.Get("ISSUMMARY");
            string keyName = DATAKEYNAME == null ? "" : DATAKEYNAME;
            string periodId = PARAMS.Get("PERIOD") == null ? "" : PARAMS.Get("PERIOD");

            temp_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
            temp_command = DWRSCommand.CommandReplaceParameter(temp_command, PARAMS, true);


            if (ISSUMMARY.Equals("ON"))
            {
                sum_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
                sum_command = sum_command.Replace("'PERIODID'", "null");
                sum_command = DWRSCommand.CommandReplaceParameter(sum_command, PARAMS, true);

            }
            if (!String.IsNullOrEmpty(DATAKEYNAME))
            {
                if (!isSummary.ToLower().Equals("on"))
                {
                    detail = "ON";
                }
            }
            if (periodId == "1")
            {
                period = "Daily";
            }
            else if (periodId == "2")
            {
                period = "Weekly";
            }
            else if (periodId == "3")
            {
                period = "Monthly";
            }
            else
            {
                period = null;
            }
            RSB.Append("<B>ALL</B> " + temp_command.Replace("'", "\"") + " <BR/>");
            RSB.Append("<B>SUMMARY</B>" + sum_command.Replace("'", "\"") + "<BR/>");
            RSB.Append("<B>PERODID</B>" + period + "<BR/>");
            RSB.Append("<B>DETAIL</B>" + detail + "<BR/>");
        }
    }
}
