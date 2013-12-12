<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="SectionsInReports.aspx.cs" Inherits="_SectionsInReports" Title="Sections In Reports Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<ajax:ScriptManager ID="ScriptManager1" runat="server" />             
<ajax:UpdatePanel ID="UpdatePanelUser" runat="server">
        <ContentTemplate>
    <table border="0" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td>
               <table border="0" cellpadding="4" cellspacing="0" width="98%">
                <tr>
                    <td width="48%" valign="top" >
                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="90">
                                                <asp:Label ID="LabelSections" runat="server" Text="Sections Name"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxSections" runat="server" Width="94%"></asp:TextBox>
                                            </td>
                                            <td width="60" align="right"> 
                                                <asp:Button ID="ButtonSearch" runat="server" Text="Search" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridViewSections" runat="server" AutoGenerateColumns="False" DataKeyNames="SID" DataSourceID="ODSSectionsNotInReports" PageSize="25" Width="100%" AllowPaging="True">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sections Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelSName" runat="server" Text='<%# Bind("SName") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenFieldSID" runat="server" Value='<%# Bind("SID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SValue" HeaderText="Sections Value">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="4%" align="center" style="height: 230px">
                        <asp:ImageButton ID="ImageButtonMoveLeft" runat="server" ImageUrl="~/BackOffice/include/images/moveleft.gif" OnClick="ImageButtonMoveLeft_Click"/><br /><br />
                        <asp:ImageButton ID="ImageButtonMoveRight" runat="server" ImageUrl="~/BackOffice/include/images/moveright.gif" OnClick="ImageButtonMoveRight_Click"/>
                    </td>
                    <td width="48%" valign="top" style="height: 230px">
                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="70">
                                                <asp:Label ID="LabelReports" runat="server" Text="Reports"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DDLReports" runat="server" DataTextField="RNAME" DataValueField="RID" Width="98%" AutoPostBack="True" DataSourceID="ODSReports">
                                                </asp:DropDownList>
                                            </td>
                                            <td align="right" width="35">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridViewSectionsInReports" runat="server" AutoGenerateColumns="False" DataKeyNames="RID,SID" DataSourceID="ODSSectionsInReports" Width="100%" PageSize="25" AllowPaging="True" OnRowCommand="GridViewSectionsInReports_RowCommand">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sections Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelOName" runat="server" Text='<%# Bind("SName") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenFieldRID" runat="server" Value='<%# Bind("RID") %>' />
                                                    <asp:HiddenField ID="HiddenFieldSID" runat="server" Value='<%# Bind("SID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Seq" HeaderText="Seq" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButtonUP" runat="server"  CausesValidation="False" ImageUrl="~/BackOffice/include/images/up.gif"  CommandName="UP" CommandArgument='<%# Container.DataItemIndex %>'/>
                                                    <asp:ImageButton ID="ImageButtonDown" runat="server" CausesValidation="False" ImageUrl="~/BackOffice/include/images/down.gif" CommandName="DOWN" CommandArgument='<%# Container.DataItemIndex %>'/>
                                                </ItemTemplate>
                                                <HeaderStyle Width="35px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
               </table>
                <asp:ObjectDataSource ID="ODSSectionsInReports" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetSectionsInReportsByRID" TypeName="System.Control.SectionsInReports">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLReports" Name="Original_RID" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSReports" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetReports" TypeName="System.Control.Reports">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSSectionsNotInReports" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetSectionsNotInReports" TypeName="System.Control.SectionsInReports">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLReports" Name="Original_RID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="TextBoxSections" Name="SName" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
              </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

