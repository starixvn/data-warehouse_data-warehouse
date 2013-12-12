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
    public class Schedules : MailService
    {
        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetSchedules()
        {
            return GetDataTable(TableMail_Schedules);
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public bool UpdateGroup(string Original_SCID, string ScheduleName, string Time, string Delivery)
        {
            XMLCommand.Clear();
            string Criteria = " SCID = '" + Original_SCID + "'";
            XMLCommand.Add("ScheduleName", ScheduleName);
            XMLCommand.Add("Time", Time);
            XMLCommand.Add("Delivery", Delivery);
            XMLCommand.Add("Editor", UserID);
            XMLCommand.Add("IPEditor", UserIP);
            return Update(TableMail_Schedules, Criteria, XMLCommand.GetXMLCommand()) == Completed;
        }
    }
}
