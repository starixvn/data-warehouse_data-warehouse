<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="_Reports" Title="Reports Page" %>
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
                                <td align="left">
                                    <asp:DetailsView ID="DetailsViewReports" runat="server" AutoGenerateInsertButton="True"
                                        AutoGenerateRows="False" DataSourceID="ODSCtrl" DefaultMode="Insert" HeaderText="Reports"
                                        Height="50px" Width="100%">
                                        <Fields>
                                            <asp:TemplateField HeaderText="Program ID">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxID" runat="server" Text='<%# Bind("ProgramId") %>' ></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxRName" runat="server" Text='<%# Bind("RName") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Command">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxCommand" runat="server" Text='<%# Bind("Command") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IsSummary">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="DropDownListIsSummary" runat="server" Width="41px" SelectedValue='<%# Bind("IsSummary") %>'>
                                                        <asp:ListItem>ON</asp:ListItem>
                                                        <asp:ListItem>OFF</asp:ListItem>
                                                    </asp:DropDownList>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DataTableName">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxDataTableName" runat="server" Text='<%# Bind("DataTableName") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DataKeyName">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxDataKeyName" runat="server" Text='<%# Bind("DataKeyName") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DataDisplayName">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxDataDisplayName" runat="server" Text='<%# Bind("DataDisplayName") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="DropDownListStatus" runat="server" Width="41px" SelectedValue='<%# Bind("Status") %>'>
                                                        <asp:ListItem>ON</asp:ListItem>
                                                        <asp:ListItem>OFF</asp:ListItem>
                                                        <asp:ListItem>SDATE</asp:ListItem>
                                                    </asp:DropDownList>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ColumnCount">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxColumnCount" runat="server" Text='<%# Bind("ColumnCount") %>' Width="20px"></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Definition">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxDefinition" runat="server" Text='<%# Bind("Definition") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Parameter">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxParameter" runat="server" Text='<%# Bind("Parameter") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DBSource">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxDBSource" runat="server" Text='<%# Bind("DBSource") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:DetailsView>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="GridViewReports" runat="server" AutoGenerateColumns="False"
                                        DataSourceID="ODSCtrl" OnRowCreated="GridViewReports_RowCreated"
                                        Width="100%" DataKeyNames="RID" AllowPaging="True">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                                                EditImageUrl="~/BackOffice/Include/images/editicon.gif" ShowEditButton="True"
                                                UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif" />
                                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/BackOffice/include/images/deleteicon.gif"
                                                ShowDeleteButton="True" />
                                            <asp:TemplateField HeaderText="RName">
                                                <EditItemTemplate>
                                                <asp:TextBox ID="TextBoxRName" runat="server" Text='<%# Bind("RName") %>' Width="99px"></asp:TextBox>
                                                   
                                                </EditItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                     <asp:Label ID="LabelRName" runat="server" Text='<%# Bind("RName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Command">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxCommand" runat="server" Text='<%# Bind("Command") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelCommand" runat="server" Text='<%# Bind("Command") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IsSummary">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownListIsSummary" runat="server" Width="40px" SelectedValue='<%# Bind("IsSummary") %>'>
                                                        <asp:ListItem>ON</asp:ListItem>
                                                        <asp:ListItem>OFF</asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelIsSummary" runat="server" Text='<%# Bind("IsSummary") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DataTableName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxDataTableName" runat="server" Text='<%# Bind("DataTableName") %>' Width="99px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDataTableName" runat="server" Text='<%# Bind("DataTableName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DataKeyName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxDataKeyName" runat="server" Text='<%# Bind("DataKeyName") %>' Width="99px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDataKeyName" runat="server" Text='<%# Bind("DataKeyName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DataDisplayName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxDataDisplayName" runat="server" Text='<%# Bind("DataDisplayName") %>' Width="99px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDataDisplayName" runat="server" Text='<%# Bind("DataDisplayName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ColumnCount">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxColumnCount" runat="server" Text='<%# Bind("ColumnCount") %>' Width="20px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelColumnCount" runat="server" Text='<%# Bind("ColumnCount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Definition">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxDefinition" runat="server" Text='<%# Bind("Definition") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDefinition" runat="server" Text='<%# Bind("Definition") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Parameter">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxParameter" runat="server" Text='<%# Bind("Parameter") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelParameter" runat="server" Text='<%# Bind("Parameter") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DBSource">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxDBSource" runat="server" Text='<%# Bind("DBSource") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDBSource" runat="server" Text='<%# Bind("DBSource") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Enable">
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxEnable" runat="server" Checked='<%# Bind("Enable") %>' />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxEnable" runat="server" Checked='<%# Bind("Enable") %>'
                                                        Enabled="False" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelStatus" runat="server" Text='<%# Bind("RStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownListStatus" runat="server" Width="40px" SelectedValue='<%# Bind("RStatus") %>'>
                                                        <asp:ListItem>ON</asp:ListItem>
                                                        <asp:ListItem>OFF</asp:ListItem>
                                                        <asp:ListItem>SDATE</asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IsSubTotal">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSubTotal" runat="server" Checked='<%# Bind("SubTotal") %>'
                                                        Enabled="False" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSubTotal" runat="server" Checked='<%# Bind("SubTotal") %>' />
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            
                                            
                                            <asp:TemplateField HeaderText="IsOnePerSheet">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxOnePerSheet" runat="server" Checked='<%# Bind("SeparatedSheet") %>'
                                                        Enabled="False" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxOnePerSheet" runat="server" Checked='<%# Bind("SeparatedSheet") %>' />
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            
                                            
                                            <asp:TemplateField HeaderText="HasChart">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxChart" runat="server" Checked='<%# Bind("HasChart") %>'
                                                        Enabled="False" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxChart" runat="server" Checked='<%# Bind("HasChart") %>' />
                                                </EditItemTemplate>
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
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="ODSCtrl" runat="server" InsertMethod="InsertReports"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetReports" TypeName="System.Control.Reports" UpdateMethod="UpdateReports">
                                        <InsertParameters>
                                            <asp:Parameter Name="ProgramId" Type="String" />
                                            <asp:Parameter Name="RName" Type="String" />
                                            <asp:Parameter Name="Command" Type="String" />
                                            <asp:Parameter Name="IsSummary" Type="String" />
                                            <asp:Parameter Name="DataTableName" Type="String" />
                                            <asp:Parameter Name="DataKeyName" Type="String" />
                                            <asp:Parameter Name="DataDisplayName" Type="String" />
                                            <asp:Parameter Name="Status" Type="String" />
                                            <asp:Parameter Name="ColumnCount" Type="String" />
                                            <asp:Parameter Name="Definition" Type="String" />
                                            <asp:Parameter Name="Parameter" Type="String" />
                                            <asp:Parameter Name="DBSource" Type="String" />
                                        </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RID" Type="String" />
                    <asp:Parameter Name="RName" Type="String" />
                    <asp:Parameter Name="Command" Type="String" />
                    <asp:Parameter Name="IsSummary" Type="String" />
                    <asp:Parameter Name="DataTableName" Type="String" />
                    <asp:Parameter Name="DataKeyName" Type="String" />
                    <asp:Parameter Name="DataDisplayName" Type="String" />
                    <asp:Parameter Name="RStatus" Type="String" />
                    <asp:Parameter Name="ColumnCount" Type="String" />
                    <asp:Parameter Name="Definition" Type="String" />
                    <asp:Parameter Name="Parameter" Type="String" />
                    <asp:Parameter Name="DBSource" Type="String" />
                    <asp:Parameter Name="Enable" Type="String" />
                    <asp:Parameter Name="SubTotal" Type="String" />
                    <asp:Parameter Name="SeparatedSheet" Type="String" />
                    <asp:Parameter Name="HasChart" Type="String" />
                </UpdateParameters>
              </asp:ObjectDataSource>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

