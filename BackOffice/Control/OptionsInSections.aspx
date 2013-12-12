<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="OptionsInSections.aspx.cs" Inherits="_OptionsInSections" Title="Options In Sections Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
 <ajax:ScriptManager ID="ScriptManager1" runat="server" />
    <ajax:UpdatePanel ID="UpdatePanelUser" runat="server">
        <ContentTemplate>
    <table border="0" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td>
               <table border="0" cellpadding="4" cellspacing="0" width="98%">
                <tr>
                    <td width="48%" valign="top">
                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="90">
                                                <asp:Label ID="LabelOptionName" runat="server" Text="Options Name"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxOptions" runat="server" Width="94%"></asp:TextBox>
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
                                    <asp:GridView ID="GridViewOptions" runat="server" AutoGenerateColumns="False" DataKeyNames="OID" DataSourceID="ODSOptionsNotInSections" PageSize="25" Width="100%" AllowPaging="True">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Options Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelOName" runat="server" Text='<%# Bind("OName") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenFieldOID" runat="server" Value='<%# Bind("OID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="OValue" HeaderText="Options Value">
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
                                                <asp:Label ID="LabelSections" runat="server" Text="Sections"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DDLSections" runat="server" DataTextField="SNAME" DataValueField="SID" Width="98%" AutoPostBack="True" DataSourceID="ODSSections">
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
                                    <asp:GridView ID="GridViewOptionsInSections" runat="server" AutoGenerateColumns="False" DataKeyNames="SID,OID" DataSourceID="ODSOptionsInSections" Width="100%" PageSize="25" AllowPaging="True" OnRowCommand="GridViewOptionsInSections_RowCommand">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Options Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelOName" runat="server" Text='<%# Bind("OName") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenFieldOID" runat="server" Value='<%# Bind("OID") %>' />
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
                <asp:ObjectDataSource ID="ODSOptionsInSections" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetOptionsInSectionsBySID" TypeName="System.Control.OptionsInSections">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSections" Name="Original_SID" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSSections" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetSections" TypeName="System.Control.Sections">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSOptionsNotInSections" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetOptionsNotInSections" TypeName="System.Control.OptionsInSections">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSections" Name="Original_SID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="TextBoxOptions" Name="OName" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
              </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

