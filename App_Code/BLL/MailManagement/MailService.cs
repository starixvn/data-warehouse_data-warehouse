using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Service;

namespace System.MailManagement
{
    public class MailService : ServiceSystem
    {
        //Table
        protected const string TableMail_Group = "Mail_Group";
        protected const string TableMail_GroupMailUsers = "Mail_GroupMailUsers";
        protected const string TableMail_GroupReports = "Mail_GroupReports";
        protected const string TableMail_Command = "Mail_Command";
        protected const string TableMail_Schedules = "Mail_Schedules";
        protected const string TableMail_Logs = "Mail_Logs";

        //View
        protected const string ViewMail_Command_V = "Mail_Command_V";
        protected const string ViewMail_GroupReports_V = "Mail_GroupReports_V";
        protected const string ViewMail_GroupMailUsers_V = "Mail_GroupMailUsers_V";

    }
}
