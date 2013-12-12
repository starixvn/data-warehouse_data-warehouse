<%@ Page Language="C#" MasterPageFile="~/BackOffice/MasterPage/MasterSingleCanvas.master"
    AutoEventWireup="true" CodeFile="Programs.aspx.cs" Inherits="_Programs" Title="Programs Page" %>

<asp:Content ID="Programs" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
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
                                    <asp:DetailsView ID="DetailsViewPrograms" runat="server" AutoGenerateInsertButton="True"
                                        AutoGenerateRows="False" DataSourceID="ODSPrograms" DefaultMode="Insert" HeaderText="Programs"
                                        Height="50px" Width="100%">
                                        <Fields>
                                            <asp:TemplateField HeaderText="Program ID">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxID" runat="server" Text='<%# Bind("ProgramId") %>' Enabled="false"></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="URL">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBoxURL" runat="server" Text='<%# Bind("URL") %>' Width="90%"></asp:TextBox>
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
                                    <br />
                                    <asp:GridView ID="GridViewPrograms" runat="server" AutoGenerateColumns="False" DataKeyNames="ProgramId"
                                        DataSourceID="ODSPrograms" PageSize="15" Width="100%" OnRowCommand="GridViewPrograms_RowCommand" AllowPaging="True" OnRowCreated="GridViewPrograms_RowCreated">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/BackOffice/Include/images/select.gif"
                                                ShowSelectButton="True" />
                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/BackOffice/Include/images/cancelicon.gif"
                                                EditImageUrl="~/BackOffice/Include/images/editicon.gif" UpdateImageUrl="~/BackOffice/Include/images/updateicon.gif"
                                                ShowEditButton="True" />
                                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/BackOffice/include/images/deleteicon.gif"
                                                ShowDeleteButton="True" />
                                            <asp:BoundField DataField="ProgramId" HeaderText="Program ID" ReadOnly="True" />
                                            <asp:TemplateField HeaderText="Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="URL">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxURL" runat="server" Text='<%# Bind("URL") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelURL" runat="server" Text='<%# Bind("URL") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <HeaderStyle HorizontalAlign="Left" />
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
            <asp:Panel ID="panelRole" runat="server" CssClass="modalPopup" Style="display: none"
                Width="450">
                <center>
                    <br />
                    <table border="0" cellpadding="3" cellspacing="0" width="400" class="whitebgBorder">
                        <tr class="HeaderStyle" height="16">
                            <td colspan="2" align="left">
                                <asp:Label ID="LabelProgramsLocale" runat="server" Text="Programs Locale" ForeColor="White"></asp:Label></td>
                        </tr>
                        <tr align="left" class="RowStyle" height="30">
                            <td width="120">
                                <asp:Label ID="LabelPrograID" runat="server" Text="Program ID"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TextBoxProgramID" runat="server" ReadOnly="True" Width="140px"></asp:TextBox></td>
                        </tr>
                        <tr align="left" class="AlternatingRowStyle" height="30">
                            <td>
                                <asp:Label ID="LabelLocale" runat="server" Text="Locale"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="ddLocale" runat="server" Width="140px" CssClass="formStyle"
                                    DataSourceID="ODSProgramsNotInLanguage" DataTextField="CultureId" DataValueField="CultureId">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left" class="RowStyle" height="30">
                            <td>
                                <asp:Label ID="LabelTitle" runat="server" Text="Title"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TextBoxTitle" runat="server" Width="80%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left" class="AlternatingRowStyle" height="30">
                            <td>
                                <asp:Label ID="LabelDescription" runat="server" Text="Descriptione"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TextBoxDescription" runat="server" Width="80%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="RowStyle" height="30">
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="BtnOk" runat="server" Text="Insert" OnClick="BtnOk_Click" />&nbsp;
                                <asp:Button ID="BtnCancel" runat="server" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="GridViewProgramsLocale" runat="server" PageSize="50" Width="400px"
                        AutoGenerateColumns="False" DataSourceID="ODSProgramsLocale" DataKeyNames="ProgramId,CultureId"
                        OnRowCommand="GridViewProgramsLocale_RowCommand">
                        <Columns>
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/BackOffice/Include/images/deleteicon.gif"
                                ShowDeleteButton="True" />
                            <asp:BoundField DataField="ProgramId" HeaderText="Program ID" />
                            <asp:BoundField DataField="CultureId" HeaderText="Locale" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:ObjectDataSource ID="ODSProgramsLocale" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetProgramsLocaleByProgramID" TypeName="System.FrameWork.FWPrograms"
                        DeleteMethod="DeleteProgramsInCulture">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxProgramID" Name="ProgramID" PropertyName="Text"
                                Type="String" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ProgramID" Type="String" />
                            <asp:Parameter Name="Original_CultureId" Type="String" />
                        </DeleteParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ODSProgramsNotInLanguage" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetProgramsInCultureNotInLanguage" TypeName="System.FrameWork.FWPrograms">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxProgramID" Name="ProgramID" PropertyName="Text"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </center>
            </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                CancelControlID="BtnCancel" DropShadow="true" PopupControlID="panelRole" TargetControlID="btnTrigger">
            </ajaxToolkit:ModalPopupExtender>
            <asp:Button ID="btnTrigger" runat="server" Style="display: none" />
            <asp:ObjectDataSource ID="ODSPrograms" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetPrograms" TypeName="System.FrameWork.FWPrograms" InsertMethod="InsertPrograms"
                UpdateMethod="UpdateProgram" DeleteMethod="DeleteProgramAll">
                <UpdateParameters>
                    <asp:Parameter Name="Original_ProgramID" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="URL" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProgramId" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="URL" Type="String" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Original_ProgramID" Type="String" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </ajax:UpdatePanel>
</asp:Content>
