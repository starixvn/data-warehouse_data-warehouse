// popup functions 
openWins = new Array();
curWin = 0;

function popupWin(link,win,wd,ht)
{
	ind = win.indexOf("-");
	var temp = win.substring(0,ind)+win.substring(ind+1);
	win = temp;
	args="width="+wd+",height="+ht+",resizable=yes,scrollbars=yes,status=0,dependent=yes,toolbar=0,titlebar=0,location=top,menubar=0,directories=0";	 	
	var open = window.open(link,win,args);
	open.focus();
}


function NewWindow(mypage,myname,w,h,scroll,pos,x,y)
{
ind = myname.indexOf("-");
var temp = myname.substring(0,ind)+myname.substring(ind+1);
myname = temp;
var win=null;
if(scroll!='No' && scroll!='no' && scroll!='NO'){
	scroll="yes"
}
if(pos=="random"){LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;}
if(pos=="center"){LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h)/2:100;}
else if((pos!="center" && pos!="random") || pos==null){LeftPosition=x;TopPosition=y}
settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',screenX='+x+', screenX='+y+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes';
//openWins[curWin++] = window.open(mypage,myname,settings);
win = window.open(mypage,myname,settings);
win.onload = function() {loadChineseStyle(win)};
navapp = navigator.appVersion
if(navapp.indexOf("MSIE 5.0")== -1){
win.focus();
}
}

function NewWindowP(mypage,myname,w,h,scroll,pos,x,y,menu,tool)
{
ind = myname.indexOf("-");
var temp = myname.substring(0,ind)+myname.substring(ind+1);
myname = temp;
var win=null;
if(scroll!='No' && scroll!='no' && scroll!='NO'){
	scroll="yes"
}
if(menu!='No' && menu!='no' && menu!='NO'){
	menu="yes"
}
if(tool!='No' && tool!='no' && tool!='NO'){
	tool="yes"
}
if(pos=="random"){LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;}
if(pos=="center"){LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h)/2:100;}
else if((pos!="center" && pos!="random") || pos==null){LeftPosition=x;TopPosition=y}
settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',screenX='+x+', screenX='+y+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar='+menu+',toolbar='+tool+',resizable=yes';
//openWins[curWin++] = window.open(mypage,myname,settings);
win = window.open(mypage,myname,settings);
navapp = navigator.appVersion
if(navapp.indexOf("MSIE 5.0")== -1){
win.focus();
}
}

function popupAttachment(lat,cat,fol,dat,fn)
{
	//alert("lat : "+lat+" - cat : "+cat+" - fol : "+fol+" - dat : "+dat+" - fn : "+fn);
	var link = "/";
	
	if(lat != "")
	{
		link += lat+"/";
	}	

		link += "SupportMgr/";
	
	if(cat == "m")
	{
		link += "Mails/";
	}
	else
	{
		link += "Reply/";
	}	

		link += fol+"/";
		link += dat+"/";
		link += "Attachment/";
		link += fn;

	//alert("link : "+link);
		
	args="resizable=yes,scrollbars=yes,status=0,dependent=yes,toolbar=0,titlebar=0,location=top,menubar=0,directories=0";	 	
	var open = window.open(link,'Attachments',args);
	open.focus();
}


function closeAll() {
    for(i=0; i<openWins.length; i++) if (openWins[i] && !openWins[i].closed) openWins[i].close();
}

function openPrintView(page){
window.open(page,"PrintPreview","menubar=yes,scrollbars=yes,status=yes,location=top,resizable=yes,width=700,height=600")
}

//function OpenModalDialog(strUrl,strFeatures,aID,hours)
//{
// if (strFeatures == '')
//  strFeatures = "resizable=no;dialogWidth:510px;dialogHeight:350px;
//                        help:no;maximize:yes;minimize:yes;scrollbars:yes";
// //set the cookie values
// document.cookie = "AID=" + aID + ";path=/";
// document.cookie = "Hours=" + hours + ";path=/";
// var r = window.showModalDialog(strUrl,'',strFeatures);
// if(r == true)
// {
//  document.Forms[0].TextboxDepartment.value = '1';
// }
// else
// {
//  document.Forms[0].TextboxDepartment.value = '0';
// }
//}

