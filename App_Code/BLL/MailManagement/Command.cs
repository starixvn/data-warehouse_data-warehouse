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
    public class Command : MailService
    {
        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetMailCommand(string RID)
        {
            string Criteria = " RID = '" + RID + "'";
            return GetDataTableByCriteria(TableMail_Command, Criteria);
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public bool InsertMailCommand(string RID, string Command, string SummaryCommand, string Detail, string Period)
        {
            XMLCommand.Clear();
            XMLCommand.Add("RID", RID);
            XMLCommand.Add("Command", Command);
            XMLCommand.Add("SummaryCommand", SummaryCommand);
            XMLCommand.Add("Detail", Detail);
            XMLCommand.Add("Period", Period);
            XMLCommand.Add("Creator", UserID);
            XMLCommand.Add("CreateDate", "getDate()");
            XMLCommand.Add("IPCreator", UserIP);
            return Insert(TableMail_Command, XMLCommand.GetXMLCommand()) == Completed;
        }


        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public bool UpdateMailCommand(string Original_CID, string Command, string SummaryCommand, string Detail, string Period,string SendStatus,string Status)
        {
            XMLCommand.Clear();
            string Criteria = " CID = '" + Original_CID + "'";
            XMLCommand.Add("Command", Command);
            XMLCommand.Add("SummaryCommand", SummaryCommand);
            XMLCommand.Add("Detail", Detail);
            XMLCommand.Add("Period", Period);
            XMLCommand.Add("SendStatus", SendStatus);
            XMLCommand.Add("Status", Status);
            XMLCommand.Add("Editor", UserID);
            XMLCommand.Add("IPEditor", UserIP);
            return Update(TableMail_Command, Criteria, XMLCommand.GetXMLCommand()) == Completed;
        }

    }
}
