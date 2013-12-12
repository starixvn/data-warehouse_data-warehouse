<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="ProgramsInSiteMap.aspx.cs" Inherits="_ProgramsInSiteMap" Title="Programs In SiteMap Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
   
    <ajax:ScriptManager ID="ScriptManager1" runat="server" />
             <ajax:UpdatePanel ID="UpdatePanelUser" runat="server">
        <ContentTemplate>
    <table border="0" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td>
                <table border="0" cellpadding="3" cellspacing="0" width="98%" class="whitebgBorder">
                    <tr class="HeaderStyle" height="16">
                        <td colspan="2" align="left"><asp:Label ID="LabelTitle" runat="server" Text="Sitemap" ForeColor="White"></asp:Label></td>
                    </tr>
                    <tr align="left" class="RowStyle" height="30">
                        <td width="80"><asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label></td>
                        <td><asp:TextBox ID="TextBoxName" runat="server" Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr align="left" class="AlternatingRowStyle" height="30">
                        <td width="80"><asp:Label ID="LabelRoles" runat="server" Text="Roles"></asp:Label></td>
                        <td>
                            <asp:RadioButtonList ID="RadioListRoles" runat="server" DataSourceID="ODSRoles"
                                DataTextField="RoleName" DataValueField="RoleName" RepeatDirection="Horizontal" RepeatColumns="5">
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr align="left" class="RowStyle" height="30">
                        <td width="80"></td>
                        <td>
                            <asp:Button ID="ButtonInsertTabSiteMap" runat="server" Text="Insert Tab Sitemap" OnClick="ButtonInsertTabSiteMap_Click"/>
                            <asp:Button ID="ButtonInsertCancel" runat="server" Text="Cancel" OnClick="ButtonInsertCancel_Click" />
                       </td>
                    </tr>
                 </table>     
                <asp:ObjectDataSource ID="ODSRoles" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetRoles" TypeName="System.FrameWork.FWRoles"></asp:ObjectDataSource>
                <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
               <table border="0" cellpadding="4" cellspacing="0" width="98%">
                <tr>
                    <td width="48%" valign="top" style="height: 230px">
                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="90">
                                                <asp:Label ID="LabelProgramName" runat="server" Text="Program Name"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxProgram" runat="server" Width="94%"></asp:TextBox>
                                            </td>
                                            <td width="60" align="right"> 
                                                <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridViewProgram" runat="server" AutoGenerateColumns="False" DataKeyNames="ProgramId" DataSourceID="ODSProgramsNotInSitemap" PageSize="20" Width="100%" AllowPaging="True">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ProgramId" HeaderText="Program Id" />
                                            <asp:BoundField DataField="Name" HeaderText="Program Name">
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle HorizontalAlign="Left" />
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
                                                <asp:Label ID="LabelSitemaps" runat="server" Text="Sitemaps"></asp:Label> : 
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DDLSitemaps" runat="server" DataTextField="SiteName" DataValueField="ID" Width="98%" AutoPostBack="True" DataSourceID="ODSProgramSitemapTab">
                                                </asp:DropDownList>
                                            </td>
                                            <td align="right" width="35">
                                                <asp:ImageButton ID="ImageButtonRoles" runat="server" ImageUrl="~/BackOffice/include/images/user_in_role.gif" OnClick="ImageButtonRoles_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridViewProgramsInSitemaps" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ODSProgramSitemap" Width="100%" PageSize="20" AllowPaging="True" OnRowCommand="GridViewProgramsInSitemaps_RowCommand">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxSite" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <HeaderStyle Width="25px" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButtonRole" runat="server" CausesValidation="False" CommandName="Roles"
                                                        ImageUrl="~/BackOffice/include/images/user_in_role.gif" Text="Roles" CommandArgument='<%# Container.DataItemIndex %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ID" HeaderText="Site Id" />
                                            <asp:BoundField DataField="ProgramId" HeaderText="Program Id" />
                                            <asp:BoundField DataField="ProgramName" HeaderText="Program Name" />
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
                <asp:ObjectDataSource ID="ODSProgramSitemapTab" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetProgramSitemapTab" TypeName="System.FrameWork.FWSiteMap"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSProgramSitemap" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetProgramSitemap" TypeName="System.FrameWork.FWSiteMap">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSitemaps" Name="ParentId" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODSProgramsNotInSitemap" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetProgramsNotInSitemap" TypeName="System.FrameWork.FWPrograms">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSitemaps" Name="ParentId" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="TextBoxProgram" Name="ProgramName" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>

    <asp:Panel ID="ModalPanelRoles" runat="server" CssClass="modalPopup" Style="display: none" Width="450">
        <center>    
            <table border="0" cellpadding="0" cellspacing="0" width="98%">
                <tr>
                    <td height="100%" valign="top" class="program-content" align="center"> 
                        <br />      
                        <table border="0" cellpadding="0" cellspacing="0" width="98%">
                            <tr>
                                <td class="TableBgColor">
                                    <table border="0" cellpadding="4" cellspacing="1" width="100%">
                                        <tr class="HeaderStyle">
                                            <td colspan="2" align="left" height="14">
                                                <asp:Label ID="LabelRolesHeader" runat="server" Text="Update Roles"></asp:Label> 
                                            </td>
                                        </tr>
                                        <tr class="RowStyle">
                                            <td width="100" align="left">Site Id</td>
                                            <td align="left">
                                                <asp:TextBox ID="TextBoxUpdateSiteId" runat="server" ReadOnly="true" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="AlternatingRowStyle">
                                            <td width="100" align="left">Roles</td>
                                            <td align="left">
                                                <asp:RadioButtonList ID="RadioUpdateRoles" runat="server" DataSourceID="ODSRoles"
                                                    DataTextField="RoleName" DataValueField="RoleName" RepeatColumns="3" RepeatDirection="Horizontal">
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="left" class="CommandRowStyle">
                                                 <asp:Button ID="ButtonUpdateRoles" runat="server" Text="Update Roles" OnClick="ButtonUpdateRoles_Click"/>
                                                <asp:Button ID="ButtonCancelRoles" runat="server" Text="Cancel"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>           
                        <br />
                   </td>
                </tr>
            </table>
        </center>
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtenderRoles" runat="server" BackgroundCssClass="modalBackground"
          CancelControlID="ButtonCancelRoles" DropShadow="true" PopupControlID="ModalPanelRoles"
          TargetControlID="ButtonUpdateRoleTrigger">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Button ID="ButtonUpdateRoleTrigger" runat="server" Style="display: none" />
              </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>

