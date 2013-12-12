<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="MonitorMailLogs.aspx.cs" Inherits="_MonitorMailLogs" Title="Monitor Logs Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<ajax:ScriptManager ID="ScriptManager1" runat="server">
    </ajax:ScriptManager>
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            &nbsp;<ajax:Timer ID="TimerLoad" runat="server" Interval="5000" OnTick="TimerLoad_Tick">
        </ajax:Timer>
            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="left" valign="top">
                        <asp:Button ID="ButtonClear" runat="server" OnClick="ButtonClear_Click" Text="Clear"
                            Width="97px" />
                            <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtenderClear" runat="server" ConfirmText="Are you sure delete?" TargetControlID="ButtonClear" />
                            </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
<%--                            <tr>
                                <td align="right">
                                <ajax:UpdateProgress ID="UpdateProgressLoading" runat="server">
                                    <ProgressTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/BackOffice/include/images/loading.gif" />
                                    </ProgressTemplate>
                                </ajax:UpdateProgress>
                                </td>
                            </tr>--%>
                            <tr>
                                <td align="center">
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
                                    <asp:HiddenField ID="HiddenFieldDate" runat="server" />
                                    <asp:ObjectDataSource ID="ODSCtrl" runat="server"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMailLogs" TypeName="System.MailManagement.MailLogs">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldDate" Name="date" PropertyName="Value" Type="String" />
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

