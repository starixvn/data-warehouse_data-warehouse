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
    public class MailLogs : MailService
    {
        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetMailLogs(string date)
        {
            string Criteria = " date between '" + DateTime.ParseExact(date, "dd/MM/yyyy", Culture).ToString("yyyy/MM/dd 00:00:00") + "'";
            Criteria += " AND '" + DateTime.ParseExact(date, "dd/MM/yyyy", Culture).ToString("yyyy/MM/dd 23:59:59") + "' Order by date desc";
            return GetDataTableByCriteria(TableMail_Logs, Criteria);
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public bool DeleteMailLogs()
        {
            return Delete(TableMail_Logs, " 1=1 ") == Completed;
        }
    }
}
