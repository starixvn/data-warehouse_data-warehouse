<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="MailLogs.aspx.cs" Inherits="_MailLogs" Title="Mail Logs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<ajax:ScriptManager ID="ScriptManager1" runat="server">
    </ajax:ScriptManager>
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<%--                <ajax:Timer ID="TimerLoad" runat="server" Interval="5000" OnTick="TimerLoad_Tick">
        </ajax:Timer>--%>
            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="left" valign="top">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
                            <tr>
                                <td align="left">
                                    Date :
                                    <asp:TextBox ID="TextBoxDate" runat="server" CssClass="formStyle" Width="96px"></asp:TextBox>
                                    &nbsp;<asp:Button ID="ButtonSearch"
                                        runat="server" Text="Search" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <br />
                                    <asp:GridView ID="GridViewCtrl" runat="server" AutoGenerateColumns="False" AllowPaging="false" DataSourceID="ODSCtrl" Width="98%">
                                        <Columns>
                                            <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" HeaderText="Date"
                                                HtmlEncode="False">
                                                <HeaderStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Type" HeaderText="Type">
                                                <HeaderStyle Width="120px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Message" HeaderText="Message" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="ODSCtrl" runat="server"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMailLogs" TypeName="System.MailManagement.MailLogs">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TextBoxDate" Name="date" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

