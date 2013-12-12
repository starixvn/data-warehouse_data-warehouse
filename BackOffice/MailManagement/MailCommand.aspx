<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="MailCommand.aspx.cs" Inherits="_MailCommand" Title="Command Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<ajax:ScriptManager ID="ScriptManager1" runat="server">
    </ajax:ScriptManager>
    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <table width="100%" align="left" cellpadding="1" cellspacing="1" border="0" >
            <tr class="HeaderStyle">
            <td  height="20" align="left"> 
            <b>Report</b>
            </td>
        </tr>
        <tr class="RowStyle">
            <td  height="20" align="left"> 
                <asp:DropDownList ID="DropDownListReport" runat="server" AutoPostBack="True" DataSourceID="ODSReport" DataTextField="RNAME" DataValueField="RID" Width="319px">
                </asp:DropDownList><asp:ObjectDataSource ID="ODSReport" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetReports" TypeName="System.Control.Reports"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr class="HeaderStyle">
            <td  height="20" align="left"> 
            <input type="hidden" id="PERIODCODE" name="PERIODCODE" value="1"/>
            <input type="hidden" value="query" name="getreport" />
            <%=DBSOURCE%>
            </td>
        </tr>
        <tr>
            <td class="RowStyle" height="20" align="left">
            <b>Definition</b> <%=DEFINITION%>
            </td>
        </tr>  
        <tr>
            <td class="AlternatingRowStyle" height="20" align="left">
            <b>Parameter</b> <%=PARAMETER%>
            </td>
        </tr>          
        <tr>
            <td align="left">
            <%=SB.ToString()%>
            </td>
        </tr>
        <tr class="HeaderStyle">
        <td height="20" align="left"> PERIOD</td>
        </tr>
        <tr class="AlternatingRowStyle">
        <td height="30" align="left">
        <%=STR.ToString()%>
        </td>
        </tr>
        <tr class="CommandRowStyle" height="25">
            <td align="left">
            <%--<input type="submit" value="Produce Report"  id="Button1" class="Button" />--%>
                <asp:Button ID="ButtonPreview" runat="server" OnClick="ButtonPreview_Click" Text="Preview" Width="70px" />
                <asp:Button ID="ButtonProduceReport" runat="server" OnClick="ButtonProduceReport_Click" Text="Insert" Width="70px" />
                    
                    </td>
        </tr>
        <tr>
            <td align="left">
             <%=RSB.ToString()%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridViewCtrl" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="CID" DataSourceID="ODSCommand"
                    PageSize="17" Width="100%">
                    <Columns>
                        <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                            EditImageUrl="~/BackOffice/Include/images/editicon.gif" ShowEditButton="True"
                            UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif" ValidationGroup="Update">
                            <HeaderStyle Width="70px" />
                        </asp:CommandField>
                        <asp:TemplateField HeaderText="Command">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxCommand" runat="server" Text='<%# Bind("Command") %>' Width="300px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelCommand" runat="server" Text='<%# Bind("Command") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Summary Command">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxSummaryCommand" runat="server" Text='<%# Bind("SummaryCommand") %>' Width="300px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelSummaryCommand" runat="server" Text='<%# Bind("SummaryCommand") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Detail">
                            <EditItemTemplate>
                                &nbsp;<asp:DropDownList ID="DropDownListDetail" runat="server" SelectedValue='<%# Bind("Detail") %>'
                                    Width="44px">
                                    <asp:ListItem Selected="True">ON</asp:ListItem>
                                    <asp:ListItem>OFF</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelDetail" runat="server" Text='<%# Bind("Detail") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Period">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListPeriod" runat="server" SelectedValue='<%# Bind("Period") %>'
                                    Width="56px">
                                    <asp:ListItem Selected="True">Daily</asp:ListItem>
                                    <asp:ListItem>Weekly</asp:ListItem>
                                    <asp:ListItem>Monthly</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelPeriod" runat="server" Text='<%# Bind("Period") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="SendStatus" HeaderText="Send">
                            <HeaderStyle Width="50px" />
                        </asp:CheckBoxField>
                        <asp:CheckBoxField DataField="Status" HeaderText="Status">
                            <HeaderStyle Width="50px" />
                        </asp:CheckBoxField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSCommand" runat="server" InsertMethod="InsertMailCommand"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetMailCommand" TypeName="System.MailManagement.Command"
                    UpdateMethod="UpdateMailCommand">
                    <UpdateParameters>
                        <asp:Parameter Name="Original_CID" Type="String" />
                        <asp:Parameter Name="Command" Type="String" />
                        <asp:Parameter Name="SummaryCommand" Type="String" />
                        <asp:Parameter Name="Detail" Type="String" />
                        <asp:Parameter Name="Period" Type="String" />
                        <asp:Parameter Name="SendStatus" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListReport" Name="RID" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RID" Type="String" />
                        <asp:Parameter Name="Command" Type="String" />
                        <asp:Parameter Name="SummaryCommand" Type="String" />
                        <asp:Parameter Name="Detail" Type="String" />
                        <asp:Parameter Name="Period" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
   
    </table>
            </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

