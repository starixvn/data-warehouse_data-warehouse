<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="DWRS.aspx.cs" Inherits="_DWRS" Title="Reports Service Page" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<script language="javascript">
function CalendarView(id){
    if(id=="0"){
        document.getElementById("DAILY").style.display='none';
        document.getElementById("WEEKLY").style.display='none';
        document.getElementById("MONTHLY").style.display='none';
        document.getElementById("ANNUAL").style.display='';
        document.getElementById("FYE").style.display = 'none';
        document.getElementById("MONTHRANGE").style.display = 'none';
    }
    if(id=="1"){
        document.getElementById("DAILY").style.display='';
        document.getElementById("WEEKLY").style.display='none';
        document.getElementById("MONTHLY").style.display='none';
        document.getElementById("ANNUAL").style.display='none';
        document.getElementById("FYE").style.display = 'none';
        document.getElementById("MONTHRANGE").style.display = 'none';
    }
    if(id=="2"){
        document.getElementById("DAILY").style.display='none';
        document.getElementById("WEEKLY").style.display='';
        document.getElementById("MONTHLY").style.display='none';
        document.getElementById("ANNUAL").style.display='none';
        document.getElementById("FYE").style.display = 'none';
        document.getElementById("MONTHRANGE").style.display = 'none';
    }
    if(id=="3"){
        document.getElementById("DAILY").style.display='none';
        document.getElementById("WEEKLY").style.display='none';
        document.getElementById("MONTHLY").style.display='';
        document.getElementById("ANNUAL").style.display='none';
        document.getElementById("FYE").style.display = 'none';
        document.getElementById("MONTHRANGE").style.display = 'none';
    }
    if(id=="4"){
        document.getElementById("DAILY").style.display='none';
        document.getElementById("WEEKLY").style.display='none';
        document.getElementById("MONTHLY").style.display='none';
        document.getElementById("ANNUAL").style.display='none';
        document.getElementById("FYE").style.display = '';
        document.getElementById("MONTHRANGE").style.display = 'none';
    }
    if (id == "5") {
        document.getElementById("DAILY").style.display = 'none';
        document.getElementById("WEEKLY").style.display = 'none';
        document.getElementById("MONTHLY").style.display = 'none';
        document.getElementById("ANNUAL").style.display = 'none';
        document.getElementById("FYE").style.display = 'none';
        document.getElementById("MONTHRANGE").style.display = '';
    }
    document.getElementById("PERIODCODE").value=id;
//    alert(document.getElementById("PERIODCODE").value);
}
</script>
    <ajax:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="360000" />
    <!--EnablePartialRendering="false"--> 
    <ajax:UpdatePanel ID="UpdatePanelDWRS" runat="server">
    <ContentTemplate>
    
    
    <table width="100%" align="left" cellpadding="1" cellspacing="1" border="0" >
        <tr class="HeaderStyle">
            <td  height="20" align="left"> 
            <input type="hidden" id="PERIODCODE" name="PERIODCODE" value="<%=PreviousPeriodOption%>" />
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
            <b>Parameter</b> <%=PARAMETER%><%=PERIOD%>
            </td>
        </tr>          
        <tr>
            <td align="left">
                <asp:Table ID="TableParameterBoard" runat="server">
                </asp:Table>
            </td>
        </tr>
       <tr class="HeaderStyle">
        <td height="25" align="left"> PERIOD</td>
        </tr>
        <tr class="AlternatingRowStyle" height="30" align="left">
            <td>
            <table width="100%" border='0' cellpadding='1' cellspacing='1'>
                <tr>
                    <td width="70%" id="PERIOD_AREA" valign="top" >
                    <%=(PERIOD.ToLower().Equals("daily"))?"<div id='DAILY'>":"<div id='DAILY' style='display:none'>"%>
                    DAILY&nbsp; Start Date :&nbsp;
                   <asp:TextBox ID="TextBoxStartDate" runat="server" Width="96px"></asp:TextBox>&nbsp;
                   <asp:Image ID="ImgEndDate" runat="server" CssClass="buttonCursor" ImageUrl="~/BackOffice/include/images/Calendar_scheduleHS.png" />&nbsp;
                       <script type="text/javascript">
                        Calendar.setup({
                        inputField     :    "ctl00_ContentPlaceHolder_TextBoxStartDate",     // id of the input field
                        ifFormat       :    "%d/%m/%Y",      // format of the input field %d %b %Y, %H:%M:00
                        //showsTime      :    true,
                        button         :    "ctl00_ContentPlaceHolder_ImgEndDate",  // trigger for the calendar (button ID)
                        align          :    "Tl",           // alignment (defaults to "Bl")
                        singleClick    :    true
                        });
                     </script>
                    &nbsp;End Date :&nbsp;
                    <asp:TextBox ID="TextBoxEndDate" runat="server" Width="96px"></asp:TextBox>&nbsp;
                   <asp:Image ID="ImageEndDate" runat="server" CssClass="buttonCursor" ImageUrl="~/BackOffice/include/images/Calendar_scheduleHS.png" />&nbsp;
                     <script type="text/javascript">
                        Calendar.setup({
                        inputField     :    "ctl00_ContentPlaceHolder_TextBoxEndDate",     // id of the input field
                        ifFormat       :    "%d/%m/%Y",      // format of the input field %d %b %Y, %H:%M:00
                        //showsTime      :    true,
                        button         :    "ctl00_ContentPlaceHolder_ImageEndDate",  // trigger for the calendar (button ID)
                        align          :    "Tl",           // alignment (defaults to "Bl")
                        singleClick    :    true
                        });
                     </script>
                    </div>   
                    <%=(PERIOD.ToLower().Equals("weekly")) ? "<div id='WEEKLY'>" : "<div id='WEEKLY' style='display:none'>"%>
                    WEEKLY&nbsp; Start <asp:DropDownList ID="DropDownListStartWeek" runat="server" Width="60px" DataSourceID="ODSWeeks" DataTextField="Text" DataValueField="Value">
                        </asp:DropDownList><%--<select name="from_week"><%=System.Utility.Utilities.GetWeekOptions(Request.Params.Get("from_week"))%></select>--%> 
                    &nbsp;To <asp:DropDownList ID="DropDownListEndWeek" runat="server" Width="60px" DataSourceID="ODSWeeks" DataTextField="Text" DataValueField="Value">
                        </asp:DropDownList><%--<select name="to_week"><%=System.Utility.Utilities.GetWeekOptions(Request.Params.Get("to_week"))%></select>--%>
                    </div>  
                    <%=(PERIOD.ToLower().Equals("monthly")) ? "<div id='MONTHLY'>" : "<div id='MONTHLY' style='display:none'>"%>
                    MONTHLY&nbsp; From&nbsp;
                        <%--<select name="from_month">
                    <%=System.Utility.Utilities.GetMonthOptions(Request.Params.Get("from_month"))%>
                    </select>--%>
                        <asp:DropDownList ID="DropDownListMonthly" runat="server" Width="90px" DataSourceID="ODSMonths" DataTextField="Text" DataValueField="Value" >
                        </asp:DropDownList>&nbsp; Year&nbsp;
                        <%--<select name="from_year">
                    <%=System.Utility.Utilities.GetYearOptions(Request.Params.Get("from_year"))%>
                    </select>--%><asp:DropDownList ID="DropDownListYear" runat="server" Width="60px" DataSourceID="ODSYears" DataTextField="Text" DataValueField="Value">
                        </asp:DropDownList>
                    
                    </div>
                    <%=(IsPeriodAnnualYearly) ? "<div id='ANNUAL'>" : "<div id='ANNUAL' style='display:none'>"%>
                    ANNUAL&nbsp; For Year&nbsp;
                        <%--<select name="from_annual">
                    <%=System.Utility.Utilities.GetYearOptions(Request.Params.Get("from_annual"))%>
                    </select>--%>
                    <asp:DropDownList ID="DropDownListANNUAL" runat="server" Width="60px" DataSourceID="ODSYears" DataTextField="Text" DataValueField="Value">
                        </asp:DropDownList>
                    </div>
                    <div id="FYE" style="display:none">
                    FYE&nbsp; For Year&nbsp;
                        <%--<select name="from_fye">
                    <%=System.Utility.Utilities.GetYearOptions(Request.Params.Get("from_fye"))%>
                    </select> --%>
                    <asp:DropDownList ID="DropDownListFYE" runat="server" Width="60px" DataSourceID="ODSFYE" DataTextField="Text" DataValueField="Value">
                        </asp:DropDownList></div>
                    <%=(PERIOD.ToLower().Equals("monthrange")) ? "<div id='MONTHRANGE'>" : "<div id='MONTHRANGE' style='display:none'>"%>
                        MONTH RANGE&nbsp;From&nbsp;
                        <asp:DropDownList ID="DropDownListFromMONTHRANGE" runat="server" Width="90px" DataSourceID="ODSMonths" DataTextField="Text" DataValueField="Value"></asp:DropDownList>&nbsp;
                        <asp:DropDownList ID="DropDownListFromYEARRANGE" runat="server" Width="60px" DataSourceID="ODSYears" DataTextField="Text" DataValueField="Value"></asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;To&nbsp;
                        <asp:DropDownList ID="DropDownListToMONTHRANGE" runat="server" Width="90px" DataSourceID="ODSMonths" DataTextField="Text" DataValueField="Value"></asp:DropDownList>&nbsp;
                        <asp:DropDownList ID="DropDownListToYEARRANGE" runat="server" Width="60px" DataSourceID="ODSYears" DataTextField="Text" DataValueField="Value"></asp:DropDownList>
                    </div>
                    </td>
                </tr>
            </table>
            </td>
        </tr>      
        <tr class="HeaderStyle">
        <td height="25" align="left"> RECENT FILES</td>
        </tr>
        <tr class="AlternatingRowStyle" align="left">
        <td>
            &nbsp;
            <asp:DropDownList ID="ddlRecentReports" runat="server" DataTextField="URL" 
                DataValueField="Link" Width="300">
                <asp:ListItem Selected="True" Value="No_Choice" Text="No Choice"></asp:ListItem>
            </asp:DropDownList>&nbsp;
            <asp:Button ID="btnGetFile" runat="server" Text="Get File" 
                onclick="btnGetFile_Click" />
        </td>
        </tr>
        <tr class="CommandRowStyle" height="25">
            <td align="left">
                <asp:HiddenField ID="HiddenFieldExcelElapsedTime" runat="server" />
                <asp:RadioButtonList ID="rpttype" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="2" Text="Excel" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Html"></asp:ListItem>
                </asp:RadioButtonList>&nbsp;
                <asp:Button ID="ButtonProduceReport" runat="server" OnClick="ButtonProduceReport_Click" Text="Produce Report" />
                <asp:Button ID="ButtonPreviewReport" runat="server" Text="Preview" 
                    onclick="ButtonPreviewReport_Click" />
                <asp:ObjectDataSource ID="ODSMonths" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetMonths" TypeName="System.Utility.UtilityDateTime"></asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ODSYears" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetYears" TypeName="System.Utility.UtilityDateTime"></asp:ObjectDataSource><asp:ObjectDataSource ID="ODSFYE" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetFYE" TypeName="System.Utility.UtilityDateTime"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSWeeks" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetWeeks" TypeName="System.Utility.UtilityDateTime"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td align="left">
                <%=RSB.ToString()%>
            </td>
        </tr>
    </table>
    
    
    </ContentTemplate>
    </ajax:UpdatePanel>
    <script language="javascript">
        //-------------------------------------------
        if ("<%=IsFirstRequest%>" == "True") {
            document.getElementsByName("ISSUMMARY")[0].checked = true;
        }
    </script>
    
    <asp:Panel ID="PanelProgress" runat="server" CssClass="updateProgress" style="display:none">
        <div align="center" style="margin-top:13px;">
            <img src="../../App_Themes/Blue/images/simple.gif" />
            <span class="updateProgressMessage">Loading ...</span>
        </div>
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="PanelProgress" PopupControlID="PanelProgress" BackgroundCssClass="modalBackground" DropShadow="true">
    </ajaxToolkit:ModalPopupExtender>
    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(initializeRequest);
        prm.add_endRequest(endRequest);

        var _postBackElement;

        function initializeRequest(sender, e) {
            if (prm.get_isInAsyncPostBack()) {
                e.set_cancel(true);
            }

            _postBackElement = e.get_postBackElement();

            if (_postBackElement.id.indexOf('ButtonProduceReport') > -1) {
                $find('<%=ModalPopupExtender1.ClientID%>').show();
            }
        }

        function endRequest(sender, e) {
            if (_postBackElement.id.indexOf('ButtonProduceReport') > -1) {
                $find('<%=ModalPopupExtender1.ClientID%>').hide();
                
                var obj = document.getElementById('<%=HiddenFieldExcelElapsedTime.ClientID%>');
                var temp = "";
                if (obj.value != "") {
                    temp = obj.value;
                    window.location = temp;
                }
            }

            // Setup calendar controls of Start Date and End Date after partial postback
            Calendar.setup({
                inputField: "ctl00_ContentPlaceHolder_TextBoxStartDate",     // id of the input field
                ifFormat: "%d/%m/%Y",      // format of the input field %d %b %Y, %H:%M:00
                //showsTime      :    true,
                button: "ctl00_ContentPlaceHolder_ImgEndDate",  // trigger for the calendar (button ID)
                align: "Tl",           // alignment (defaults to "Bl")
                singleClick: true
            });
            Calendar.setup({
                inputField: "ctl00_ContentPlaceHolder_TextBoxEndDate",     // id of the input field
                ifFormat: "%d/%m/%Y",      // format of the input field %d %b %Y, %H:%M:00
                //showsTime      :    true,
                button: "ctl00_ContentPlaceHolder_ImageEndDate",  // trigger for the calendar (button ID)
                align: "Tl",           // alignment (defaults to "Bl")
                singleClick: true
            });
        }
    </script>
</asp:Content>

