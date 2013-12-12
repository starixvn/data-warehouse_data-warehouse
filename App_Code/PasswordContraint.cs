using System;
using System.Collections.Generic;
using System.Web;
using System.Utility;

/// <summary>
/// Summary description for PasswordContraint
/// </summary>
public class PasswordContraint
{
    private const string FORCECHANGEPWD_KEY = "IsForceChangePwd";

    private string _roleName = string.Empty;
    private string _locale = string.Empty;
    private string _username = string.Empty;
    private string _password = string.Empty;
    private bool _isForceChangePassword = false;
    private System.FrameWork.FWUser _fwUser = null;
    private string _userId = string.Empty;

    public string UserId
    {
        get 
        {
            if (string.IsNullOrEmpty(this._userId))
            {
                this._userId = _fwUser.GetUserIDByUserName(_username);
            }
            return _userId; 
        }
    }

    public System.FrameWork.FWUser FwUser
    {
        get 
        {
            if (this._fwUser == null)
            {
                this._fwUser = new System.FrameWork.FWUser();
            }
            return _fwUser; 
        }
    }

    public string RoleName
    {
      get { return _roleName; }
      set { _roleName = value; }
    }
    
    public string Locale
    {
        get { return _locale; }
        set { _locale = value; }
    }

    public bool IsForceChangePassword
    {
        get { return _isForceChangePassword; }
    }
    
    public PasswordContraint(string username, string password)
    {
        this._username = username;
        this._password = password;
        this._isForceChangePassword = FwUser.GetForceChangePwdByUserName(username);
    }

    public PasswordContraint(string username)
    {
        this._username = username;
        this._password = string.Empty;
        this._isForceChangePassword = FwUser.GetForceChangePwdByUserName(username);
    }

    public bool ForceChangePassword(bool enabled)
    {
        bool returnValue = FwUser.ForceChangePassword(UserId, enabled);
        _isForceChangePassword = enabled;
        return returnValue;
    }

    public string CheckPasswordValid()
    {
        return PasswordPolicies.CheckPasswordValid(_username, _password);
    }

    public static void SaveToSession(object value)
    {
        HttpContext.Current.Session[FORCECHANGEPWD_KEY] = value;
    }

    public static object ReadFromSession()
    {
        if (HttpContext.Current.Session[FORCECHANGEPWD_KEY] != null)
        {
            return HttpContext.Current.Session[FORCECHANGEPWD_KEY];
        }
        return null;
    }
}
