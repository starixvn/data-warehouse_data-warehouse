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
    public class GroupMailUsers : MailService
    {
        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetUsersInGroupByGID(string Original_GID)
        {
            string Criteria = " GID = '" + Original_GID + "' AND Status = 'True'";
            return GetDataTableByCriteria(ViewMail_GroupMailUsers_V, Criteria);
        }

        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetUsersNotInGroup(string Original_GID, string FirstName)
        {
            string Criteria = " UserId NOT IN (SELECT UserId FROM Mail_GroupMailUsers_V WHERE GID = '" + Original_GID + "') ";
            Criteria += " AND FirstName LIKE '%" + FirstName + "%' AND Status = 'True' ";
            return GetDataTableByCriteria("FW_User_V", Criteria);
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public bool InsertGroupMailUsers(string GID, string UserId)
        {
            XMLCommand.Clear();
            XMLCommand.Add("GID", GID);
            XMLCommand.Add("UserId", UserId);
            XMLCommand.Add("Creator", UserID);
            XMLCommand.Add("CreateDate", "getDate()");
            XMLCommand.Add("IPCreator", UserIP);
            return Insert(TableMail_GroupMailUsers, XMLCommand.GetXMLCommand()) == Completed;
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public bool DeleteGroupMailUsers(string Original_GID, string Original_UserId)
        {
            string Criteria = " GID = '" + Original_GID + "' AND UserId= '" + Original_UserId + "'";
            return Delete(TableMail_GroupMailUsers, Criteria) == Completed;
        }
    }
}
