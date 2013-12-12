<%@ Page Title="Report Format" Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master"
    AutoEventWireup="true" CodeFile="ReportFormats.aspx.cs" Inherits="BackOffice_Admin_ReportFormats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function TypeValidation(typeObj) {
            var value = 'Subdivision';
            var combo = document.getElementById('<%=DDLFormatTypeName%>');
            if (typeObj.value == value) {
                combo.value = value;
                combo.disabled = true;
            }
            else {
                combo.disabled = false;
            }
            FormatTypeValidation(combo);
        }
        function FormatTypeValidation(fTypeObj) {
            var combo = document.getElementById('<%=DDLExcelColorsName%>');
            var span = document.getElementById('bordervalue');
            combo.style.display = 'none';
            span.style.display = 'none';

            if (fTypeObj.value == 'Border') {
                span.style.display = 'inline';
            }
            else if (fTypeObj.value == 'Color') {
                combo.style.display = 'inline';
            }
        }
    </script>
    
    <ajax:ScriptManager ID="ScriptManager1" runat="server" />
    <ajax:UpdatePanel ID="UpdatePanelReportFormat" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="center" valign="top">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
                            <tr>
                                <%--Form to insert data--%>
                                <td align="left">
                                    <table width="100%">
                                        <tr>
                                            <td align="left" width="100%">
                                                <script type="text/javascript">
                                                    function GetExcelColorIndex() {
                                                        var name = '<%=DDLExcelColorsName%>';
                                                        var combo = document.getElementById(name);
                                                        //combo.style.backgroundColor = combo[combo.selectedIndex].style.backgroundColor;
                                                        combo.style.color = combo[combo.selectedIndex].style.color;
                                                        document.getElementById('<%=TextBoxFormatValueName%>').value = combo[combo.selectedIndex].value;
                                                        return false;
                                                    }
                                                </script>
                                                <asp:DetailsView ID="DetailsViewFormat" runat="server" AutoGenerateInsertButton="True"
                                                    AutoGenerateRows="False" DefaultMode="Insert" Height="50px" Width="100%" HeaderText="Report Format"
                                                    DataSourceID="ODSReportFormats" DataKeyNames="RID,Type,Condition,FormatType">
                                                    <Fields>
                                                        <asp:TemplateField HeaderText="Report ID">
                                                            <InsertItemTemplate>
                                                                <asp:TextBox ID="TextBoxReportId" runat="server" Text='<%#Bind("RID")%>'></asp:TextBox>
                                                            </InsertItemTemplate>
                                                            <%--<ItemTemplate>
                                                                    <asp:Label ID="LabelReportId" runat="server" Text='<%#Bind("RID")%>'></asp:Label>
                                                                </ItemTemplate>--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Type">
                                                            <InsertItemTemplate>
                                                                <asp:DropDownList ID="DDLType" runat="server" SelectedValue='<%#Bind("Type")%>' Width="160px" onchange="TypeValidation(this);">
                                                                    <asp:ListItem Selected="True">Row</asp:ListItem>
                                                                    <asp:ListItem>Column</asp:ListItem>
                                                                    <asp:ListItem>Subdivision</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </InsertItemTemplate>
                                                            <%--<ItemTemplate>
                                                                    <asp:Label ID="LabelType" runat="server" Text='<%#Bind("Type")%>'></asp:Label>
                                                                </ItemTemplate>--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Condition">
                                                            <InsertItemTemplate>
                                                                <asp:TextBox ID="TextBoxCondition" runat="server" Text='<%#Bind("Condition")%>'>
                                                                </asp:TextBox>
                                                            </InsertItemTemplate>
                                                            <%--<ItemTemplate>
                                                                    <asp:Label ID="LabelCondition" runat="server" Text='<%#Bind("Condition")%>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Format type">
                                                            <InsertItemTemplate>
                                                                <asp:DropDownList ID="DDLFormatType" runat="server" SelectedValue='<%#Bind("FormatType")%>' onchange="FormatTypeValidation(this);">
                                                                    <asp:ListItem Selected="True">AutoFit</asp:ListItem>
                                                                    <asp:ListItem>Border</asp:ListItem>
                                                                    <asp:ListItem>Color</asp:ListItem>
                                                                    <asp:ListItem>NumberFormat</asp:ListItem>
                                                                    <asp:ListItem>Subdivision</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </InsertItemTemplate>
                                                            <%--<ItemTemplate>
                                                                    <asp:Label ID="LabelFormatType" runat="server"></asp:Label>
                                                                </ItemTemplate>--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Format value">
                                                            <InsertItemTemplate>
                                                                <asp:TextBox ID="TextBoxFormatValue" runat="server" Text='<%#Bind("FormatValue")%>'></asp:TextBox>&nbsp;
                                                                <asp:DropDownList ID="DDLExcelColors" runat="server" style="display:none">
                                                                </asp:DropDownList>
                                                                <span id="bordervalue" style="display:none">(Double | Solid)</span>
                                                            </InsertItemTemplate>
                                                            <%--<ItemTemplate>
                                                                    <asp:Label ID="LabelFormatValue" runat="server"></asp:Label>
                                                                </ItemTemplate>--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Enabled">
                                                            <InsertItemTemplate>
                                                                <asp:CheckBox ID="CheckBoxEnabled" runat="server" Checked='<%#Bind("Enabled")%>' />
                                                            </InsertItemTemplate>
                                                            <%--<ItemTemplate>
                                                                    <asp:CheckBox ID="CheckBoxItemEnabled" runat="server" Enabled="false" />
                                                                </ItemTemplate>--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Format exception">
                                                            <InsertItemTemplate>
                                                                <asp:TextBox ID="TextBoxFormatException" runat="server" Text='<%#Bind("FormatException")%>'></asp:TextBox>
                                                            </InsertItemTemplate>
                                                            <%--<ItemTemplate>
                                                                    <asp:Label ID="LabelFormatException" runat="server"></asp:Label>
                                                                </ItemTemplate>--%>
                                                        </asp:TemplateField>
                                                    </Fields>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:DetailsView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <%--Grid to show data--%>
                                <td align="left">
                                    <asp:GridView ID="GridViewFormats" runat="server" AutoGenerateColumns="False" DataSourceID="ODSReportFormats"
                                        PageSize="20" Width="100%" DataKeyNames="RID,Type,Condition,FormatType" AllowPaging="True">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                                                EditImageUrl="~/BackOffice/Include/images/editicon.gif" ShowEditButton="True"
                                                UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif" ValidationGroup="Update" />
                                            <asp:TemplateField HeaderText="Report ID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="LabelReportIDEdit" runat="server" Text='<%#Bind("RID")%>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelReportID" runat="server" Text='<%#Bind("RID")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Type">
                                                <EditItemTemplate>
                                                    <asp:Label ID="LabelTypeEdit" runat="server" Text='<%#Bind("Type")%>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelType" runat="server" Text='<%#Bind("Type")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Condition">
                                                <EditItemTemplate>
                                                    <asp:Label ID="LabelConditionEdit" runat="server" Text='<%#Bind("Condition")%>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelCondition" runat="server" Text='<%#Bind("Condition")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Format Type">
                                                <EditItemTemplate>
                                                    <asp:Label ID="LabelFormatTypeEdit" runat="server" Text='<%#Bind("FormatType")%>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelFormatType" runat="server" Text='<%#Bind("FormatType")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="FormatValue" HeaderText="Format Value" />
                                            <asp:BoundField DataField="FormatException" HeaderText="Format Exception" />
                                            <asp:CheckBoxField DataField="Enabled" HeaderText="Enabled" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <%--Form to edit data--%>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <asp:ObjectDataSource ID="ODSReportFormats" runat="server" InsertMethod="InsertReportFormat"
                            SelectMethod="GetReportFormat" TypeName="System.Control.ReportFormat" UpdateMethod="UpdateReportFormat">
                            <%--<asp:ObjectDataSource ID="ODSReportFormats" runat="server" InsertMethod="InsertReportFormat"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetReportFormat"
                            TypeName="System.Control.ReportFormat" UpdateMethod="UpdateReportFormat"> Root causes: original_{0} --%>
                            <UpdateParameters>
                                <asp:Parameter Name="RID" Type="String" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Condition" Type="String" />
                                <asp:Parameter Name="FormatType" Type="String" />
                                <asp:Parameter Name="FormatValue" Type="String" />
                                <asp:Parameter Name="FormatException" Type="String" />
                                <asp:Parameter Name="Enabled" Type="Boolean" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="RID" Type="String" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Condition" Type="String" />
                                <asp:Parameter Name="FormatType" Type="String" />
                                <asp:Parameter Name="FormatValue" Type="String" />
                                <asp:Parameter Name="FormatException" Type="String" />
                                <asp:Parameter Name="Enabled" Type="Boolean" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetExcelColors"
                            TypeName="System.Utility.Utilities"></asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>
