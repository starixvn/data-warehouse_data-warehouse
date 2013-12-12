<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="Priority.aspx.cs" Inherits="_Priority" Title="Priority Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <ajax:ScriptManager ID="ScriptManager1" runat="server" />
        <ajax:UpdatePanel ID="UpdatePanelUser" runat="server">
        <ContentTemplate>
 <table border="0" width="100%">
        <tr>
            <td align ="left">
                <br />
                &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Search by Name"></asp:Label>
                <asp:DropDownList ID="DropDownListUserName" runat="server" DataSourceID="ObjectDataSourceUserName"
                    DataTextField="UserName" DataValueField="UserID" Width="169px" AutoPostBack="True">
                </asp:DropDownList>
                <br />
                <br />
                <asp:GridView ID="GridViewCtrl" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSourcePriority"
                    Width="100%" OnRowCommand="GridViewCtrl_RowCommand" DataKeyNames="UserId,ProgramId" PageSize="100">
                    <Columns>
                        <asp:TemplateField HeaderText="User">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName" runat="server" Text='<%# Bind("Username") %>'></asp:Label>&nbsp;
                            </ItemTemplate>
                            <HeaderStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Program">
                            <ItemTemplate>
                                <asp:Label ID="LabelProgram" runat="server" Text='<%# Bind("ProgramId") %>'></asp:Label>&nbsp;
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Search">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxSearch" runat="server" Checked='<%# Bind("SearchStatus") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Insert">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxInsert" runat="server" Checked='<%# Bind("InsertStatus") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxUpdate" runat="server" Checked='<%# Bind("UpdateStatus") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxDelete" runat="server" Checked='<%# Bind("DeleteStatus") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Editor" HeaderText="Editor" />
                        <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="ButtonSubmit" runat="server" CommandName="Select" Text="Submit" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSourcePriority" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetPrioritybyDDLUser" TypeName="System.FrameWork.FWPriority">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListUserName" Name="UserId" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSourceUserName" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetUserInPriority" TypeName="System.FrameWork.FWPriority"></asp:ObjectDataSource>
        </td>
        </tr>
 </table> 
 </ContentTemplate>
 </ajax:UpdatePanel>
</asp:Content>

