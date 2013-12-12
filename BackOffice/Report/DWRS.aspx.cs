using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Globalization;
using System.Text;
using System.Utility;
using System.Control;
using System.DWRS;
using System.DWRSCommand;
using System.Business;
using System.FrameWork;

public partial class _DWRS : System.Web.UI.Page
{
    public StringBuilder SB = new  StringBuilder();
    public StringBuilder RSB = new StringBuilder();
    public string RNAMEADDMORE = "";
    public string RID = "";
    public string SPCOMMAND = "";
    public string DEFINITION = "";
    public string PARAMETER = "";
    public string DBSOURCE = "";
    public string COMMAND = "";
    public string ISSUMMARY = "";
    public string DATATABLENAME = "";
    public string DATAKEYNAME = "";
    public string DATADISPLAYNAME = "";
    public string RSTATUS = "";
    public bool ENABLE; 
    public int COLUMNCOUNT = 0;
    public string STARTDATE = "";
    public string ENDDATE = "";
    public string REPORTDATE = "";
    public string RNAME = "";
    public string SSTATUS = "";
    public string PERIOD = "";
    public bool ISSUBTOTAL = false;
    public bool ISONEPERWORKSHEET = false;
    public bool HASCHART = false;
    System.Collections.Specialized.NameValueCollection PARAMS;
    System.Collections.Hashtable HSTATISTICID = new System.Collections.Hashtable();
    public bool isPeriod = false;
    private string _PreviousPeriodOption = string.Empty;


    #region Properties

    public string PreviousPeriodOption
    {
        get { return _PreviousPeriodOption; }
    }

    public bool IsPeriodAnnualYearly
    {
        get
        {
            bool isAnnualYearly = false;
            isAnnualYearly = (isAnnualYearly || (PERIOD.Equals("null") ? true : false));
            isAnnualYearly = (isAnnualYearly || (PERIOD.Equals("Yearly") ? true : false));
            return isAnnualYearly;
        }
    }

    public bool IsFirstRequest
    {
        get
        {
            return ((!IsPostBack) && ISSUMMARY.Equals("ON"));
        }
    }

    #endregion


