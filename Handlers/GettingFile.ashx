<%@ WebHandler Language="C#" Class="GettingFile" %>

using System;
using System.Web;
using System.Utility;

public class GettingFile : IHttpHandler, System.Web.SessionState.IReadOnlySessionState {
    
    public void ProcessRequest (HttpContext context) {
        if (context.User.Identity.IsAuthenticated)
        {
            string filename = context.Request.QueryString["file"];
            string reportname = context.Request.QueryString["name"];
            if (string.IsNullOrEmpty(filename) || string.IsNullOrEmpty(reportname))
            {
                return;
            }

            string Up_Directory = System.Configuration.ConfigurationManager.AppSettings["ReportDirectory"].ToString();//"~/BackOffice/Excel/";
            string rightPath = string.Empty;

            filename = SecurityData.Decrypt(filename.Replace(" ", "+"));
            reportname = SecurityData.Decrypt(reportname.Replace(" ", "+"));
            rightPath = System.Business.FileUtility.GetFilePath(filename, reportname);
            rightPath = Up_Directory + rightPath;
            if ((!string.IsNullOrEmpty(rightPath)) && System.Business.FileUtility.IsExisted(rightPath))
            {
                //Validate the file name and make sure it is one that the user may access
                context.Response.Buffer = true;
                context.Response.Clear();
                context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
                context.Response.ContentType = "application/vnd.ms-excel";
                context.Response.TransmitFile(rightPath);
                context.Response.End();
            }
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}