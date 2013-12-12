using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.ComponentModel;

namespace System.Utility
{
    [DataObject]
    public class UtilityDateTime
    {
        public UtilityDateTime()
        {
        }
        public static int GetMaxDayOfMonth(int Year, int Month)
        {
            return CultureInfo.CurrentCulture.Calendar.GetDaysInMonth(Year, Month);
        }
        public static int GetCurrentWeekOfYear()
        {
            return CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFullWeek, DayOfWeek.Monday);
        }
        public static int GetMaxWeekOfYear()
        {
            return CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(CultureInfo.CurrentCulture.Calendar.MaxSupportedDateTime, CalendarWeekRule.FirstFullWeek, DayOfWeek.Monday);
        }
        public static int GetCurrentYear()
        {
            return DateTime.Now.Year;
        }
        public static int GetCurrentMonth()
        {
            return DateTime.Now.Month;
        }

        public static string EndOfWeekly(int week)
        {
            int year = DateTime.Today.Year;
            CultureInfo _CultureInfo = new CultureInfo("en-US");
            DateTime startDate = new DateTime(year, 1, 1).AddDays((7 * week) - 1);
            return startDate.ToString("yyyy/MM/dd", _CultureInfo);
        }
        public static string StartOfWeekly(int week)
        {
            int year = DateTime.Today.Year;
            CultureInfo _CultureInfo = new CultureInfo("en-US");
            DateTime startDate = new DateTime(year, 1, 1).AddDays(7 * (week - 1));
            return startDate.ToString("yyyy/MM/dd", _CultureInfo);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetMonths()
        {
            DateTime month = Convert.ToDateTime("1/1/2000");
            DataTable table = new DataTable();
            table.Columns.Add("Value");
            table.Columns.Add("Text");
            for (int i = 0; i < 12; i++)
            {
                DateTime NextMonth = month.AddMonths(i);
                DataRow row = table.NewRow();
                row["Value"] = NextMonth.ToString("MM");
                row["Text"] = NextMonth.ToString("MMMM");

                table.Rows.Add(row);
            }

            return table;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetYears()
        {
            DateTime dateTime = DateTime.Now;
            CultureInfo _CultureInfo = new CultureInfo("en-US");
            string yyyy = dateTime.ToString("yyyy", _CultureInfo);
            int yearNow = int.Parse(yyyy);
            DataTable table = new DataTable();
            table.Columns.Add("Value");
            table.Columns.Add("Text");
            for (int i = 2004; i <= yearNow; i++)
            {
                DataRow row = table.NewRow();
                row["Value"] = i;
                row["Text"] = i;
                table.Rows.Add(row);
            }

            return table;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetFYE()
        {
            DateTime dateTime = DateTime.Now;
            CultureInfo _CultureInfo = new CultureInfo("en-US");
            string yyyy = dateTime.ToString("yyyy", _CultureInfo);
            int yearNow = int.Parse(yyyy);
            DataTable table = new DataTable();
            table.Columns.Add("Value");
            table.Columns.Add("Text");
            for (int i = 2004; i <= yearNow + 1; i++)
            {
                DataRow row = table.NewRow();
                row["Value"] = i;
                row["Text"] = i;
                table.Rows.Add(row);
            }

            return table;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetWeeks()
        {
            System.Text.StringBuilder WB = new System.Text.StringBuilder();
            int weekofyear = GetMaxWeekOfYear();
            int ThisWeek = GetCurrentWeekOfYear();
            DataTable table = new DataTable();
            table.Columns.Add("Value");
            table.Columns.Add("Text");
            for (int i = 1; i <= weekofyear; i++)
            {
                DataRow row = table.NewRow();
                row["Value"] = i;
                row["Text"] = i;
                table.Rows.Add(row);
            }
            return table;
        }
    }
}
