function selectUser(form, userId)
{
    form.userList.value = userId;
    form.submit();
}

function showOwner()
{
	if(document.WorkOrderForm.assignTo.value == 'Technician')
	{
		var id = document.getElementById('assignTech');
		if (id.style.display == "none")
		{
			eval("id.style.display = 'block';");
		}
		var id1 = document.getElementById('assignQueue');
		if (id1.style.display == "block")
		{
			eval("id1.style.display = 'none';");
		}
	}
	else if(document.WorkOrderForm.assignTo.value == 'Queue')
	{
		var id = document.getElementById('assignTech');
		if (id.style.display == "block")
		{
			eval("id.style.display = 'none';");
		}
		var id1 = document.getElementById('assignQueue');
		if (id1.style.display == "none")
		{
			eval("id1.style.display = 'block';");
		}
	}
	else if(document.WorkOrderForm.assignTo.value == 'None')
	{
		var id = document.getElementById('assignTech');
		if (id.style.display == "block")
		{
			eval("id.style.display = 'none';");
		}
		var id1 = document.getElementById('assignQueue');
		if (id1.style.display == "block")
		{
			eval("id1.style.display = 'none';");
		}
	}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);



function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

var oPrevElement;
// click hover normal
function styleSwap(oElement, sEvent, sOff, sOn) {
	var cssClass
		if(sEvent == 'click') {
			if(oPrevElement != null) {
				oPrevElement.className = sOff;
			}
			if (oElement) { oElement.className = sOff; }
			oPrevElement = oElement; 
		}
		else {

			if (sEvent=='hover') cssClass = sOn;
			else cssClass = sOff;
			if (oPrevElement==null) {
				oElement.className = cssClass;
			}
			else {
				if(oPrevElement.id != oElement.id) {
					oElement.className = cssClass;
				}
			}
		}
}


function loader(did){
	var mid = document.getElementById(did);
	if(readCookie(mid)=="show"){
		eval("mid.style.display = 'block';");

	}else if(readCookie(mid)=="hide"){
		eval("mid.style.display = 'none';");
	}
}



function ShowHide(divId)
{
	var id = document.getElementById(divId);
	if (id.style.display == "none")
	{
		createCookie(id, 'show', 30);
		eval("id.style.display = 'block';");
		//alert ("Show hide loop : blocked"+"\n"+divId+" "+readCookie(id));
	}
	else
	{
		createCookie(id, 'hide', 30);
		eval("id.style.display = 'none';");
		//alert ("Show hide loop : None "+"\n"+divId+" "+readCookie(id));
	}
}

function ShowReqTab(divIdToShow)
{
	var idToShow = document.getElementById(divIdToShow);
	if(divIdToShow=="reqDetails")
	{
		var idToHide = document.getElementById("reqHistory");
		eval("idToHide.style.display = 'none';");
		var idToHide = document.getElementById("resolution");
		eval("idToHide.style.display = 'none';");
	}
	else if(divIdToShow=="resolution")
	{
		var idToHide = document.getElementById("reqDetails");
		eval("idToHide.style.display = 'none';");
		var idToHide = document.getElementById("reqHistory");
		eval("idToHide.style.display = 'none';");
	}
	else if(divIdToShow=="reqHistory")
	{
		var idToHide = document.getElementById("reqDetails");
		eval("idToHide.style.display = 'none';");
		var idToHide = document.getElementById("resolution");
		eval("idToHide.style.display = 'none';");
	}

	eval("idToShow.style.display = 'block';");
	//createCookie(divIdToShow, idToShow+'reqViewShow', 30);
	//createCookie(divIdToHide, idToHide+'reqViewHide', 30);
}


function ShowProductTab(divIdToShow)
{
	var idToShow = document.getElementById(divIdToShow);
	if(divIdToShow=="productDetails")
	{
		var idToHide = document.getElementById("associatedVendors");
		eval("idToHide.style.display = 'none';");
	}
	else if(divIdToShow=="associatedVendors")
	{
		var idToHide = document.getElementById("productDetails");
		eval("idToHide.style.display = 'none';");
	}
	else if(divIdToShow=="vendorDetails")
	{
		var idToHide = document.getElementById("associatedProducts");
		eval("idToHide.style.display = 'none';");
	}
	else if(divIdToShow=="associatedProducts")
	{
		var idToHide = document.getElementById("vendorDetails");
		eval("idToHide.style.display = 'none';");
	}

	eval("idToShow.style.display = 'block';");
}

