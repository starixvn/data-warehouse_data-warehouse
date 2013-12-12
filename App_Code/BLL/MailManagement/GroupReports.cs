using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace System.MailManagement
{
    [System.ComponentModel.DataObject]
    public class GroupReports : MailService
    {
        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetReportsInGroupByGID(string Original_GID)
        {
            string Criteria = " GID = '" + Original_GID + "'";
            return GetDataTableByCriteria(ViewMail_GroupReports_V, Criteria);
        }

        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetReportsNotInGroup(string Original_GID, string RName)
        {
            string Criteria = " CID NOT IN (SELECT CID FROM Mail_GroupReports WHERE GID = '" + Original_GID + "') ";
            Criteria += " AND RName LIKE '%" + RName + "%' ";
            return GetDataTableByCriteria(ViewMail_Command_V, Criteria);
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public bool InsertGroupReports(string GID,string CID)
        {
            XMLCommand.Clear();
            XMLCommand.Add("GID", GID);
            XMLCommand.Add("CID", CID);
            XMLCommand.Add("Creator", UserID);
            XMLCommand.Add("CreateDate", "getDate()");
            XMLCommand.Add("IPCreator", UserIP);
            return Insert(TableMail_GroupReports, XMLCommand.GetXMLCommand()) == Completed;
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public bool DeleteGroupReports(string Original_GID, string Original_CID)
        {
            string Criteria = " GID = '" + Original_GID + "' AND CID = '" + Original_CID + "'";
            return Delete(TableMail_GroupReports, Criteria) == Completed;
        }
    }
}
