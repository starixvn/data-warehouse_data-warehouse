using System;
using System.Text;


/// <summary>
/// Summary description for DWRSControl
/// </summary>
public class DWRSControlManager
{
    #region Constructors

    public DWRSControlManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #endregion
}

public abstract class DWRSControl
{
    protected const int TYPE = 0;
    protected const int NAME = 1;
    protected const int VALUE = 2;
    protected const int CLICK = 3;
    protected const int CHECKED = 4;
    protected const int END = 5;
    protected const int CAPTION = 6;
}

public class DWRSTextBox : DWRSControl
{
    private static string[] tag = new string[] {
        "<input type='Text' ",
        "name='{0}' ",
        "value='{0}' ",
        "/>"
    };
    private string _Name = string.Empty;
    private string _Value = string.Empty;


    #region Constructors

    public DWRSTextBox(string name, string value)
    {
        this._Name = name;
        this._Value = value;
    }

    #endregion


    #region Properties

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
    
    public string Value
    {
        get { return _Value; }
        set { _Value = value; }
    }

    #endregion


    #region Render Control

    public string Render()
    {
        StringBuilder result = new StringBuilder();
        for (int idx = 0; idx < tag.Length; idx++)
        {
            if (idx == NAME)
            {
                result.AppendFormat(tag[idx], _Name);
            }
            else if (idx == VALUE)
            {
                result.AppendFormat(tag[idx], _Value);
            }
            else
            {
                result.Append(tag[idx]);
            }
        }

        return result.ToString();
    }

    #endregion
}

public class DWRSRadioButton : DWRSControl
{
    private static string[] tag = new string[] {
        "<input type='radio' ",
        "name='{0}' ",
        "value='{0}' ",
        "onclick=\"{0}\" ",
        "{0} ", //checked
        "/>",
        "{0}" //caption
    };
    private string _Name = string.Empty;
    private string _Value = string.Empty;
    private string _OnClick = string.Empty;
    private bool _IsCheck = false;


    #region Constructors

    public DWRSRadioButton(string name, string value)
    {
        this._Name = name;
        this._Value = value;
    }

    #endregion


    #region Properties

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    public string Value
    {
        get { return _Value; }
        set { _Value = value; }
    }

    public string OnClick
    {
        get { return _OnClick; }
        set { _OnClick = value; }
    }

    public bool IsCheck
    {
        get { return _IsCheck; }
        set { _IsCheck = value; }
    }

    #endregion


    #region Render Control

    public string Render(string caption)
    {
        StringBuilder result = new StringBuilder();
        for (int idx = 0; idx < tag.Length; idx++)
        {
            if (idx == NAME)
            {
                result.AppendFormat(tag[idx], _Name);
            }
            else if (idx == VALUE)
            {
                result.AppendFormat(tag[idx], _Value);
            }
            else if (idx == CLICK)
            {
                if (_OnClick.Length > 0)
                {
                    result.AppendFormat(tag[idx], _OnClick);
                }
            }
            else if (idx == CHECKED)
            {
                if (_IsCheck)
                {
                    result.AppendFormat(tag[idx], "checked");
                }
            }
            else if (idx == CAPTION)
            {
                result.AppendFormat(tag[idx], caption);
            }
            else
            {
                result.Append(tag[idx]);
            }
        }

        return result.ToString();
    }

    #endregion
}

public class DWRSCheckBox : DWRSControl
{
    private static string[] tag = new string[] {
        "<input type='checkbox' ",
        "name='{0}' ",
        "value='ON' ",
        "onclick=\"{0}\" ",
        "{0} ", //checked
        "/>",
        "{0}" //caption
    };
    private string _Name = string.Empty;
    private string _Value = string.Empty;
    private string _OnClick = string.Empty;
    private bool _IsCheck = false;


    #region Constructors

    public DWRSCheckBox(string name, string value)
    {
        this._Name = name;
        this._Value = value;
    }

    #endregion


    #region Properties

    public string Name
    {
        get { return _Name; }
    }

    public string Value
    {
        get { return _Value; }
    }

    public string OnClick
    {
        get { return _OnClick; }
        set { _OnClick = value; }
    }

    public bool IsCheck
    {
        get { return _IsCheck; }
        set { _IsCheck = value; }
    }

    #endregion


    #region Render Control

    public string Render(string caption)
    {
        StringBuilder result = new StringBuilder();
        for (int idx = 0; idx < tag.Length; idx++)
        {
            if (idx == NAME)
            {
                result.AppendFormat(tag[idx], _Name);
            }
            else if (idx == CLICK)
            {
                if (_OnClick.Length > 0)
                {
                    result.AppendFormat(tag[idx], _OnClick);
                }
            }
            else if (idx == CHECKED)
            {
                if (_IsCheck)
                {
                    result.AppendFormat(tag[idx], "checked");
                }
            }
            else if (idx == CAPTION)
            {
                result.AppendFormat(tag[idx], caption);
            }
            else
            {
                result.Append(tag[idx]);
            }
        }

        return result.ToString();
    }

    #endregion
}