function createCookie(name, value, days)
{
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
    }
  else var expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name)
{
  var ca = document.cookie.split(';');
  var nameEQ = name + "=";
  for(var i=0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1, c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
  return null;
}

function eraseCookie(name)
{
  createCookie(name, "", -1);
}







function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;}
  
function checkinteger(order)
{
	var x=order.value

	var anum=/(^\d+$)|(^\d+\.\d+$)/
	if (x!=null && x!="" && anum.test(x))
	{	
		testresult=true
		if(x.indexOf(".")>=0)
		{
			testresult=false
		}
		maxVal = Math.max(x,2147483648);
		if(maxVal!=2147483648 || x==maxVal)
		{
			testresult=false
		}
	}
	else
	{
		testresult=false
	}
	return (testresult)
}

function checkintegervalue(x)
{
	var anum=/(^\d+$)|(^\d+\.\d+$)/
	if (x!=null && x!="" && anum.test(x))
	{	
		testresult=true
		if(x.indexOf(".")>=0)
		{
			testresult=false
		}
		maxVal = Math.max(x,2147483648);
		if(maxVal!=2147483648 || x==maxVal)
		{
			testresult=false
		}
	}
	else
	{
		testresult=false
	}
	return (testresult)
}

function checklong(order)
{
	var x=order.value

	var anum=/(^\d+$)|(^\d+\.\d+$)/
	if (x!=null && x!="" && anum.test(x))
	{	
		testresult=true
		if(x.indexOf(".")>=0)
		{
			testresult=false
		}
		maxVal = Math.max(x,9223372036854775808);
		if(maxVal!=9223372036854775808 || x==maxVal)
		{
			testresult=false
		}
	}
	else
	{
		testresult=false
	}
	return (testresult)
}

function checknumber(order)
{
	var x=order.value

	var anum=/(^\d+$)|(^\d+\.\d+$)/
	if (x!=null && x!="" && anum.test(x))
	{	
		testresult=true
	}
	else
	{
		alert(document.getElementById('invalidnumber').value)
		testresult=false
	}
	return (testresult)
}


function Show(divId)
{
	var id = document.getElementById(divId);
	if (id.style.display == "none")
	{
		createCookie(id, 'show', 30);
		eval("id.style.display = 'block';");
	}
	else
	{
		createCookie(id, 'hide', 30);
		eval("id.style.display = 'block';");
	}
}

function quickReqValidate(form)
{
	if(trim(form.reqName.value)=="")
	{
		alert(document.getElementById("askreqname").value);
		form.reqName.focus();
		return false;
	}
	if(trim(form.title.value)=="")
	{
		alert(document.getElementById("askreqtitle").value);
		form.title.focus();
		return false;
	}

	checkUserExists(form)
	return false;
}

function confirmSubmit(confirmStr)
{
	var agree=confirm(confirmStr);
	if(agree)
	{
		return true ;
	}
	else
	{
		return false ;
	}
}


function loadme()
{
	var e=document.getElementsByTagName("div");
	var temp1 = document.getElementsByName("tabName")[0];
	var temp2 = document.getElementsByName("loggedUserID")[0];
	if(temp1 != null && temp2 != null)
	{
	var module = document.getElementsByName("tabName")[0].value;
	var userID = document.getElementsByName("loggedUserID")[0].value;
	for(var i=0;i<e.length;i++)
	{
		if(e[i].id!=null)
		{
			var bulletObj=MM_findObj("bullet"+e[i].id);
			if(readCookie(userID+module+e[i].id)==e[i].id+"show" )
			{
				eval("e[i].style.display = 'block';");
                                if(bulletObj != null)
                                {
        				bulletObj.src="images/actionitems_expand.gif";
                                }
			}
			if(readCookie(userID+module+e[i].id)==e[i].id+"hide" )
			{
				eval("e[i].style.display = 'none';");
                                if(bulletObj != null)
                                {
        				bulletObj.src="images/actionitems_collapse.gif";
                                }
			}
		}
	}
	}
}

