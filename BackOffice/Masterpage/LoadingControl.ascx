<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoadingControl.ascx.cs" Inherits="_LoadingControl" %>
        <script type="text/javascript" language="javascript">
    // ModalPopupExtension Loading    
    //  register for our events
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);    
    
    function beginRequest(sender, args){
        // show the popup
        $find('ctl00_ContentPlaceHolder_LoadingControl1_ModalPopupLoading').show();        
    }

    function endRequest(sender, args) {
        //  hide the popup
        $find('ctl00_ContentPlaceHolder_LoadingControl1_ModalPopupLoading').hide();
    }
</script>
<ajaxToolKit:ModalPopupExtender ID="ModalPopupLoading" runat="server" 
TargetControlID="pnlPopup" PopupControlID="pnlPopup" BackgroundCssClass="modalBackground"  />
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" style="display:none">
    <div align="center" style="margin-top:13px;">
        <img src="../include/images/loading.gif" />
    </div>
</asp:Panel>