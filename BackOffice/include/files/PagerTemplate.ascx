<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PagerTemplate.ascx.cs" Inherits="Include_files_PagerTemplate" %>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr align="right">
                                                                <td>
                                                                    <table align="right" border="0" cellpadding="2" cellspacing="0">
                                                                        <tr align="center">
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                <asp:Label ID="pageShow" runat="server"></asp:Label></td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                |</td>
                                                                            <td align="left" valign="middle">
                                                                                <asp:ImageButton ID="btFirst" runat="server" CommandArgument="First" CommandName="page"
                                                                                    ImageUrl="../Include/images/pagenav_first.gif" /></td>
                                                                            <td>
                                                                                <asp:ImageButton ID="btPrevious" runat="server" CommandArgument="Prev" CommandName="page"
                                                                                    ImageUrl="../Include/images/pagenav_previous.gif" /></td>
                                                                            <td>
                                                                                <asp:ImageButton ID="btNext" runat="server" CommandArgument="Next" CommandName="page"
                                                                                    ImageUrl="../Include/images/pagenav_next.gif" /></td>
                                                                            <td align="right" valign="middle">
                                                                                <asp:ImageButton ID="btLast" runat="server" CommandArgument="Last" CommandName="page"
                                                                                    ImageUrl="../Include/images/pagenav_lastpage.gif" /></td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                |</td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                Show</td>
                                                                            <td align="right" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                <asp:TextBox ID="txPageIndex" runat="server" CssClass="formStyle" onKeypress="if ((event.keyCode < 45 )||(event.keyCode > 57)||(event.keyCode>32&&event.keyCode<48)||(event.keyCode>57&&event.keyCode<65)||(event.keyCode>90&&event.keyCode<97)||(event.keyCode>122 && event.keyCode<127)) event.returnValue = false;"
                                                                                    Width="20px"></asp:TextBox>
                                                                            </td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                Page
                                                                            </td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                <asp:ImageButton ID="btPageIndex" runat="server" ImageUrl="../Include/images/threadexpand.gif" /></td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                            </td>
                                                                            <td align="right" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                <asp:TextBox ID="txtPageSize" runat="server" CssClass="formStyle" onKeypress="if ((event.keyCode < 45 )||(event.keyCode > 57)||(event.keyCode>32&&event.keyCode<48)||(event.keyCode>57&&event.keyCode<65)||(event.keyCode>90&&event.keyCode<97)||(event.keyCode>122 && event.keyCode<127)) event.returnValue = false;"
                                                                                    Width="20px"/>
                                                                            </td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                PerPage
                                                                            </td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                                Show <asp:ImageButton ID="btPagesize" runat="server" ImageUrl="../Include/images/threadexpand.gif" /></td>
                                                                            <td align="left" class="fontBlack" nowrap="nowrap" valign="middle">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
