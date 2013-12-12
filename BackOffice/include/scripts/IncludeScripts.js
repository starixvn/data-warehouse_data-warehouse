_editor_url = "./";
_editor_lang = "en";
var agt = navigator.userAgent.toLowerCase();
var is_ie = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
var is_opera  = (agt.indexOf("opera") != -1);
var is_mac	   = (agt.indexOf("mac") != -1);
var is_mac_ie = (is_ie && is_mac);
var is_win_ie = (is_ie && !is_mac);
var is_gecko  = (navigator.product == "Gecko");

function getJsInc(path) {
	return "<script src='" + path + "?" + buildNumber + "' type='text/javascript'></script>";
}

var buildNumber = '5500';

/**
 * This is an include script which will load all the necessary js files 
 * to run successfully. Any new js file should be added here.
 *
 * @contextPath	indicates the contextPath of the current application
 * @htmlArea	indicates whether scripts related to HTMLArea should be added or not
 */
function includeScripts(contextPath, htmlArea,number,locale) {
	if(locale != null ) {
	_editor_lang=locale.toLowerCase();
	}
	var scriptsToInclude = "";
	// Common 
	if(number != null ) {
		buildNumber = number;
	}

	scriptsToInclude += getJsInc(contextPath + "../Include/scripts/Popup.js");

	scriptsToInclude += getJsInc(contextPath + "../Include/scripts/common.js");
	// Calendar
	scriptsToInclude += getJsInc(contextPath + "../Include/scripts/calendar.js");
	scriptsToInclude += getJsInc(contextPath + "../Include/scripts/calendar-en.js");
	scriptsToInclude += getJsInc(contextPath + "../Include/scripts/calendar-setup.js");

    scriptsToInclude += getJsInc(contextPath + "../Include/scripts/CheckBoxAll.js");

	document.writeln(scriptsToInclude);
}

