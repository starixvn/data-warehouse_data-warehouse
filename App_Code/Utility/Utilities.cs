using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
using System.Xml;
using System.Net;
using System.Globalization;
using System.FrameWork;

namespace System.Utility
{
    /// <summary>
    /// Summary description for Utilities
    /// </summary>
    public class Utilities
    {
        public Utilities()
        {
        }

        #region Utility Framwork

        public static string GetPathName(string pathName)
        {
            string host = HttpContext.Current.Request.Url.Host;
            string port = HttpContext.Current.Request.Url.Port.ToString();
            string app  = HttpContext.Current.Request.ApplicationPath;
            string path = "http://" + host + ":" + port + app + pathName;

            return path;
        }

        public static DataTable GetXML2DataTable(string XMLResponse)
        {
            try
            {
                DataSet XMLDataSet = new DataSet();
                StringReader XMLReader = new StringReader(XMLResponse);
                XMLDataSet.ReadXml(XMLReader);
                return XMLDataSet.Tables["DataObject"];
            }
            catch
            {
                return null;
            }
        }

        public static DataTable GetXML2DataTable(string XMLResponse, string ObjectName)
        {
            try
            {
                DataSet XMLDataSet = new DataSet();
                StringReader XMLReader = new StringReader(XMLResponse);
                XMLDataSet.ReadXml(XMLReader);
                return XMLDataSet.Tables[ObjectName];
            }
            catch
            {
                return null;
            }
        }

