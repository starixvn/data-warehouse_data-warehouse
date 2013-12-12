<%@ Page Language="C#" MasterPageFile="~/BackOffice/MasterPage/MasterSingleCanvas.master"
    AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="_Users" Title="Users Page" %>    
<asp:Content ID="Users" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <ajax:ScriptManager ID="ScriptManager1" runat="server" />
        <ajax:UpdatePanel ID="UpdatePanelUser" runat="server">
        <ContentTemplate>
    <table border="0" cellpadding="15" cellspacing="0" width="100%">
        <tr>
            <td align="left" valign="top">
                <table align="center" border="0" cellpadding="0" cellspacing="2" width="100%">
                    <tr>
                        <td align="center">
                            <asp:DetailsView ID="DetailsViewCtrl" runat="server" AutoGenerateRows="False" DataSourceID="ODSCtrl"
                                DefaultMode="Insert" HeaderText="Users" Height="50px" Width="98%" 
                                oniteminserting="DetailsViewCtrl_ItemInserting">
                                <Fields>
                                    <asp:TemplateField HeaderText="First Name">
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBoxFirstName" runat="server" Text='<%# Bind("FirstName") %>' Width="160px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFirstName" runat="server" ControlToValidate="TextBoxFirstName"
                                                Display="Dynamic" ErrorMessage="First Name is empty." ValidationGroup="Insert" />
                                        </InsertItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name">
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBoxLastName" runat="server" Text='<%# Bind("LastName") %>' Width="160px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="TextBoxLastName"
                                                Display="Dynamic" ErrorMessage="Last Name is empty." ValidationGroup="Insert" />
                                        </InsertItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBoxUserName" runat="server" Text='<%# Bind("Username") %>' Width="160px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredUserName" runat="server" ControlToValidate="TextBoxUserName"
                                                Display="Dynamic" ErrorMessage="User Name is empty." ValidationGroup="Insert" />
                                        </InsertItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password">
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBoxPassword" runat="server" Text='<%# Bind("Password") %>' Width="160px"
                                                TextMode="Password"></asp:TextBox>
                                            &nbsp;
                                            <asp:Label ID="LabelConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>&nbsp;&nbsp;
                                            <asp:TextBox ID="TextBoxConfirmPassword" runat="server" Text='<%# Bind("Password") %>' TextMode="Password"
                                                Width="160px"></asp:TextBox>&nbsp;
                                            <asp:CompareValidator ID="ComparePassword" runat="server" ControlToCompare="TextBoxPassword"
                                                ControlToValidate="TextBoxConfirmPassword" Display="None" ErrorMessage="Password does not match."
                                                ValidationGroup="Insert"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" ControlToValidate="TextBoxPassword"
                                                Display="None" ErrorMessage="Password is empty." ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredConfirm" runat="server" ControlToValidate="TextBoxConfirmPassword"
                                                Display="None" ErrorMessage="Confirm Password is empty." ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("Email") %>' Width="160px"></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prefer Culture">
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DDLLanguage" runat="server" DataSourceID="ODSCulture" DataTextField="CultureName"
                                                DataValueField="CultureId" SelectedValue='<%# Bind("PreferCultureId") %>' Width="250px">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
                                </Fields>
                            </asp:DetailsView>
                            <br />
                            <asp:Label ID="MessageLabel" ForeColor="Red" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            Keyword :
                            <asp:TextBox ID="TxKeyword" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1"
                                runat="server" Text="Search" /></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <br />
                            <asp:GridView ID="GridViewCtrl" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId"
                                DataSourceID="ODSCtrl" PageSize="100" Width="98%" OnRowCommand="GridViewCtrl_RowCommand">
                                <Columns>
                                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                                        EditImageUrl="~/BackOffice/Include/images/editicon.gif" ShowEditButton="True"
                                        UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif" ValidationGroup="Update" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageBtnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="~/BackOffice/include/images/deleteicon.gif" Text="Delete" />
                                            <ajaxToolkit:ConfirmButtonExtender ID="ConfirmDelete" runat="server" ConfirmText="Are you sure want to delete?"
                                                TargetControlID="ImageBtnDelete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/BackOffice/Include/images/resetpass.gif" ShowSelectButton="True" />
                                    <asp:BoundField DataField="UserId" HeaderText="User ID" ReadOnly="True" />
                                    <asp:BoundField DataField="Username" HeaderText="UserName" ReadOnly="True">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="First Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxFirstName" runat="server" Text='<%# Bind("FirstName") %>' Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxLastName" runat="server" Text='<%# Bind("LastName") %>' Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AuthorizedBy">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxAuthorizedBy" runat="server" Text='<%# Bind("AuthorizedBy") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelAuthorizedBy" runat="server" Text='<%# Bind("AuthorizedBy") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("Email") %>' Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Culture">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DDLLanguage" runat="server" DataSourceID="ODSCulture" DataTextField="CultureName"
                                                DataValueField="CultureId" SelectedValue='<%# Bind("PreferCultureId") %>' Width="77px">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelLanguage" runat="server" Text='<%# Bind("PreferCultureId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="Status" HeaderText="Status" />
                                    <asp:CheckBoxField DataField="ForceChangePwd" HeaderText="Force Change Pwd" />
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODSCtrl" runat="server" InsertMethod="InsertUsers" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetUserByKeyword" TypeName="System.FrameWork.FWUser" UpdateMethod="UpdateUsers"
                                DeleteMethod="DeleteUsers">
                                <InsertParameters>
                                    <asp:Parameter Name="Username" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="FirstName" Type="String" />
                                    <asp:Parameter Name="LastName" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="PreferCultureId" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TxKeyword" Name="keyword" PropertyName="Text" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Original_UserId" Type="String" />
                                    <asp:Parameter Name="FirstName" Type="String" />
                                    <asp:Parameter Name="LastName" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="PreferCultureId" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="ForceChangePwd" Type="String" />
                                    <asp:Parameter Name="Department" Type="String" />
                                    <asp:Parameter Name="AuthorizedBy" Type="String" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_UserId" Type="String" />
                                </DeleteParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ODSCulture" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetCultureNotBlank" TypeName="System.FrameWork.FWCultures"></asp:ObjectDataSource>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Panel ID="panelResetPassword" runat="server" CssClass="modalPopup" Style="display: none" Width="450px">
        <center>
            <table border="0" cellpadding="3" cellspacing="0" class="whitebgBorder" width="100%">
                    <tr class="HeaderStyle" height="16">
                        <td align="left" colspan="2">
                            <asp:Label ID="LabelRoleLocale" runat="server" ForeColor="#2A3C4B" Text="Change Password"></asp:Label></td>
                    </tr>
                    <tr align="left" class="AlternatingRowStyle" height="30">
                        <td>
                            <asp:Label ID="LabelLanguage" runat="server" Text="New Password"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txNewPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox></td>
                    </tr>
                    <tr align="left" class="RowStyle" height="30">
                        <td>
                            <asp:Label ID="LabelTitle" runat="server" Text="Confirm Password" Width="92px"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txConfirmPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                            <asp:HiddenField ID="hFldUsername" runat="server" /></td>
                    </tr>
                    <tr class="AlternatingRowStyle" height="30">
                        <td colspan="2">
                            <asp:Button ID="BtnOk" runat="server" OnClick="BtnOk_Click"
                                Text="Change" Width="60px" />&nbsp;
                            <asp:Button ID="BtnCancel" runat="server"
                                Text="Cancel" Width="60px" />
                            <br />
                            <br />
                            <asp:Label ID="ResultStatus" runat="server" CssClass="error" Visible="false"></asp:Label></td>
                    </tr>
                </table>
        </center>
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
         CancelControlID="BtnCancel" DropShadow="true" PopupControlID="panelResetPassword"
         TargetControlID="btnTrigger">
        </ajaxToolkit:ModalPopupExtender>
    <asp:Button ID="btnTrigger" runat="server" Style="display: none" />
          </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>