function loadmeadmin()
{
	div1 = document.getElementById('helpcoll');
	div2 = document.getElementById('helpexp');

	var module = document.getElementsByName("tabName")[0].value;
	var userID = document.getElementsByName("loggedUserID")[0].value;
	if(readCookie(userID+module+div1.id)==div1.id+"show" )
	{
		eval("div1.style.display = 'block';");
		eval("div2.style.display = 'none';");
	}
	else if(readCookie(userID+module+div2.id)==div2.id+"show" )
	{
		eval("div1.style.display = 'none';");
		eval("div2.style.display = 'block';");
	}
	else
	{
		eval("div1.style.display = 'block';");
		eval("div2.style.display = 'none';");
		swap2LayerC('helpexp','helpcoll');
	}
}

function toggleSwipe(gName)
{
	var selRowObj = document.getElementById(gName);
	var bulletObj=MM_findObj("bullet" + gName);
	if (selRowObj.style.display == 'none')
	{
		eval("selRowObj.style.display = 'block';");
		bulletObj.src="../Include/images/actionitems_expand.gif";
	}
	else if(selRowObj.style.display == 'block')
	{
		eval("selRowObj.style.display = 'none';");
		bulletObj.src="../Include/images/actionitems_collapse.gif";
	}
	else if(selRowObj.style.display == '')
	{
		eval("selRowObj.style.display = 'none';");
		bulletObj.src="../Include/images/actionitems_collapse.gif";
	}
}

function toggleSwipe1(gName)
{
	var selRowObj = document.getElementById(gName);
	if (selRowObj.style.display == 'none')
	{
		eval("selRowObj.style.display = 'block';");
	}
	else if(selRowObj.style.display == 'block')
	{
		eval("selRowObj.style.display = 'none';");
	}
	else if(selRowObj.style.display == '')
	{
		eval("selRowObj.style.display = 'none';");
	}
}

function swapLayer(showDiv,HideDiv)
{
	var showdiv = document.getElementById(showDiv);
	var hidediv = document.getElementById(HideDiv);
	eval("showdiv.style.display = 'block';");
	eval("hidediv.style.display = 'none';");
}

function onClickSwapLayer(showDiv,HideDiv)
{
	swapLayer(showDiv,HideDiv);
	var id1 = document.getElementById("success_message");
	if(id1!=null)
	{
		eval("id1.style.display = 'none';");
	}

	var id2 = document.getElementById("error_message");
	if(id2!=null)
	{
		eval("id2.style.display = 'none';");
	}
}

function swap2Layer(toShow,toHide)
{
   var idToShow = document.getElementById(toShow);
   var idToHide = document.getElementById(toHide);
   eval("idToShow.style.display = 'block';");
   eval("idToHide.style.display = 'none';");
}

function swapLayer3(toShow,toHide1,toHide2)
{
   swap2Layer(toShow,toHide1);
   var idToHide2 = document.getElementById(toHide2);
   eval("idToHide2.style.display = 'none';");
}

function swapLayer4(toShow,toHide1,toHide2,toHide3)
{
   swap2Layer(toShow,toHide1);
   var idToHide2 = document.getElementById(toHide2);
   eval("idToHide2.style.display = 'none';");
   var idToHide3 = document.getElementById(toHide3);
   eval("idToHide3.style.display = 'none';");

   var module = document.getElementsByName("tabName")[0].value;   
   var userID = document.getElementsByName("loggedUserID")[0].value;

   createCookie(userID+module+toShow, toShow+'show', 30);
   createCookie(userID+module+toHide1, toHide1+'hide', 30);
   createCookie(userID+module+toHide2, toHide2+'hide', 30);
   createCookie(userID+module+toHide3, toHide3+'hide', 30);
}

function swap2LayerC(showDiv,HideDiv)
{
   var showdiv = document.getElementById(showDiv);
   var hidediv = document.getElementById(HideDiv);
   var module = document.getElementsByName("tabName")[0].value;   
   var userID = document.getElementsByName("loggedUserID")[0].value;
   if(showdiv!=null && showdiv!='')
   {
	eval("showdiv.style.display = 'block';");
   }
   if(hidediv!=null && hidediv!='')
   {
   	eval("hidediv.style.display = 'none';");
   }
   createCookie(userID+module+showDiv, showDiv+'show', 30);
   createCookie(userID+module+HideDiv, HideDiv+'hide', 30);
}