        public static string GetResultSet(string XMLResponse)
        {
            string result = null;
            try
            {
                if(XMLResponse.Equals("Completed"))
                {
                    result = XMLResponse;
                }
                else
                {
                    XmlDocument xmldoc = new XmlDocument();
                    xmldoc.LoadXml(XMLResponse);
                    result = xmldoc.SelectSingleNode("/result").InnerText;
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            return result;
        }
        public static void RedirectSiteMap(string ProgramId, HttpResponse Response)
        {
            FWSiteMap _FWSiteMap = new FWSiteMap();
            DataSet DSSiteMap = _FWSiteMap.GetSiteMapByUserInRole(ProgramId);
            if (DSSiteMap.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("~/BackOffice/Login.aspx");
            }
        }
        public static void ModalPopShow(GridViewRow row)
        {
            AjaxControlToolkit.ModalPopupExtender extender = row.FindControl("ModalPopupExtender") as AjaxControlToolkit.ModalPopupExtender;
            if (extender != null)
            { extender.Show(); }
        }

        public static string CheckActiveBit(string bActive)
        {
            if (bActive == "True")
            {
                return "<img src=\"../include/images/mytask_taskdone.gif\" alt=\"Active\">";
            }
            else if (bActive == "False")
            {
                return "<img src=\"../include/images/mytask_taskdelete.gif\" alt=\"In Active\">";
            }
            else
            {
                return bActive ?? string.Empty;
            }
        }

        public static bool String2Boolean(string Status)
        {
            if (Status.ToLower() == "true")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static string Boolean2String(bool Status)
        {
            if (Status == true)
            {
                return "True";
            }
            else
            {
                return "False";
            }
        }

        public static string NULL2Value(string value)
        {
            if (value == null)
            {
                value = "";
            }
            return value;
        }

        public static DataTable GetDatareader2DataTable(SqlDataReader sqldatareader)
        {
            DataTable dt = new DataTable();
            try
            {
                dt.Load(sqldatareader);
                return dt;
            }
            catch
            {
                return null;
            }
        }

        public static string FileUpload(FileUpload fileUpload,string fileName,String pathFile)
        {
            string file = "";
            String _targetDir = pathFile;
            try
            {
                if (fileUpload.PostedFile != null)
                {
                    string typeFile = fileUpload.PostedFile.FileName;
                    fileUpload.PostedFile.SaveAs(_targetDir + Path.GetFileName(fileName + typeFile.Substring(typeFile.Length - 4)));
                    file = fileName + typeFile.Substring(typeFile.Length - 4);
                }
            }
            catch 
            {
            }
            return file;
        }

        public static void DeleteFileUpload(string pathFile)
        {
            try
            {
                File.Delete(pathFile);
            }
            catch { }
        }

        public static void DirectoryExist(String Path)
        {
            if (!System.IO.Directory.Exists(Path))
            {
                System.IO.Directory.CreateDirectory(Path);
            }
        }
        public static bool FileExist(String Path)
        {
            bool ret = false;
            if (System.IO.File.Exists(Path))
            {
                ret = true;
            }
            return ret;
        }

        
        public static string GetSQLIsNull(string Value,string ModeType)
        {
            if (string.IsNullOrEmpty(Value))
                return "NULL";

            if (ModeType.Equals("INT"))
                return Value;
            else
                return "'" + Value + "'";
        }


        public static string GetHttpPath(string pathName)
        {
            string host = HttpContext.Current.Request.Url.Host;
            string port = HttpContext.Current.Request.Url.Port.ToString();
            string app = HttpContext.Current.Request.ApplicationPath;
            string http = pathName.Replace("~/", "/");
            string path = "http://" + host + ":" + port + app + http;

            return path;
        }

        public static String ReadHtmlPage(string url, string post)
        {
            String result = "";

            try
            {
                String strPost = post;
                StreamWriter myWriter = null;

                HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
                objRequest.Method = "POST";
                objRequest.ContentLength = strPost.Length;
                objRequest.ContentType = "application/x-www-form-urlencoded";

                try
                {
                    myWriter = new StreamWriter(objRequest.GetRequestStream());
                    myWriter.Write(strPost);
                }
                catch (Exception e)
                {
                    return e.Message;
                }
                finally
                {
                    myWriter.Close();
                }

                HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
                using (StreamReader sr =
                   new StreamReader(objResponse.GetResponseStream()))
                {
                    result = sr.ReadToEnd();

                    sr.Close();
                }
            }
            catch
            {
            }
            return result;

        }

        /// <summary>        
        /// GetMappingTable2Column(Column ที่จะ Group, Column ที่จะเปลียนจาก Row เป็น Column , Column ที่เป็นข้อมูล, ข้อมูลที่จะแปลงจาก  Row เป็น Column, ข้อมูล Header);
        /// </summary>
        /// <param name="ColumnFig">Column ที่จะ Group</param>
        /// <param name="ColumnMapping">Column ที่จะเปลียนจาก Row เป็น Column</param>
        /// <param name="valueField">Column ที่เป็นข้อมูล</param>
        /// <param name="Data">ข้อมูลที่จะแปลงจาก  Row เป็น Column</param>
        /// <param name="TableHeader">ข้อมูล Header </param>
        /// <returns></returns>
        public static DataTable GetMappingTable2Column(string ColumnFig, string ColumnMapping, string valueField, DataTable Data, DataTable TableHeader)
        {
            DataTable ReturnTable = new DataTable();

            try
            {
                int startIndex = Data.Columns.IndexOf(valueField);

                ReturnTable.Columns.Add(ColumnFig);

                for (int i = 0; i < TableHeader.Rows.Count; i++)
                {
                    DataColumn _DataColumn = new DataColumn();
                    _DataColumn.ColumnName = TableHeader.Rows[i][ColumnMapping].ToString();
                    _DataColumn.DefaultValue = "0";
                    ReturnTable.Columns.Add(_DataColumn);
                }

                DataColumn _DataColumnTotal = new DataColumn();
                _DataColumnTotal.ColumnName = "Total";
                _DataColumnTotal.DefaultValue = "0";
                ReturnTable.Columns.Add(_DataColumnTotal);

                int RowCount = Data.Rows.Count;

                string DateTemp = "";
                DataRow DataRow = ReturnTable.NewRow();
                int ValueTotal = 0;

                for (int i = 0; i < RowCount; i++)
                {
                    string DateRow = Data.Rows[i][ColumnFig].ToString();
                    if (DateTemp.Equals(DateRow))
                    {

                        string FieldMapping = Data.Rows[i][ColumnMapping].ToString();
                        string Value = Data.Rows[i][startIndex].ToString();
                        try { ValueTotal += int.Parse(Value); }
                        catch { }
                        DataRow[ReturnTable.Columns.IndexOf(FieldMapping)] = Value;
                    }
                    else
                    {
                        if (!DateTemp.Equals(""))
                        {
                            DataRow[ReturnTable.Columns.IndexOf("Total")] = ValueTotal.ToString();
                            ReturnTable.Rows.Add(DataRow);
                            DataRow = ReturnTable.NewRow();
                            ValueTotal = 0;
                        }

                        DateTemp = DateRow;
                        DataRow[0] = DateTemp;

                        i--;
                    }

                    if (i == RowCount - 1)
                    {
                        DataRow[ReturnTable.Columns.IndexOf("Total")] = ValueTotal.ToString();
                        ReturnTable.Rows.Add(DataRow);
                    }
                }
            }
            catch
            {
            }

            return ReturnTable;
        }

        public static void SetPriority(string type, ImageButton imageButton,string ProgramId)
        {
            FWPriority _FWPriority = new FWPriority();
            DataSet ds = _FWPriority.GetPriorityByProgramId(ProgramId);
            try
            {
                if (type == "S")
                {
                    imageButton.Visible = bool.Parse(ds.Tables[0].Rows[0]["SearchStatus"].ToString());
                }
                else if (type == "I")
                {
                    string aaa = ds.Tables[0].Rows[0]["InsertStatus"].ToString();
                    imageButton.Visible = bool.Parse(ds.Tables[0].Rows[0]["InsertStatus"].ToString());
                }
                else if (type == "U")
                {
                    imageButton.Visible = bool.Parse(ds.Tables[0].Rows[0]["UpdateStatus"].ToString());
                }
                else if (type == "D")
                {
                    imageButton.Visible = bool.Parse(ds.Tables[0].Rows[0]["DeleteStatus"].ToString());
                }
                else
                {
                    imageButton.Visible = false;
                }
            }
            catch { }
        }
        public static string CheckLogoStatus(string _Status)
        {
            if (_Status == "N")
            {
                return "<img src=\"../include/images/icon/new.gif\">";
            }
            else if (_Status == "O")
            {
                return "<img src=\"../include/images/icon/old.gif\">";
            }
            else
            {
                return "<img src=\"../include/images/icon/old.gif\">";
            }
        }
        #endregion

        #region Utility DWRS

        public static string GetFileNameSplitMapingCheck(string strValue, string RID)
        {
            string ReturnValue = "";

            try
            {
                string[] delim = { "," };
                string[] spltdValue = strValue.Replace(" ","").Replace("'", "").Split(delim, StringSplitOptions.None);

                System.Control.SectionsInReports _SectionsInReports = new System.Control.SectionsInReports();
                DataTable DTSectionsInReports = _SectionsInReports.GetMappingSectionsInReportsByRID(RID);
                if (DTSectionsInReports != null && DTSectionsInReports.Rows.Count > 0)
                {
                    DTSectionsInReports.Columns.Add("VALUES");

                    int ValueCount = spltdValue.Length;
                    for (int i = 0; i < spltdValue.Length; i++)
                    {
                        string a = spltdValue[i].ToString();
                        DTSectionsInReports.Rows[i]["VALUES"] = spltdValue[i].ToString();
                    }

                    for (int i = 0; i < DTSectionsInReports.Rows.Count; i++)
                    {
                        string SSTATUS = DTSectionsInReports.Rows[i]["SSTATUS"].ToString();
                        string VALUES = DTSectionsInReports.Rows[i]["VALUES"].ToString();
                        string SID = DTSectionsInReports.Rows[i]["SID"].ToString();
                        string tempName = "";
                        if (SSTATUS.Equals("ON"))
                        {
                            if (VALUES != "null" && VALUES != "-1")
                            {
                                System.Control.OptionsInSections _OptionsInSections = new System.Control.OptionsInSections();
                                DataTable DTOptionsInSections = _OptionsInSections.GetOptionsInSectionsBySIDAndValue(SID, VALUES);
                                if (DTOptionsInSections != null && DTOptionsInSections.Rows.Count > 0)
                                {
                                    tempName = DTOptionsInSections.Rows[0]["ONAME"].ToString();
                                }
                            }
                        }
                        //else if (SSTATUS.Equals("TEXT"))
                        //{
                        //    if (VALUES.IndexOf("null") == -1)
                        //    {
                        //        tempName = VALUES;
                        //    }
                        //}

                        if (!tempName.Equals(""))
                        {
                            if (tempName.LastIndexOf("_") != -1)
                            {
                                ReturnValue += tempName + "_";
                            }
                            else
                            {
                                ReturnValue += "_" + tempName + "_";
                            }
                        }
                    }
                    if (ReturnValue.LastIndexOf("_") != -1)
                    {
                        int pos = ReturnValue.LastIndexOf("_");
                        ReturnValue = ReturnValue.Substring(0, pos);
                    }

                    ReturnValue = ReturnValue.Replace("/", "").Replace("__", "_");
                }

                return ReturnValue;
            }
            catch
            {
                return ReturnValue = "PARAM";
            }
        }

        #endregion

        #region Mics

        private static string[,] _ExcelColors = 
                { 
                    {"15", "#c0c0c0"},
                    {"30", "#800000"},
                    {"45", "#ff9900"},
                    {"1", "#000000"},
                    {"16", "#808080"},
                    {"31", "#008080"},
                    {"46", "#ff6600"},
                    {"2", "#ffffff"},
                    {"17", "#9999ff"},
                    {"32", "#0000ff"},
                    {"47", "#666699"},
                    {"3", "#ff0000"},
                    {"18", "#993366"},
                    {"33", "#00ccff"},
                    {"48", "#969696"},
                    {"4", "#00ff00"},
                    {"19", "#ffffcc"},
                    {"34", "#ccffff"},
                    {"49", "#003366"},
                    {"5", "#0000ff"},
                    {"20", "#ccffff"},
                    {"35", "#ccffcc"},
                    {"50", "#339966"},
                    {"6", "#ffff00"},
                    {"21", "#660066"},
                    {"36", "#ffff99"},
                    {"51", "#003300"},
                    {"7", "#ff00ff"},
                    {"22", "#ff8080"},
                    {"37", "#99ccff"},
                    {"52", "#333300"},
                    {"8", "#00ffff"},
                    {"23", "#0066cc"},
                    {"38", "#ff99cc"},
                    {"53", "#993300"},
                    {"9", "#800000"},
                    {"24", "#ccccff"},
                    {"39", "#cc99ff"},
                    {"54", "#993366"},
                    {"10", "#008000"},
                    {"25", "#000080"},
                    {"40", "#ffcc99"},
                    {"55", "#333399"},
                    {"11", "#000080"},
                    {"26", "#ff00ff"},
                    {"41", "#3366ff"},
                    {"56", "#333333"},
                    {"12", "#808000"},
                    {"27", "#ffff00"},
                    {"42", "#33cccc"},
                    {"13", "#800080"},
                    {"28", "#00ffff"},
                    {"43", "#99cc00"},
                    {"14", "#008080"},
                    {"29", "#800080"},
                    {"44", "#ffcc00"}
                };

        public static System.Collections.Generic.IDictionary<int,string> GetExcelColors()
        {
            System.Collections.Generic.Dictionary<int,string> dictionary = new System.Collections.Generic.Dictionary<int,string>();
            string item = string.Empty;
            string value = string.Empty;

            for (int rowIdx = 0; rowIdx < _ExcelColors.GetLength(0); rowIdx++)
            {
                item = _ExcelColors[rowIdx, 0];
                value = _ExcelColors[rowIdx, 1];
                dictionary.Add(int.Parse(item), value);
            }

            return dictionary;
        }

        #endregion
    }
}
