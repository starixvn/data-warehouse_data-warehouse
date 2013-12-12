<%@ Page Language="C#" MasterPageFile="~/BackOffice/Masterpage/MasterSingleCanvas.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Report Service Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <script language="javascript" type ="text/javascript">
        (function ($) {
            $.extend({
                getQueryString: function (name) {
                    function parseParams() {
                        var params = {},
                    e,
                    a = /\+/g,  // Regex for replacing addition symbol with a space
                    r = /([^&=]+)=?([^&]*)/g,
                    d = function (s) { return decodeURIComponent(s.replace(a, " ")); },
                    q = window.location.search.substring(1);

                        while (e = r.exec(q))
                            params[d(e[1])] = d(e[2]);

                        return params;
                    }

                    if (!this.queryStringParams)
                        this.queryStringParams = parseParams();

                    return this.queryStringParams[name];
                }
            });
        })(jQuery);
        function announcement() {
            $("#dialog").dialog({
                width: 700,
                height: 500,
                modal: true,
                resizable: false,
                position: [200, 100],
                close: function () {
                    var isDontShowAgain = $('#chkDontShowAgain').prop('checked');
                    
                    createCookie('DW_Dont_Show_Announcement', isDontShowAgain, 30);
                }
            });
        }
        $(document).ready(function () {
            $("#dialog").hide();
            var isShowAccouncement = $.getQueryString('showAnnouncement');
            if (isShowAccouncement && isShowAccouncement == 'true') {
                var checkingCookie = readCookie('DW_Dont_Show_Announcement')
                //eraseCookie('DW_Dont_Show_Announcement');
                if (checkingCookie == null | checkingCookie == '' | checkingCookie == 'false') {
                    announcement();
                }
            }
        });
    </script>
        <div id="dialog" title="Announcement of New Data Warehouse System" style="font-size: 13px">
            Dear Data Warehouse users,<br /><br />
            We would like to inform you that a new Data Warehouse System with more user-friendly interface and data accurary 
            has been developed and deployed to production. Since this is a newly-built system, only a few reports in the old 
            Data Warehouse System were fully converted. Below is the list of converted reports:<br />
            <label style="font-weight:bold">
                &nbsp;&nbsp;- Top Customer Monthly<br />
                &nbsp;&nbsp;- Distribution of Margin<br />
                &nbsp;&nbsp;- Currency<br />
                &nbsp;&nbsp;- Games<br />
                &nbsp;&nbsp;- Deposit<br />
                &nbsp;&nbsp;- Daily Active Site<br />
                &nbsp;&nbsp;- Customer Report <br />
                &nbsp;&nbsp;- League Report <br />
                &nbsp;&nbsp;- Site Winloss <br />
                &nbsp;&nbsp;- Match By Minutes HDP-OU for Soccer  <br />
				&nbsp;&nbsp;- Performance Sport<br /><br />
            </label>            
            Please note that the aforementioned reports which were successfully converted and deployed to new Data Warehouse System were already removed from old Data Warehouse System.
            <br /><br />
            For more information of New Data Warehouse System, please kindly email us at: <br />            
            &nbsp;&nbsp;- <label style="font-weight:bold">David Tan</label> (david.twk@cicteam.com) <br />
            &nbsp;&nbsp;- <label style="font-weight:bold">Ronny Nguyen</label> (ronny.nguyen@nexcel.vn)
            <br />
            <hr style="color:#FFFFFF;" />
            <input type="checkbox" id="chkDontShowAgain" />Do not show this in the next login.
        </div>
</asp:Content>

    