function trimAll(str)
{
	/*************************************************************
	  Input Parameter :str
Purpose         : remove all white spaces in front and back of string
Return          : str without white spaces    
	 ***************************************************************/

	//check for all spaces
	var objRegExp =/^(\s*)$/;
	if (objRegExp.test(str))
	{
		str = str.replace(objRegExp,''); 
		if (str.length == 0)
			return str; 
	} 

	//  check for leading and trailling spaces
	objRegExp = /^(\s*)([\W\w]*)(\b\s*$)/;
	if(objRegExp.test(str))
	{
		str = str.replace(objRegExp, '$2');
	}
	return str;
}

function beforePOCancel()
{
	if(window.confirm(document.getElementById("confirmMsg").value))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function checkForUDFNumeric()
{
	num1 = document.getElementsByName("udfName1")[0];
	if(num1!=null && num1.value!=null && num1.value!='')
	{
		if(!checklong(num1))
		{
			num1.focus();
			return false;
		}
	}
	num2 = document.getElementsByName("udfName2")[0];
	if(num2!=null && num2.value!=null && num2.value!='')
	{
		if(!checklong(num2))
		{
			num2.focus();
			return false;
		}
	}
	num2 = document.getElementsByName("udfName11")[0];
	if(num2!=null && num2.value!=null && num2.value!='')
	{
		if(!checklong(num2))
		{
			num2.focus();
			return false;
		}
	}
	num2 = document.getElementsByName("udfName12")[0];
	if(num2!=null && num2.value!=null && num2.value!='')
	{
		if(!checklong(num2))
		{
			num2.focus();
			return false;
		}
	}

	return true;
}

function validateIP(ip)
{
	val = trimAll(ip.value);
	if(val.indexOf(".")>0)
	{
		val1 = val.substring(0,val.indexOf("."));
		if(checkintegervalue(val1))
		{
			max2 = Math.max(val1,256);
			if(max2!=256 || val1==max2)
			{
				ip.focus();
				return false;
			}
		}
		else
		{
			ip.focus();
			return false;
		}
		val = val.substring(val.indexOf(".")+1,val.length);
		if(val.indexOf(".")>0)
		{
			val1 = val.substring(0,val.indexOf("."));
			if(checkintegervalue(val1))
			{
				max2 = Math.max(val1,256);
				if(max2!=256 || val1==max2)
				{
					ip.focus();
					return false;
				}
			}
			else
			{
				ip.focus();
				return false;
			}
			val = val.substring(val.indexOf(".")+1,val.length);
			if(val.indexOf(".")>0)
			{
				val1 = val.substring(0,val.indexOf("."));
				if(checkintegervalue(val1))
				{
					max2 = Math.max(val1,256);
					if(max2!=256 || val1==max2)
					{
						ip.focus();
						return false;
					}
				}
				else
				{
					ip.focus();
					return false;
				}
				val = val.substring(val.indexOf(".")+1,val.length);
				if(checkintegervalue(val))
				{
					max2 = Math.max(val,256);
					if(max2!=256 || val==max2)
					{
						ip.focus();
						return false;
					}
				}
				else
				{
					ip.focus();
					return false;
				}
			}
			else
			{
				ip.focus();
				return false;
			}
		}
		else
		{
			ip.focus();
			return false;
		}
	}
	else
	{
		ip.focus();
		return false;
	}
	return true;
}

function checkForIntegerZero(order)
{
	var x=order.value;
	if(!checkinteger(order))
	{
		return false;
	}
  	for(var i=0; i < x.length; i++)
	{
		y = x.charAt(i);
		if(y=='0')
		{
			x = x.substring(i+1,x.length);
			i--;
			if(i<0 && x.length==0)
			{
				break;
			}
		}
		else
		{
			break;
		}
	}
	order.value=x;
	if(x==null || x=='')
	{
		return false;
	}
	else
	{
		return true;
	}
}

function ruleSelection(oElement, val)
{
	ele1 = document.getElementById('operatorID'+val);
	ele2 = document.getElementById('rowTextID'+val);
	alert(" ruleSelection ")
	sOff = 'rowselected';
	textC = 'formStyleTextSel';
	if(oElement)
	{
		oElement.className = sOff;
	}
	if(ele1)
	{
		ele1.className = textC;
	}
	if(ele2)
	{
		ele2.className = textC;
	}
}


function openWindow(theURL,winName,features,w,h) { //v2.0

     /*var winl = (screen.width/2)-(wwidth/2);
     var wint = (screen.height/2)-(wheight/2);*/
     //features = features+',top='+wint+',left='+winl;
//	 alert(features);
	 LeftPosition=(screen.width)?(screen.width-w)/2:100;
	 TopPosition=(screen.height)?(screen.height-h)/2:100;
	 features = features + ',top='+TopPosition+',left='+LeftPosition;
	 window.open(theURL,winName,features);
}


function disableForDemo()
{
	alert("This feature is disabled for the Online Demo");
	return false;
}

function formChoose(labelId, onclass, offclass)
{
	var id = document.getElementById(labelId);
	var e=document.getElementsByTagName("label");
	for(var i=0;i<e.length;i++)
	{
		if(e[i].id!=null)
		{
			//          alert("e[i].id = "+e[i].id);
			var bulletObj=MM_findObj(e[i].id);
			bulletObj.className= offclass;

		}
	}

	id.className = onclass ;
}


function selectRow(elementId, onclass, offclass)
{
	var eid = document.getElementById(elementId);
	var e=document.getElementsByTagName("tr");
	for(var i=0;i<e.length;i++)
	{
		if(eid[i].id!=null)
		{
//			alert("e[i].id = "+e[i].id);
			var eObj=MM_findObj(eid[i].id);
			eObj.className= offclass;

		}
	}

	eid.className = onclass ;

}


function threadShowhide(gName)
{
	var selRowObj = document.getElementById(gName);
	var bulletObj=MM_findObj("bullet"+gName);
	if (selRowObj.style.display == 'none')     
	{
		eval("selRowObj.style.display = 'block';");
		bulletObj.src="images/threadcollapse.gif";
	}
	else if(selRowObj.style.display == 'block')     
	{
		eval("selRowObj.style.display = 'none';");
		bulletObj.src="images/threadexpand.gif";
	}
	else if(selRowObj.style.display == '')      
	{
		eval("selRowObj.style.display = 'block';");
		bulletObj.src="images/threadcollapse.gif";
	}
}


function threadinit()
{
	window.name="main";
	var e=document.getElementsByTagName("div");
	var module = document.getElementsByName("tabName")[0].value;
	//var userID = document.getElementsByName("loggedUserID")[0].value;
	for(var i=0;i<e.length;i++)
	{
		if(e[i].id!=null)
		{
			var bulletObj=MM_findObj("bullet"+e[i].id);
			if(readCookie(module+e[i].id)==e[i].id+"show" )
			{
				eval("e[i].style.display = 'block';");
				bulletObj.src="images/threadcollapse.gif";
			}
			if(readCookie(module+e[i].id)==e[i].id+"hide" )
			{
				eval("e[i].style.display = 'none';");
				bulletObj.src="images/threadexpand.gif";
			}
		}
	}
}

function threadshowhide(val)
{
	window.name="main";
	var e=document.getElementsByTagName("div");
	var module = document.getElementsByName("tabName")[0].value;
	//var userID = document.getElementsByName("loggedUserID")[0].value;
	for(var i=0;i<e.length;i++)
	{
		divID = e[i].id;
		ind = divID.indexOf("thread");
		if(e[i].id!=null && ind==0)
		{
			var bulletObj=MM_findObj("bullet"+e[i].id);
			//if(readCookie(module+e[i].id)==e[i].id+"show" )
			if(val!=null && val=='show')
			{
				eval("e[i].style.display = 'block';");
				bulletObj.src="images/threadcollapse.gif";
			}
			else if(val!=null && val=='hide')
			//if(readCookie(module+e[i].id)==e[i].id+"hide" )
			{
				eval("e[i].style.display = 'none';");
				bulletObj.src="images/threadexpand.gif";
			}
		}
	}
}

function copyListValues(formName,from,to)
{
	fromList = eval('document.'+formName+'.'+ from);
	toList = eval('document.'+formName+'.'+ to);
	
	if (toList.options.length > 0 && toList.options[0].value == '0')
	{
		toList.options.length = 0;
	}
	var sel = false;
	for (i=0;i<fromList.options.length;i++)
	{
		var current = fromList.options[i];
		if (current.selected)
		{
			sel = true;
			if (current.value == '0')
			{
				alert (document.getElementById('invalidselection').value);
				return;
			}
			txt = current.text;
			val = current.value;
			len = toList.length;
			var present = false;
			for (role=0;role<len;role++)
			{
				if(current.value == toList.options[role].value)
				{
					present = true;
					break;
				}
				else
				{
					continue;
				}
			}
			if(!present)
			{
				toList.options[toList.length] = new Option(txt,val);
			}
			fromList.options[i] = null;
			i--;
		}
	}
	if (!sel) alert (document.getElementById('noselection').value);
}
function addIt(picklist,tf)
{
 /* uncomment this to see what it is adding as it is adding it */
 /* alert(picklist.picklist1.options.length+"\n"+picklist.t1.value+"\n"+picklist.t0.value); */

    // empty items cannot be added..
    if(tf.value == "")
    {
        return false;
    }

 var NI = picklist.options.length++;
picklist.options[NI].text=tf.value;
tf.value = "";
return true;
//document.udf.picklist1.options[NI].value=document.udf.t0.value;
}
/*function showIt()
{
  var SI = document.udf.picklist1.selectedIndex;
  var ST = document.udf.picklist1.options[SI].text;
//  var SV = document.udf.picklist1.options[SI].value;
  alert("Selected Index="+SI+"\nSelected Text="+ST+"\nSelected Value="+SV);
}*/

function deSelect(picklist)
{
if(picklist.selectedIndex>=0)
    picklist.selectedIndex = -1;
else
    alert(document.getElementById('noselection').value);
}


function removeFromList(listField) {
   if ( listField.length == -1) {  // If the list is empty
      alert(document.getElementById('nopicklist').value);
   } else {
      var selected = listField.selectedIndex;
      if (selected == -1) {
         alert(document.getElementById('choosepicklist').value);
      } else {  // Build arrays with the text and values to remain
         var replaceTextArray = new Array(listField.length-1);
         var replaceValueArray = new Array(listField.length-1);
         for (var i = 0; i < listField.length; i++) {
            // Put everything except the selected one into the array
            if ( i < selected) { replaceTextArray[i] = listField.options[i].text; }
            if ( i > selected ) { replaceTextArray[i-1] = listField.options[i].text; }
            if ( i < selected) { replaceValueArray[i] = listField.options[i].value; }
            if ( i > selected ) { replaceValueArray[i-1] = listField.options[i].value; }
         }
         listField.length = replaceTextArray.length;  // Shorten the input list
         for (i = 0; i < replaceTextArray.length; i++) { // Put the array back into the list
            listField.options[i].value = replaceValueArray[i];
            listField.options[i].text = replaceTextArray[i];
         }
      } // Ends the check to make sure something was selected
   } // Ends the check for there being none in the list
}


function chooseType(toShow,toHide1,toHide2)
{
   var idToShow = document.getElementById(toShow);
   var idToHide1 = document.getElementById(toHide1);
   var idToHide2 = document.getElementById(toHide2);

   eval("idToShow.style.display = 'block';");
   eval("idToHide1.style.display = 'none';");
   eval("idToHide2.style.display = 'none';");


   var module = document.getElementsByName("tabName")[0].value;  
//   var userID = document.getElementsByName("loggedUserID")[0].value;

//   createCookie(module+toShow, toShow+'show', 30);
//   createCookie(module+toHide1, toHide1+'hide', 30);
//   createCookie(module+toHide2, toHide2+'hide', 30);
}

function selectArowAlone(elementId, onclass, offclass)
{
	var eid = document.getElementById(elementId);
	var eObj=MM_findObj(eid.id);
	if(eObj.className==onclass)
		eObj.className=offclass;
	else
		eObj.className=onclass;
}



function selectArowAndCheck(string,elementId, onclass, offclass,quantity)
{
	var eid = document.getElementById(elementId);
	var roweid = document.getElementById("row"+elementId);
	var eObj=MM_findObj(roweid.id);

	if (string.indexOf("quanedit") == -1)
	{
		eid.checked = true;
		eObj.className=onclass;
	}
	else
	{
		eid.checked = false;
		eObj.className=offclass;
		document.getElementById("QuanOf"+elementId).value=quantity;
	}
}






function checkAll(thisForm, checkBoxCompName)
{
	toSelectAll = false;
	if(thisForm.CheckAllItems.checked)
	{
		toSelectAll = true;
	}
	var count =0;
	for(var i=0; i<thisForm.elements.length; i++)
	{
		if(thisForm.elements[i].type == checkBoxCompName)
		{
			thisForm.elements[i].checked = toSelectAll;
			var e = thisForm.elements[i].getAttribute("id");
			if(e  == "RememberMe327")
			{
				continue;
			}
			if (count%2 == 0)
			{
				if (toSelectAll)
				{
					//selectArow("row"+ e , 'rowHiliteb', 'rowoddn');
					selectArow("row"+ e , 'rowHiliteb');
				}
				else
				{
					//selectArow("row"+ e , 'rowoddn','rowHiliteb');
					selectArow("row"+ e , 'rowoddn');
				}
			}
			else
			{
				if (toSelectAll)
				{
					//selectArow("row"+e, 'rowHiliteb', 'rowevenn');
					selectArow("row"+e, 'rowHiliteb');
				}
				else
				{
					//selectArow("row"+e, 'rowevenn','rowHiliteb');
					selectArow("row"+e, 'rowevenn');
				}
			}
			count = count + 1;
		}
	}
}

function selectArow(elementId, onclass)
{
	var eid = document.getElementById(elementId);
	var eObj=MM_findObj(eid.id);
	eObj.className=onclass;
}


function checkValue(thisForm,quanAvailable,elementId,itemName)
{
	var eid = document.getElementById(elementId);
	var eidVal = eid.value;
	if (eidVal == 0)
    	{
        	alert(document.getElementById('zeroitems').value);
	        eid.value = quanAvailable;
        	eid.focus();
    	}
	var quantityAvailable = parseInt(quanAvailable);
	if (eidVal > quantityAvailable)
	{
		alert("Only "+quanAvailable+" of the item "+itemName+" are yet to be received");
		eid.value = quanAvailable;
		eid.focus();
	}

}

// I18N functions
/**
 *
 */
function loadMessageForKeys(keysList) {
	var xmlHttp = getXMLHttpRequest();
	var url = "/jsp/FetchMessage.jsp?";
	for(var i=0; i<keysList.length; i++) {
		url = url + "KEY=" + keysList[i] + "&";
	}
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange=function() {
		if(xmlHttp.readyState == 4) {
			var newObj = document.createElement("DIV");
			if(browser_ie){
				newObj.style.display = "none";
			}
			else if (browser_nn4 || browser_nn6){
				newObj.setAttribute("style","display:none;");
			}
			document.body.appendChild(newObj);
			newObj.innerHTML = xmlHttp.responseText;
		}
	}
	xmlHttp.send(null);
}

/**
 *
 */
function getMessageForKey(key) {
	var divObj = document.getElementById(key);
	if(divObj != null) {
		return divObj.innerHTML;
	}
	return null;
}

function showAll(elementId, elementName)
{
	var elements = document.getElementsByTagName(elementName);
	var isFirst = true;
	var firstId = null;
	for(var i=0; i<elements.length; i++) {
		if(elements[i].id != null && elements[i].id.indexOf(elementId) >= 0 ){
			if(isFirst) {
				isFirst = false;
				firstId = elements[i];
			}
			var selRowObj = elements[i];
			var gName = elements[i].id;
			var bulletObj=MM_findObj("bullet"+gName);
			selRowObj.className = 'show';
			if(bulletObj != null){
				bulletObj.src="images/threadcollapse.gif";
			}
		}
	}
	new Effect.ScrollTo(firstId);
}

function hideAll(elementId, elementName)
{
	var elements = document.getElementsByTagName(elementName);
	for(var i=0; i<elements.length; i++) {
		if(elements[i].id != null && elements[i].id.indexOf(elementId) >= 0 ){
			var selRowObj = elements[i];
			var gName = elements[i].id;
			var bulletObj=MM_findObj("bullet"+gName);
			selRowObj.className = 'hide';
			if(bulletObj != null){
				bulletObj.src="images/threadexpand.gif";
			}
		}
	}
}

var mcTableKeys = new Array('sdp.leftpanel.search.title','sdp.leftpanel.search.go');

function setSearchTitle(title, val) {
       for(var i=0; i<document.forms.length;i++) {
                var formObj = document.forms[i];
                for(var j=0; j<formObj.elements.length;j++) {
                        var element = formObj.elements[j];
                        if(element.name == "searchSubmit") {
                                element.title= title;
                                element.value= val;
                        }
                }
        }
}

function historyShowhide(gName)
{
	var selRowObj = document.getElementById("HIST_" + gName);
	var text = document.getElementById("HT_" + gName);
	if (selRowObj.className == 'hide')     
	{
		selRowObj.className = 'show';
		text.innerHTML = 'Collapse';
	}
	else if(selRowObj.className == 'show')     
	{
		selRowObj.className = 'hide';
		text.innerHTML = 'Expand';
	}
	else if(selRowObj.className == '')      
	{
		selRowObj.className = 'show';
		text.innerHTML = 'Collapse';
	}
}

function loadChineseStyle(win) {
        var xmlHttp = getXMLHttpRequest();
        var url = "/jsp/LoadStyle.jsp?";
        xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange=function() {
		if(xmlHttp.readyState == 4) {
			var elems = win.document.getElementsByTagName("link");
			if(xmlHttp.responseText.indexOf("style") >= 0) {
				for(var i=0; i<elems.length;i++) {
					var linkEl = elems[i];
					if(linkEl.href.indexOf('/style/style.css') >= 0) {
						//linkEl.href = '/style/style_zh.css';//xmlHttp.responseText; 
						linkEl.href = xmlHttp.responseText; 
						//break;	
					}
				}
			}
		}
	}
        xmlHttp.send(null);
}

function getXMLHttpRequest(){
        var xmlhttp=false;
        try {
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
                try {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch (E) {
                        xmlhttp = false;
                }
        }
        if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
                xmlhttp = new XMLHttpRequest();
        }
        return xmlhttp;
}
function accordion(toShow,toHide1,toHide2)
{
   var idToShow = document.getElementById(toShow);
   var idToHide1 = document.getElementById(toHide1);
   var idToHide2 = document.getElementById(toHide2);
   //var idToHide3 = document.getElementById(toHide3);
   
   eval("idToShow.style.display = 'block';");
   //eval("idToShow.style.height = '300px';");
   eval("idToShow.style.overflow = 'auto';");

   eval("idToHide1.style.display = 'none';");
   eval("idToHide2.style.display = 'none';");
   //eval("idToHide3.style.display = 'none';");

   //var module = document.getElementsByName("module")[0].value;   
//   var userID = document.getElementsByName("loggedUserID")[0].value;

   //createCookie(module+toShow, toShow+'show', 30);
   //createCookie(module+toHide1, toHide1+'hide', 30);
   //createCookie(module+toHide2, toHide2+'hide', 30);
   //createCookie(module+toHide3, toHide3+'hide', 30);
}



function accordionState()
{
	window.name="main";
	var e=document.getElementsByTagName("div");
	var module = document.getElementsByName("module")[0].value;
//	var userID = document.getElementsByName("loggedUserID")[0].value;
	for(var i=0;i<e.length;i++)
	{
		if(e[i].id!=null)
		{

			if(readCookie(module+e[i].id)==e[i].id+"show" )
			{
				eval("e[i].style.display = 'block';");
				eval("e[i].style.height = '300px';");
				eval("e[i].style.overflow = 'auto';");


				
			}
			if(readCookie(module+e[i].id)==e[i].id+"hide" )
			{
				eval("e[i].style.display = 'none';");
			}
		}
	}
}