    #region Event Handlers

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime yesterday = DateTime.Now.AddDays(-1);
            DropDownListMonthly.SelectedValue = yesterday.ToString("MM");
            DropDownListYear.SelectedValue = yesterday.ToString("yyyy");
            DropDownListANNUAL.SelectedValue = yesterday.ToString("yyyy");
            DropDownListFYE.SelectedValue = yesterday.AddMonths(6).ToString("yyyy");
            DropDownListFromMONTHRANGE.SelectedValue = DateTime.Now.ToString("MM");
            DropDownListFromYEARRANGE.SelectedValue = DateTime.Now.ToString("yyyy");
            DropDownListToMONTHRANGE.SelectedValue = DateTime.Now.ToString("MM");
            DropDownListToYEARRANGE.SelectedValue = DateTime.Now.ToString("yyyy");
            TextBoxStartDate.Text = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
            TextBoxEndDate.Text = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
        }
        GetReportsDetail();
        PARAMS = Request.Params;

        if (!IsPostBack)
        {
            LoadRecentReports();
            
            DbCommand command = new DbCommand(COMMAND);
            ButtonPreviewReport.Visible = command.HasParamIsTest();
        }
    }
    
    protected void ButtonProduceReport_Click(object sender, EventArgs e)
    {
        if (ENABLE)
        {
            string SAVEPATH = "";
            string URLPATH = "";
            string EXCELNAME = "";
            SPCOMMAND = DWRSCommand.buildFormat(PARAMS, RID);
            if (RSTATUS.Equals("OFF"))
            {
                SPCOMMAND = SPCOMMAND.Replace(", 'PERIODID'", "");
            }
            else if (RSTATUS.Equals("SDATE"))
            {
                SPCOMMAND = SPCOMMAND.Replace(",'ENDDATE', 'PERIODID'", "");
            }

            string PERIODCODE = PARAMS.Get("PERIODCODE").ToString();
            FormatPeriod(PERIODCODE); // process STARTDATE, ENDDATE, REPORTDATE

            if (isPeriod)
            {
                SPCOMMAND = SPCOMMAND.Replace("STARTDATE", STARTDATE);
                SPCOMMAND = SPCOMMAND.Replace("ENDDATE", ENDDATE);
            }
            else
            {
                SPCOMMAND = SPCOMMAND.Replace("'STARTDATE'", "");
                SPCOMMAND = SPCOMMAND.Replace("'ENDDATE'", "");
            }

            string isSummary = PARAMS.Get("ISSUMMARY") == null ? "" : PARAMS.Get("ISSUMMARY");
            string reportType = rpttype.SelectedValue; //PARAMS.Get("rpttype") == null ? "" : PARAMS.Get("rpttype");
            string keyName = DATAKEYNAME == null ? "" : DATAKEYNAME;
            if (PARAMS.Get("getreport") != null)
            {
                int htmlRowLimitNumber = (new FWParams()).GetParamHtmlRowLimit();
                DWRSConnection _DWRSConnection = new DWRSConnection();
                DataTable2HtmlTable _DataTable2HtmlTable = new DataTable2HtmlTable(COLUMNCOUNT, htmlRowLimitNumber);

                //COMMAND
                DataTable DTCommand = null;
                string temp_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
                temp_command = DWRSCommand.CommandReplaceParameter(temp_command, PARAMS, false);

                //DETAIL
                string detail_command = "";
                string SQLDETAIL = " SELECT " + DATAKEYNAME + "," + DATADISPLAYNAME;
                SQLDETAIL += " FROM " + DATATABLENAME + " ORDER BY " + DATAKEYNAME;
                DataTable DTDETAIL = null;

                //SUMMARY
                string sum_command = "";
                sum_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
                sum_command = sum_command.Replace("'PERIODID'", "null");
                sum_command = DWRSCommand.CommandReplaceParameter(sum_command, PARAMS, false);
                DataTable DTSUM = null;

                DataTable DTSUB = null;

                HiddenFieldExcelElapsedTime.Value = string.Empty;

                if (reportType.Equals("1")) //HTML
                {
                    #region Export to Html table
                    DTCommand = _DWRSConnection.GetDataTable(temp_command);
                    try
                    {
                        if (DTCommand.Rows.Count > 0)
                        {
                            RSB.Append("<B>ALL</B> " + temp_command + " <BR/>");
                            RSB.Append(WarnExceedingLimit(DTCommand.Rows.Count, htmlRowLimitNumber));
                            RSB.Append(_DataTable2HtmlTable.Build(DTCommand, ISSUBTOTAL));

                            if (ISSUMMARY.Equals("ON"))
                            {
                                DTSUM = _DWRSConnection.GetDataTable(sum_command);
                                if (DTSUM != null && DTSUM.Rows.Count > 0)
                                {
                                    RSB.Append("<B>SUMMARY</B>" + sum_command + "<BR/>");
                                    RSB.Append(WarnExceedingLimit(DTSUM.Rows.Count, htmlRowLimitNumber));
                                    RSB.Append(_DataTable2HtmlTable.Build(DTSUM, ISSUBTOTAL));
                                }
                            }

                            if (!String.IsNullOrEmpty(DATAKEYNAME))
                            {
                                if (!isSummary.ToLower().Equals("on"))
                                {
                                    DTDETAIL = _DWRSConnection.GetDataTable(SQLDETAIL);

                                    if (DTDETAIL != null && DTDETAIL.Rows.Count > 0)
                                    {
                                        foreach (DataRow row in DTDETAIL.Rows)
                                        {
                                            string key = row[DATAKEYNAME].ToString();
                                            string display = row[DATADISPLAYNAME] == null ? "" : row[DATADISPLAYNAME].ToString();

                                            detail_command = temp_command + "," + "'" + key + "'";
                                            DTSUB = _DWRSConnection.GetDataTable(detail_command);
                                            RSB.Append("<B>" + display.ToUpper() + "</B> " + detail_command + "<BR/>");
                                            if (DTSUB != null && DTDETAIL.Rows.Count > 0)
                                            {
                                                RSB.Append(WarnExceedingLimit(DTSUB.Rows.Count, htmlRowLimitNumber));
                                                RSB.Append(_DataTable2HtmlTable.Build(DTSUB, ISSUBTOTAL));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            RSB.Append("<B>ALL</B> " + temp_command + " <BR/>");
                            RSB.Append("<B>NO DATA</B>");
                        }
                    }
                    catch (Exception ex)
                    {
                        RSB.Append("<B>Command error : </B> " + temp_command + " <BR/>");
                        RSB.Append("<B>" + ex.Message.ToString() + "</B>");
                    }
                    #endregion
                }
                else //EXCEL
                {
                    #region Export to Excel

                    DateTime startedPoint = DateTime.Now;

                    DTCommand = _DWRSConnection.GetDataTable(temp_command);
                    DataTable dtFormat = new ReportFormat().GetReportFormatByRegular();
                    try
                    {
                        if (DTCommand.Rows.Count > 0)
                        {
                            HttpContext context = HttpContext.Current;
                            string Title = RNAME;
                            if (!String.IsNullOrEmpty(STARTDATE) && !String.IsNullOrEmpty(ENDDATE))
                            {
                                Title += " From " + DateTime.Parse(STARTDATE).ToString("dd/MM/yyyy") + " To " + DateTime.Parse(ENDDATE).ToString("dd/MM/yyyy");
                            }
                            DataTable2Excel _DataTable2Excel = new DataTable2Excel(Title, context.User.Identity.Name, COLUMNCOUNT, RID, ISONEPERWORKSHEET);
                            _DataTable2Excel.HasChart = HASCHART;
                            _DataTable2Excel.SetDataTable(DTCommand, "ALL", "dd mmm", ISSUBTOTAL);

                            if (ISSUMMARY.Equals("ON"))
                            {
                                DTSUM = _DWRSConnection.GetDataTable(sum_command);
                                if (DTSUM != null && DTSUM.Rows.Count > 0)
                                {
                                    _DataTable2Excel.SetDataTable(DTSUM, "SUMMARY", "dd mmm", ISSUBTOTAL);
                                }
                            }

                            if (!String.IsNullOrEmpty(DATAKEYNAME))
                            {
                                if (!isSummary.ToLower().Equals("on"))
                                {
                                    DTDETAIL = _DWRSConnection.GetDataTable(SQLDETAIL);
                                    if (DTDETAIL != null && DTDETAIL.Rows.Count > 0)
                                    {
                                        foreach (DataRow _Rows in DTDETAIL.Rows)
                                        {
                                            string key = _Rows[DATAKEYNAME].ToString();
                                            string display = _Rows[DATADISPLAYNAME] == null ? "" : _Rows[DATADISPLAYNAME].ToString();

                                            detail_command = temp_command + "," + "'" + key + "'";
                                            DTSUB = _DWRSConnection.GetDataTable(detail_command);
                                            if (DTSUB != null && DTSUB.Rows.Count > 0)
                                            {
                                                _DataTable2Excel.SetDataTable(DTSUB, display, "dd mmm", ISSUBTOTAL);
                                            }
                                        }
                                    }
                                }
                            }

                            _DataTable2Excel.ComeToFirstSheet(); // set the first worksheet is current

                            string FILENAME = Utilities.GetFileNameSplitMapingCheck(temp_command, RID);
                            if (String.IsNullOrEmpty(REPORTDATE))
                            {
                                REPORTDATE = DateTime.Now.ToString("yyyy-MM-dd");
                            }
                            string STATISTICNAME = "";
                            string STATISTICID = PARAMS.Get("STATISTICID");
                            if (!string.IsNullOrEmpty(STATISTICID))
                            {
                                STATISTICNAME = "_" + STATISTICID.Replace("%", "").Replace("+", "").Replace("&", "");
                                STATISTICNAME = STATISTICNAME.Replace("?", "").Replace("<", "").Replace(">", "");
                            }
                            else
                            {
                                STATISTICNAME = "";
                            }
                            EXCELNAME = REPORTDATE + RNAME.Replace("MIS", "").Replace("SR", "") + STATISTICNAME + FILENAME;
                            EXCELNAME = EXCELNAME.Replace(" ", "_");
                            SAVEPATH = Server.MapPath("~/BackOffice/Excel/") + EXCELNAME;
                            URLPATH = "../Excel/" + EXCELNAME;
                            SAVEPATH = SAVEPATH.ToString() + ".xls";
                            URLPATH = URLPATH.ToString() + ".xls";
                            
                            #region Create directory if it isn't existed before - @Don
                            string Up_Directory = ConfigurationManager.AppSettings["ReportDirectory"].ToString();

                            SAVEPATH = string.Empty;
                            SAVEPATH = RNAME.Replace("MIS", "").Replace("SR", "") + "/" + ServiceUtility.GetUserName() + "/";
                            if (SAVEPATH.StartsWith("/"))
                            {
                                SAVEPATH = SAVEPATH.Substring(SAVEPATH.IndexOf("/") + 1);
                            }
                            SAVEPATH = Up_Directory + SAVEPATH;
                            FileUtility.DirectoryExist(SAVEPATH);
                            SAVEPATH = SAVEPATH + EXCELNAME;
                            SAVEPATH = SAVEPATH.ToString() + ".xls";
                            #endregion

                            string URL = _DataTable2Excel.SaveExcelGetPath(SAVEPATH);

                            DateTime endedPoint = DateTime.Now;
                            RSB.Append("Total time: " + GetElapsedTime(startedPoint, endedPoint));

                            #region Save information of report file - @Don
                            FWUserReportHistory reportHistory = new FWUserReportHistory();
                            //reportHistory.UpdateReport(ServiceUtility.GetUserName(), RNAME.Replace("MIS", "").Replace("SR", ""), EXCELNAME.Trim() + ".xls");
                            reportHistory.UpdateReport(
                                ServiceUtility.GetUserName(), 
                                RNAME.Replace("MIS", "").Replace("SR", ""), 
                                EXCELNAME.Trim() + ".xls",
                                endedPoint.ToString("yyy-MM-dd hh:mm:ss tt"),
                                startedPoint.ToString("yyy-MM-dd hh:mm:ss tt"));
                            #endregion

                            string fileUrl = @"http://" + Request.Url.Authority + VirtualPathUtility.ToAbsolute("~/Handlers/GettingFile.ashx") +
                                "?file=" + SecurityData.Encrypt(EXCELNAME + ".xls") +
                                "&name=" + SecurityData.Encrypt(RNAME.Replace("MIS", string.Empty).Replace("SR", string.Empty));
                            //HiddenFieldExcelElapsedTime.Value = @"http://" + Request.Url.Authority + VirtualPathUtility.ToAbsolute("~/Handlers/GettingFile.ashx") +
                            //    "?file=" + SecurityData.Encrypt(EXCELNAME + ".xls") +
                            //    "&name=" + SecurityData.Encrypt(RNAME.Replace("MIS", string.Empty).Replace("SR", string.Empty));

                            RSB.Append(" - <a href='" + fileUrl + "' style='font-weight:bold;font-size:14px'>Click here to download</a>");
                        }
                        else
                        {
                            RSB.Append("<B>ALL</B> " + temp_command + " <BR/>");
                            RSB.Append("<B>Can not export excel.<BR/>NO DATA</B>");
                        }
                    }
                    catch (Exception ex)
                    {
                        RSB.Append("<B>Command error : </B> " + temp_command + " <BR/>");
                        RSB.Append("<B>" + ex.Message.ToString() + "</B>");
                    }
                    #endregion
                }
            }
        }
    }
    
    protected void btnGetFile_Click(object sender, EventArgs e)
    {
        if (ddlRecentReports.SelectedIndex >= 0)
        {
            string filename = string.Empty;
            string reportname = string.Empty;
            SplitParams(ddlRecentReports.SelectedValue, ref filename, ref reportname);
            if (string.IsNullOrEmpty(filename) || string.IsNullOrEmpty(reportname))
            {
                return;
            }

            string Up_Directory = System.Configuration.ConfigurationManager.AppSettings["ReportDirectory"].ToString();
            string rightPath = string.Empty;

            filename = SecurityData.Decrypt(filename.Replace(" ", "+"));
            reportname = SecurityData.Decrypt(reportname.Replace(" ", "+"));
            rightPath = System.Business.FileUtility.GetFilePath(filename, reportname);
            rightPath = Up_Directory + rightPath;
            if ((!string.IsNullOrEmpty(rightPath)) && System.Business.FileUtility.IsExisted(rightPath))
            {
                Response.Redirect("~/Handlers/GettingFile.ashx?" + ddlRecentReports.SelectedValue);
            }
            else
            {
                RSB.Append("File does not exist.");
                RSB.ToString();
            }
        }
    }

    protected void ButtonPreviewReport_Click(object sender, EventArgs e)
    {
        DbCommand dbCommand = null;
        DataTable2HtmlTable dataTable2HtmlTable = null;
        DWRSConnection _DWRSConnection = null;
        string[] temp = null;

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

            string PERIODCODE = PARAMS.Get("PERIODCODE").ToString();
            FormatPeriod(PERIODCODE); // process STARTDATE, ENDDATE, REPORTDATE

            if (isPeriod)
            {
                SPCOMMAND = SPCOMMAND.Replace("STARTDATE", STARTDATE);
                SPCOMMAND = SPCOMMAND.Replace("ENDDATE", ENDDATE);
            }
            else
            {
                SPCOMMAND = SPCOMMAND.Replace("'STARTDATE'", "");
                SPCOMMAND = SPCOMMAND.Replace("'ENDDATE'", "");
            }

            string isSummary = PARAMS.Get("ISSUMMARY") == null ? "" : PARAMS.Get("ISSUMMARY");
            string keyName = DATAKEYNAME == null ? "" : DATAKEYNAME;
            if (PARAMS.Get("getreport") != null)
            {
                //COMMAND
                string temp_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
                temp_command = DWRSCommand.CommandReplaceParameter(temp_command, PARAMS, false);

                //DETAIL
                string detail_command = "";
                string SQLDETAIL = " SELECT " + DATAKEYNAME + "," + DATADISPLAYNAME;
                SQLDETAIL += " FROM " + DATATABLENAME + " ORDER BY " + DATAKEYNAME;
                DataTable DTDETAIL = null;

                //SUMMARY
                string sum_command = "";
                sum_command = SPCOMMAND.Replace("'" + DATAKEYNAME + "'", keyName);
                sum_command = sum_command.Replace("'PERIODID'", "null");
                sum_command = DWRSCommand.CommandReplaceParameter(sum_command, PARAMS, false);

                try
                {
                    RSB.Append("<B>ALL</B> " + temp_command + " <BR/>");

                    dbCommand = new DbCommand(temp_command);
                    dataTable2HtmlTable = new DataTable2HtmlTable();
                    temp = dbCommand.GetSelectingFieldName();
                    if (temp != null)
                    {
                        RSB.Append(dataTable2HtmlTable.PreviewHeader(temp));
                    }

                    if (ISSUMMARY.Equals("ON"))
                    {
                        RSB.Append("<B>SUMMARY</B>" + sum_command + "<BR/>");
                        dbCommand = new DbCommand(sum_command);
                        temp = dbCommand.GetSelectingFieldName();
                        if (temp != null)
                        {
                            RSB.Append(dataTable2HtmlTable.PreviewHeader(temp));
                        }
                    }

                    if (!String.IsNullOrEmpty(DATAKEYNAME))
                    {
                        if (!isSummary.ToLower().Equals("on"))
                        {
                            _DWRSConnection = new DWRSConnection();
                            DTDETAIL = _DWRSConnection.GetDataTable(SQLDETAIL);

                            if (DTDETAIL != null && DTDETAIL.Rows.Count > 0)
                            {
                                DataRow row = DTDETAIL.Rows[0];
                                string key = row[DATAKEYNAME].ToString();
                                string display = row[DATADISPLAYNAME] == null ? "" : row[DATADISPLAYNAME].ToString();

                                detail_command = temp_command + "," + "'" + key + "'";
                                RSB.Append("<B>" + display.ToUpper() + "</B> " + detail_command + "<BR/>");
                                dbCommand = new DbCommand(detail_command);
                                temp = dbCommand.GetSelectingFieldName();
                                if (temp != null)
                                {
                                    RSB.Append(dataTable2HtmlTable.PreviewHeader(temp));
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    RSB.Append("<B>Command error : </B> " + temp_command + " <BR/>");
                    RSB.Append("<B>" + ex.Message.ToString() + "</B>");
                }
            }
        }
    }

    #endregion


    #region Helpers

    private void GetReportsDetail()
    {
        RID = Request.QueryString["ProgramId"];
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
                DATATABLENAME = DTReports.Rows[0]["DATATABLENAME"].ToString();
                DATAKEYNAME = DTReports.Rows[0]["DATAKEYNAME"].ToString();
                DATADISPLAYNAME = DTReports.Rows[0]["DATADISPLAYNAME"].ToString();
                RSTATUS = DTReports.Rows[0]["RSTATUS"].ToString();
                COLUMNCOUNT = Int16.Parse(DTReports.Rows[0]["COLUMNCOUNT"].ToString());
                ENABLE = bool.Parse(DTReports.Rows[0]["ENABLE"].ToString());
                RNAME = DTReports.Rows[0]["RNAME"].ToString();
                ISSUBTOTAL = bool.Parse(DTReports.Rows[0]["SUBTOTAL"].ToString());
                ISONEPERWORKSHEET = bool.Parse(DTReports.Rows[0]["SEPARATEDSHEET"].ToString());
                HASCHART = bool.Parse(DTReports.Rows[0]["HASCHART"].ToString());
                if (ENABLE)
                {
                    //FIND DATA Source
                    if (!String.IsNullOrEmpty(DBSOURCE))
                    {
                        string SQLDBSource = " SELECT FIRSTDATE,LASTDATE ";
                        SQLDBSource += " FROM BODB_DWRS.DBO.VIEW_DW_STATUS ";
                        SQLDBSource += " WHERE [CUBE] = '" + DBSOURCE + "' ";
                        DWRSConnection _DWRSConnection = new DWRSConnection();
                        DataTable DTDBSource = _DWRSConnection.GetDataTable(SQLDBSource);
                        if (DTDBSource != null && DTDBSource.Rows.Count > 0)
                        {
                            string FIRSTDATE = DTDBSource.Rows[0]["FIRSTDATE"].ToString();
                            string LASTDATE = DTDBSource.Rows[0]["LASTDATE"].ToString();
                            if (!String.IsNullOrEmpty(FIRSTDATE))
                                FIRSTDATE = DateTime.Parse(DTDBSource.Rows[0]["FIRSTDATE"].ToString()).ToString("dd/MM/yyyy");
                            else
                                FIRSTDATE = "";
                            if (!String.IsNullOrEmpty(LASTDATE))
                                LASTDATE = DateTime.Parse(DTDBSource.Rows[0]["LASTDATE"].ToString()).ToString("dd/MM/yyyy");
                            else
                                LASTDATE = "";

                            DBSOURCE += " From " + FIRSTDATE + " To " + LASTDATE;
                        }
                        else
                        {
                            DBSOURCE += " Status is null.";
                        }
                    }

                    ParamaterBoard board = new ParamaterBoard(TableParameterBoard, Request.Params);
                    board.GenerateParameterBoard(RID, ISSUMMARY.Equals("ON"), ref isPeriod, ref PERIOD);

                    this._PreviousPeriodOption = GetPreviousPeriod(PERIOD);
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

    public void FormatPeriod(string PERIODCODE)
    {
        try
        {
            CultureInfo _CultureInfo = new CultureInfo("en-US");
            switch (PERIODCODE)
            {
                case "0": //ANNUAL
                    STARTDATE = DropDownListANNUAL.SelectedValue.ToString() + "/01/01";
                    ENDDATE = (int.Parse(DropDownListANNUAL.SelectedValue) + 1).ToString() + "/01/01";
                    REPORTDATE = DateTime.Parse(STARTDATE).ToString("yyyy");
                    break;
                case "1": //Daily
                    STARTDATE = DateTime.ParseExact(TextBoxStartDate.Text, "dd/MM/yyyy", _CultureInfo).ToString("yyyy/MM/dd");
                    ENDDATE = DateTime.ParseExact(TextBoxEndDate.Text, "dd/MM/yyyy", _CultureInfo).ToString("yyyy/MM/dd");
                    REPORTDATE = DateTime.Parse(STARTDATE).ToString("yyyy-MM-dd");
                    break;
                case "2": //Week
                    STARTDATE = UtilityDateTime.StartOfWeekly(int.Parse(DropDownListStartWeek.SelectedValue));
                    ENDDATE = UtilityDateTime.EndOfWeekly(int.Parse(DropDownListEndWeek.SelectedValue));
                    REPORTDATE = DateTime.Parse(STARTDATE).ToString("yyyy-MM-dd");
                    break;
                case "3": //Month
                    DateTime LASTDATE = new DateTime(int.Parse(DropDownListYear.SelectedValue), int.Parse(DropDownListMonthly.SelectedValue), 1);
                    STARTDATE = DropDownListYear.SelectedValue + "/" + DropDownListMonthly.SelectedValue + "/01";
                    ENDDATE = LASTDATE.AddMonths(1).ToString("yyyy/MM/dd");
                    REPORTDATE = DateTime.Parse(STARTDATE).ToString("yyyy-MM");
                    break;
                case "4": //FYE
                    STARTDATE = (int.Parse(DropDownListFYE.SelectedValue) - 1).ToString() + "/07/01";
                    ENDDATE = DropDownListFYE.SelectedValue + "/07/01";
                    REPORTDATE = DateTime.Parse(STARTDATE).ToString("yyyy");
                    break;
                case "5": //Month Range
                    DateTime temp = new DateTime(int.Parse(DropDownListToYEARRANGE.SelectedValue), int.Parse(DropDownListToMONTHRANGE.SelectedValue), 1);
                    STARTDATE = DropDownListFromYEARRANGE.SelectedValue + "/" + DropDownListFromMONTHRANGE.SelectedValue + "/01";
                    ENDDATE = temp.AddMonths(1).ToString("yyyy/MM/dd");
                    REPORTDATE = DateTime.Parse(STARTDATE).ToString("yyyy-MM");
                    break;
            }
        }
        catch { }
    }

    public void LoadRecentReports()
    {
        FWUserReportHistory obj = new FWUserReportHistory();
        DataTable dtb = obj.GetReportsByUser(ServiceUtility.GetUserName(), RNAME.Replace("MIS", "").Replace("SR", ""));
        ProcessDownloadLink(dtb);
        ddlRecentReports.DataSource = dtb;
        ddlRecentReports.DataBind();
    }

    public void ProcessDownloadLink(DataTable dtb)
    {
        dtb.Columns.Add("Link", typeof(string));
        foreach (DataRow row in dtb.Rows)
        {
            string filename = row["URL"].ToString();
            row["Link"] = "file=" + SecurityData.Encrypt(filename) + "&name=" + SecurityData.Encrypt(row["RName"].ToString());
        }
    }

    private string WarnExceedingLimit(int countOfRow, int limit)
    {
        string result = "({0} Rows produced, exceeding limit. {1} first rows will be displayed.)<BR/>";
        if (countOfRow > limit)
        {
            return string.Format(result, countOfRow, limit);
        }
        return string.Empty;
    }

    private void SplitParams(string inputParams, ref string fileName, ref string reportName)
    {
        fileName = string.Empty;
        reportName = string.Empty;

        string[] temp = inputParams.Split('&');
        if ((temp != null) && (temp.Length > 0))
        {
            for (int idx = 0; idx < temp.Length; idx++)
            {
                if (temp[idx].TrimStart().StartsWith("file"))
                {
                    fileName = temp[idx].Substring(temp[idx].IndexOf("=") + 1);
                }
                else if (temp[idx].TrimStart().StartsWith("name"))
                {
                    reportName = temp[idx].Substring(temp[idx].IndexOf("=") + 1);
                }
            }
        }
    }
    
    private string GetPreviousPeriod(string optStatus)
    {
        string id = "{0}";
        int temp = 0;
        if (optStatus.Equals("null")) temp = 0;
        if (optStatus.Equals("Daily")) temp = 1;
        if (optStatus.Equals("Weekly")) temp = 2;
        if (optStatus.Equals("Monthly")) temp = 3;
        if (optStatus.Equals("Yearly")) temp = 4;
        if (optStatus.Equals("MonthRange")) temp = 5;

        return string.Format(id, temp);
    }

    private string GetElapsedTime(DateTime startedTime, DateTime endedTime)
    {
        string result = string.Empty;
        TimeSpan timespan = endedTime.Subtract(startedTime);
        if (timespan.TotalSeconds > 1)
        {
            result = timespan.Minutes.ToString("00");
            result += ":" + timespan.Seconds.ToString("00");
            result += " (mm:ss)";
        }
        else
        {
            result = timespan.Milliseconds.ToString();
            result += " (milliseconds)";
        }

        return result;
    }

    #endregion
}
