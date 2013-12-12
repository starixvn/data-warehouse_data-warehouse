<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="Group.aspx.cs" Inherits="_Group" Title="Group Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<ajax:ScriptManager ID="ScriptManager1" runat="server">
    </ajax:ScriptManager>
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="left" valign="top">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
                            <tr>
                                <td align="center" height="20">
                                    <asp:DetailsView ID="DetailsViewCtrl" runat="server" AutoGenerateRows="False" DefaultMode="Insert"
                                        HeaderText="Group" Height="50px" Width="98%" DataSourceID="ODSCtrl">
                                        <Fields>
                                            <asp:TemplateField HeaderText="Name">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxGName" runat="server" Text='<%# Bind("GName") %>' Width="200px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredOName" runat="server" ControlToValidate="TextBoxGName"
                                                        Display="Dynamic" ErrorMessage="Group Name is empty." ValidationGroup="Insert" />
                                                </InsertItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Schedules">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="DropDownListSchedules" runat="server" DataSourceID="ODSSchedules" DataTextField="ScheduleName"
                                                        DataValueField="SCID" SelectedValue='<%# Bind("SCID") %>' Width="90px">
                                                    </asp:DropDownList><asp:ObjectDataSource ID="ODSSchedules" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetSchedules" TypeName="System.MailManagement.Schedules"></asp:ObjectDataSource>
                                                </InsertItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Condition">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxCondition" runat="server" Text='<%# Bind("Condition") %>' Width="200px"></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Body">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxEmailBody" runat="server" Text='<%# Bind("EmailBody") %>' Width="200px"></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Body Data">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxEmailBodyData" runat="server" Text='<%# Bind("EmailBodyData") %>' Width="200px"></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
                                        </Fields>
                                    </asp:DetailsView>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Name :
                                    <asp:TextBox ID="TxKeyword" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1"
                                        runat="server" Text="Search" /></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <br />
                                    <asp:GridView ID="GridViewCtrl" runat="server" AutoGenerateColumns="False" DataKeyNames="GID"
                                        PageSize="17" Width="98%" DataSourceID="ODSCtrl" AllowPaging="True" OnRowCreated="GridViewCtrl_RowCreated">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                                                EditImageUrl="~/BackOffice/Include/images/editicon.gif" ShowEditButton="True"
                                                UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif" ValidationGroup="Update">
                                                <HeaderStyle Width="70px" />
                                            </asp:CommandField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageBtnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                        ImageUrl="~/BackOffice/include/images/deleteicon.gif" Text="Delete" />
                                                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmDelete" runat="server" ConfirmText="Are you sure want to delete?"
                                                        TargetControlID="ImageBtnDelete">
                                                    </ajaxToolkit:ConfirmButtonExtender>
                                                </ItemTemplate>
                                                <HeaderStyle Width="70px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxGName" runat="server" Text='<%# Bind("GName") %>' Width="160px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelGName" runat="server" Text='<%# Bind("GName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Schedules">
                                                <EditItemTemplate><asp:DropDownList ID="DropDownListSchedules" runat="server" DataSourceID="ODSSchedules" DataTextField="ScheduleName"
                                                        DataValueField="SCID" SelectedValue='<%# Bind("SCID") %>' Width="90px">
                                                </asp:DropDownList><asp:ObjectDataSource ID="ODSSchedules" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetSchedules" TypeName="System.MailManagement.Schedules"></asp:ObjectDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate><asp:DropDownList ID="DropDownListSchedules" runat="server" DataSourceID="ODSSchedules" DataTextField="ScheduleName"
                                                        DataValueField="SCID" SelectedValue='<%# Bind("SCID") %>' Width="90px" Enabled="False">
                                                </asp:DropDownList><asp:ObjectDataSource ID="ODSSchedules" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetSchedules" TypeName="System.MailManagement.Schedules"></asp:ObjectDataSource>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Condition">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxCondition" runat="server" Text='<%# Bind("Condition") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelCondition" runat="server" Text='<%# Bind("Condition") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Body">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxEmailBody" runat="server" Text='<%# Bind("EmailBody") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelEmailBody" runat="server" Text='<%# Bind("EmailBody") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Data">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxEmailBodyData" runat="server" Text='<%# Bind("EmailBodyData") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelEmailBodyData" runat="server" Text='<%# Bind("EmailBodyData") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="150px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerSettings Position="Top" />
                                        <PagerTemplate>
                                            <table align="right" border="0" cellpadding="3" cellspacing="0">
                                                <tr align="center">
                                                    <td nowrap="nowrap" valign="middle">
                                                        <asp:ImageButton ID="btFirst" runat="server" CommandArgument="First" CommandName="page"
                                                            ImageUrl="../Include/images/pagenav_first.gif" meta:resourcekey="btFirstResource1" /></td>
                                                    <td nowrap="nowrap" valign="middle">
                                                        <asp:ImageButton ID="btPrevious" runat="server" CommandArgument="Prev" CommandName="page"
                                                            ImageUrl="../Include/images/pagenav_previous.gif" meta:resourcekey="btPreviousResource1" /></td>
                                                    <td nowrap="nowrap" valign="middle">
                                                        Page
                                                        <asp:Label ID="pageCurrent" runat="server" meta:resourcekey="pageCurrentResource1"></asp:Label></td>
                                                    <td nowrap="nowrap" valign="middle">
                                                        <asp:ImageButton ID="btNext" runat="server" CommandArgument="Next" CommandName="page"
                                                            ImageUrl="../Include/images/pagenav_next.gif" meta:resourcekey="btNextResource1" /></td>
                                                    <td nowrap="nowrap" valign="middle">
                                                        <asp:ImageButton ID="btLast" runat="server" CommandArgument="Last" CommandName="page"
                                                            ImageUrl="../Include/images/pagenav_lastpage.gif" meta:resourcekey="btLastResource1" /></td>
                                                    <td width="5%">
                                                    </td>
                                                    <td nowrap="nowrap" valign="middle">
                                                        Page Size
                                                        <asp:TextBox ID="txtPageSize" runat="server" CssClass="Textboxsm" meta:resourcekey="txtPageSizeResource1"
                                                            onKeypress="if ((event.keyCode < 45 )||(event.keyCode > 57)||(event.keyCode>32&&event.keyCode<48)||(event.keyCode>57&&event.keyCode<65)||(event.keyCode>90&&event.keyCode<97)||(event.keyCode>122 && event.keyCode<127)) event.returnValue = false;"
                                                            Width="20px"></asp:TextBox></td>
                                                    <td nowrap="nowrap" valign="middle">
                                                        <asp:ImageButton ID="btPagesize" runat="server" ImageUrl="../Include/images/threadexpand.gif"
                                                            meta:resourcekey="btPagesizeResource1" /></td>
                                                    <td width="5%">
                                                    </td>
                                                    <td valign="middle">
                                                        Page
                                                        <asp:TextBox ID="txPageIndex" runat="server" CssClass="Textboxsm" meta:resourcekey="txPageIndexResource1"
                                                            onKeypress="if ((event.keyCode < 45 )||(event.keyCode > 57)||(event.keyCode>32&&event.keyCode<48)||(event.keyCode>57&&event.keyCode<65)||(event.keyCode>90&&event.keyCode<97)||(event.keyCode>122 && event.keyCode<127)) event.returnValue = false;"
                                                            Width="25px"></asp:TextBox>
                                                        of
                                                        <asp:Label ID="pageShow" runat="server" meta:resourcekey="pageShowResource1"></asp:Label></td>
                                                    <td valign="middle">
                                                        <asp:ImageButton ID="btPageIndex" runat="server" ImageUrl="../Include/images/threadexpand.gif"
                                                            meta:resourcekey="btPageIndexResource1" /></td>
                                                </tr>
                                            </table>
                                        </PagerTemplate>
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="ODSCtrl" runat="server" DeleteMethod="DeleteGroup" InsertMethod="InsertGroup"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetGroupByName" TypeName="System.MailManagement.Group"
                                        UpdateMethod="UpdateGroup">
                                        <InsertParameters>
                                            <asp:Parameter Name="GName" Type="String" />
                                            <asp:Parameter Name="SCID" Type="String" />
                                            <asp:Parameter Name="Condition" Type="String" />
                                            <asp:Parameter Name="EmailBody" Type="String" />
                                            <asp:Parameter Name="EmailBodyData" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Original_GID" Type="String" />
                                            <asp:Parameter Name="GName" Type="String" />
                                            <asp:Parameter Name="SCID" Type="String" />
                                            <asp:Parameter Name="Condition" Type="String" />
                                            <asp:Parameter Name="EmailBody" Type="String" />
                                            <asp:Parameter Name="EmailBodyData" Type="String" />
                                        </UpdateParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_GID" Type="String" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TxKeyword" Name="GName" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

