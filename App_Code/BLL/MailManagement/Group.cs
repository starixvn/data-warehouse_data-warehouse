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
    public class Group : MailService
    {
        #region Select

        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetGroup()
        {
            return GetDataTable(TableMail_Group);
        }

        [ComponentModel.DataObjectMethodAttribute(ComponentModel.DataObjectMethodType.Select, false)]
        public DataTable GetGroupByName(string GName)
        {
            string Criteria = " GName LIKE '%" + GName + "%'";
            return GetDataTableByCriteria(TableMail_Group, Criteria);
        }

        #endregion

        #region Insert,Update,Delete

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public bool InsertGroup(string GName, string SCID, string Condition, string EmailBody, string EmailBodyData)
        {
            XMLCommand.Clear();
            XMLCommand.Add("GName", GName);
            XMLCommand.Add("SCID", SCID);
            XMLCommand.Add("Condition", Condition);
            XMLCommand.Add("EmailBody", EmailBody);
            XMLCommand.Add("EmailBodyData", EmailBodyData);
            XMLCommand.Add("SendStatus", "False");
            XMLCommand.Add("Creator", UserID);
            XMLCommand.Add("CreateDate", "getDate()");
            XMLCommand.Add("IPCreator", UserIP);
            return Insert(TableMail_Group, XMLCommand.GetXMLCommand()) == Completed;
        }


        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public bool UpdateGroup(string Original_GID, string GName, string SCID, string Condition,string EmailBody,string EmailBodyData)
        {
            XMLCommand.Clear();
            string Criteria = " GID = '" + Original_GID + "'";
            XMLCommand.Add("GName", GName);
            XMLCommand.Add("SCID", SCID);
            XMLCommand.Add("Condition", Condition);
            XMLCommand.Add("EmailBody", EmailBody);
            XMLCommand.Add("EmailBodyData", EmailBodyData);
            XMLCommand.Add("Editor", UserID);
            XMLCommand.Add("IPEditor", UserIP);
            return Update(TableMail_Group, Criteria, XMLCommand.GetXMLCommand()) == Completed;
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public bool DeleteGroup(string Original_GID)
        {
            string Criteria = " GID = '" + Original_GID + "'";
            return Delete(TableMail_Group, Criteria) == Completed;
        }

        #endregion
    }
}
