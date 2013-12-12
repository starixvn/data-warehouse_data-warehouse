<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="Permission.aspx.cs" Inherits="_Permission" Title="Permission Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
  <ajax:ScriptManager ID="ScriptManager1" runat="server"></ajax:ScriptManager>
  <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table border="0" cellpadding="15" cellspacing="0" width="100%">
                <tr>
                    <td align="left" valign="top">
                    <table align="center" border="0" cellpadding="0" cellspacing="2" 
                        width="100%">
                            <tr>
                            <td align="left">
                                    <table border="1" cellpadding="3" cellspacing="0" width="100%" height="100%" bordercolor="#cccccc">
                                     <tr class="HeaderStyle" height="16">
                                       <td align="center">
                                         <asp:Label ID="LabelTitle" runat="server" Text="Permission" ForeColor="#2A3C4B" Font-Bold="True"></asp:Label></td>         
                                     </tr>
                                     <tr>
                                       <td>
                                         <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                           <tr>
                                             <td valign="top" width="150">
                                               <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                                 <tr>
                                                   <td><asp:Label ID="LabelPath" runat="server" Text="Path : "></asp:Label></td>
                                                 </tr>
                                                 <tr>
                                                   <td>
                                                       <asp:DropDownList ID="DDLProgramsPath" runat="server" Width="150px" DataSourceID="ODSProgramsPath" DataTextField="PathName" DataValueField="Path" AutoPostBack="True">
                                                       </asp:DropDownList></td>
                                                 </tr>
                                               </table>
                                             </td>
                                             <td valign="top" width="360">
                                               <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                                 <tr>
                                                   <td colspan="2"><asp:Label ID="LabelRule" runat="server" Text="Rule Applies To : "></asp:Label></td>
                                                 </tr>
                                                 <tr>
                                                   <td width="160"><asp:RadioButton ID="RBRole" runat="server" GroupName="Rule" Text="Role" Checked="True" /></td>
                                                   <td >
                                                       <asp:DropDownList ID="DropDownListRole" runat="server" DataSourceID="ODSRoles" DataTextField="RoleName" DataValueField="RoleName"></asp:DropDownList>
                                                   </td>
                                                 </tr>
                                                 <tr>
                                                   <td><asp:RadioButton ID="RBUser" runat="server" GroupName="Rule" Text="User"/></td>
                                                   <td><asp:TextBox ID="TextBoxUser" runat="server" Width="200px"></asp:TextBox></td>
                                                 </tr>
                                                 <tr>
                                                   <td><asp:RadioButton ID="RBAllUsers" runat="server" GroupName="Rule" Text="All Users."/></td>
                                                   <td></td>
                                                 </tr>
                                                 <tr>
                                                   <td><asp:RadioButton ID="RBAnoymousUsers" runat="server" GroupName="Rule" Text="Anoymous Users."/></td>
                                                   <td></td>
                                                 </tr>
                                               </table>
                                             </td>
                                             <td valign="top" width="200">
                                               <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                                 <tr>
                                                   <td><asp:Label ID="LabelPermission" runat="server" Text="Permission"></asp:Label></td>
                                                 </tr>
                                                 <tr>
                                                   <td><asp:RadioButton ID="RBAllow" Text="Allow" runat="server" GroupName="Permission" Checked="True" /></td>                     
                                                 </tr>
                                                 <tr>
                                                   <td><asp:RadioButton ID="RBDeny" Text="Deny" runat="server" GroupName="Permission"/></td>
                                                 </tr>
                                               </table>
                                             </td>
                                           </tr>
                                           <tr>
                                             <td><asp:Button ID="ButtonAdd" runat="server" Text="Add Permisson" OnClick="ButtonAdd_Click"/></td>               
                                           </tr>
                                         </table>
                                       </td>
                                     </tr>
                                    </table>
                                    <br />
                             </td>
                            </tr>
                             <tr>
                                <td align="center">
                                  <br />   
                                     <asp:GridView ID="GridViewPermission" Width="100%" runat="server" DataSourceID="ODSPermission" OnRowCommand="GridViewPermission_RowCommand">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/BackOffice/include/images/deleteicon.gif" />
        </Columns>
    </asp:GridView>
                                <br />
                            </td>
                            </tr>                                                      
                        </table>
                    </td>
                </tr>
            </table>
    </ContentTemplate>
  </ajax:UpdatePanel>       
    <asp:ObjectDataSource ID="ODSRoles" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetRoles" TypeName="System.FrameWork.FWRoles"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ODSProgramsPath" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProgramsPath" TypeName="System.FrameWork.FWProgramsPath"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ODSPermission" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetPermission" TypeName="System.FrameWork.FWPermission">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLProgramsPath" Name="Path" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

