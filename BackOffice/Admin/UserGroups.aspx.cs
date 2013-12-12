using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Account;
using System.Data;

public partial class BackOffice_Admin_UserGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (DDLGroup.Items.Count == 0)
            {
                DDLGroup.DataBind();
            }
        }
    }

    protected void ImageButtonMoveLeft_Click(object sender, ImageClickEventArgs e)
    {
        int index = 0;
        string custIdList = string.Empty;
        int groupId = int.Parse(DDLGroup.SelectedValue);
        string pattern = "'{0}'";

        foreach (GridViewRow gridrow in GridViewUsersInGroup.Rows)
        {
            CheckBox CheckBoxUserInGroup = (CheckBox)gridrow.FindControl("CheckBoxUserInGroup");
            if (CheckBoxUserInGroup.Checked)
            {
                custIdList += "," + GridViewUsersInGroup.DataKeys[index].Value.ToString();
            }
            index++;
        }

        if (custIdList.Length > 0)
        {
            custIdList = custIdList.Substring(1);
            ACCustomers customer = new ACCustomers();
            if (customer.DeleteCustomerFromGroup(string.Format(pattern, custIdList), groupId))
            {
                GridViewUsers.DataBind();
                GridViewUsersInGroup.DataBind();
            }
        }
    }

    protected void ImageButtonMoveRight_Click(object sender, ImageClickEventArgs e)
    {
        int index = 0;
        int groupId = -1; 
        int subGroupId = 0; 

        if ((DDLGroup.Items.Count > 0) && (DDLGroup.SelectedIndex > -1))
        {
            groupId = int.Parse(DDLGroup.SelectedValue);
        }
        if ((DDLSubGroup.Items.Count > 0) && (DDLSubGroup.SelectedIndex > -1))
        {
            subGroupId = int.Parse(DDLSubGroup.SelectedValue);
        }
        if (groupId == -1)
        {
            return;
        }
        
        string custIdList = string.Empty;
        string pattern = "'{0}'";
        foreach (GridViewRow gridrow in GridViewUsers.Rows)
        {
            CheckBox CheckBoxUser = (CheckBox)gridrow.FindControl("CheckBoxUser");
            if (CheckBoxUser.Checked)
            {
                custIdList += "," + GridViewUsers.DataKeys[index].Value.ToString();
            }
            index++;
        }

        if (custIdList.Length > 0)
        {
            custIdList = custIdList.Substring(1);
            ACCustomers customer = new ACCustomers();
            if (customer.InsertCustomerToSubGroup(string.Format(pattern, custIdList), groupId, subGroupId))
            {
                GridViewUsers.DataBind();
                GridViewUsersInGroup.DataBind();
            }
        }
    }

    protected void ButtonInsertCancel_Click(object sender, EventArgs e)
    {
        TextBoxGroupName.Text = string.Empty;
        TextBoxGroupName.Focus();
        if (DDLGroupOfInsertForm.Items.Count > 0)
        {
            DDLGroupOfInsertForm.SelectedIndex = 0;
        }
        LabelErrorMessage.Text = string.Empty;
    }

    protected void ButtonInsertUserGroup_Click(object sender, EventArgs e)
    {
        string name = TextBoxGroupName.Text;
        int parentId = 0;
        if ((CheckBoxCreatingSubGroup.Checked) && (DDLGroupOfInsertForm.Items.Count > 0))
        {
            parentId = int.Parse(DDLGroupOfInsertForm.SelectedValue);
        }
        string description = string.Empty;
        int creator = 0;
        string createdDate = DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss");
        string message = string.Empty;
        ACGroups group = new ACGroups();
        group.InsertGroup(name, parentId, description, creator, createdDate, ref message);
        ButtonInsertCancel_Click(sender, e);
        LabelErrorMessage.Text = message;
        DDLGroupOfInsertForm.DataBind();
        DDLGroup.DataBind();
        DDLSubGroup.DataBind();
    }
    
    protected void ODSUsersInGroup_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        int groupId = 0; 
        int subGroupId = 0;

        if ((DDLGroup.Items.Count > 0) && (DDLGroup.SelectedIndex > -1))
        {
            groupId = int.Parse(DDLGroup.SelectedValue);
        }
        if ((DDLSubGroup.Items.Count > 0) && (DDLSubGroup.SelectedIndex > 0))
        {
            subGroupId = int.Parse(DDLSubGroup.SelectedValue);
        }

        if (groupId > -1 && subGroupId > 0)
        {
            groupId = subGroupId;
        }

        e.InputParameters["groupId"] = groupId;
        e.Arguments.StartRowIndex = GridViewUsersInGroup.PageIndex;
    }
    
    protected void ODSUsers_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.Arguments.StartRowIndex = GridViewUsers.PageIndex;
    }
}
