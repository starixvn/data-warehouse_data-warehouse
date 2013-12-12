
function BlockSign() {
	// 33 - 47 ! " # $ % & ' ( ) * + , - . /
	// 58 - 64 : ; < = > ? @
	// 91 - 96 [ \ ] ^ _ `
	// 123 - 126 { | } ~
	if ((event.keyCode>32&&event.keyCode<48)||(event.keyCode>57&&event.keyCode<65)||(event.keyCode>90&&event.keyCode<97)||(event.keyCode>122 && event.keyCode<127))
		event.returnValue = false
}
function BlockQuote() {
	// 34 "
	// 39 '
	if (event.keyCode==34||event.keyCode==39)
		event.returnValue = false
}
function BlockNum() {
	// 48 - 57 0 1 2 3 4 5 6 7 8 9
	if (event.keyCode>=48 && event.keyCode<=57)
		event.returnValue = false;
}
function NumOnly() {
	if (event.keyCode>='0'.charCodeAt()&&event.keyCode <= '9'.charCodeAt())
		event.returnValue = true;
	else
		event.returnValue = false;
}

function ExecuteURL(url){
	document.frmMain.action = url;
	document.frmMain.submit();
}

function ShowDesc(){
	var x = document.getElementById("ShowDesc");
	if (x.style.display=="none")
		x.style.display="block"
	else
		x.style.display="block"
		//x.style.display="none"
}
	
function HideDesc(){
	document.getElementById("ShowDesc").style.display="none";
}
	
function DeleteRec(url){
	if (confirm('Do you want to delete this?')){
		ExecuteURL(url);
	}
}

function AlertRec(url){
	if (alert('ชื่อผู้ใช้ของท่านไม่ได้ลงทะเบียนเพื่อใช้งานภาษาที่ได้เลือก \n You are not authorized to access in this page.')){
	}
}

function winOpen(url){
	var h = 600;
	var w = 700;
			
	var LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	var TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	var settings = 'height=' + h + ',width=' + w + ',top=' + (TopPosition-50) + ',left=' + LeftPosition + ',toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no'
			
	var rtnVal = window.open(url, '', settings)

}

function winOpenmail(url){
	var h = 680;
	var w = 780;
			
	var LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	var TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	var settings = 'height=' + h + ',width=' + w + ',top=' + (TopPosition-50) + ',left=' + LeftPosition + ',toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no'
			
	var rtnVal = window.open(url, 'MAIL', settings)

}

function winOpenSch(url){
	var h = 500;
	var w = 600;
			
	var LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	var TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	var settings = 'height=' + h + ',width=' + w + ',top=' + (TopPosition-50) + ',left=' + LeftPosition + ',toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no'
			
	var rtnVal = window.open(url, 'SCHEDULE', settings)


}
function winOpenMini(url){
	var h = 400;
	var w = 400;
			
	var LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	var TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	var settings = 'height=' + h + ',width=' + w + ',top=' + (TopPosition-50) + ',left=' + LeftPosition + ',toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no'
			
	var rtnVal = window.open(url, 'MINI', settings)

}

function winChatOpen(url){
	var h = 600;
	var w = 800;
			
	var LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	var TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	var settings = 'height=' + h + ',width=' + w + ',top=' + (TopPosition-50) + ',left=' + LeftPosition + ',toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no'
			
	var rtnVal = window.open(url, 'CHAT', settings)

}


function winOpenModal(url){

	var iWdDlg = 780
	var iHtDlg = 710
	var sFeatures = "dialogWidth:" + iWdDlg + "px; dialogheight:" + iHtDlg + "px; status:no; unadorned:yes; help:no"
		
	oChildWin = window.showModalDialog(url, window, sFeatures);

}

function ConfirmExectue(url,alertmsg){
	if(confirm(alertmsg)){
		ExecuteURL(url);
	}
}

function move(fbox, tbox) {
    var arrFbox = new Array();
    var arrTbox = new Array();
    var arrLookup = new Array();
    var i;

    index = fbox.selectedIndex;
    if (index == -1) return false;

    for (i = 0; i < tbox.options.length; i++) {
        arrLookup[tbox.options[i].text] = tbox.options[i].value;
        arrTbox[i] = tbox.options[i].text;
    }
    var fLength = 0;
    var tLength = arrTbox.length;
    for(i = 0; i < fbox.options.length; i++) {
        arrLookup[fbox.options[i].text] = fbox.options[i].value;
    if (fbox.options[i].selected && fbox.options[i].value != "") {
        arrTbox[tLength] = fbox.options[i].text;
        tLength++;
    }
    else {
        arrFbox[fLength] = fbox.options[i].text;
        fLength++;
       }
    }
    arrFbox.sort();
    //arrTbox.sort();
    fbox.length = 0;
    tbox.length = 0;
    var c;
    for(c = 0; c < arrFbox.length; c++) {
        var no = new Option();
        no.value = arrLookup[arrFbox[c]];
        no.text = arrFbox[c];
        fbox[c] = no;
    }
    for(c = 0; c < arrTbox.length; c++) {
        var no = new Option();
        no.value = arrLookup[arrTbox[c]];
        no.text = arrTbox[c];
        tbox[c] = no;
    }
}