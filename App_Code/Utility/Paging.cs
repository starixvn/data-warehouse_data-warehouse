using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace System.Utility
{
    /// <summary>
    /// Summary description for Paging
    /// </summary>
    public class Paging
    {
        public Paging()
        {
        }

        public static void SetPagerStates(GridView gridView, GridViewRow row)
        {
            int pageIndex = gridView.PageIndex;
            int pageCount = gridView.PageCount;
            int pageSize = gridView.PageSize;

            TextBox txPageIndex = (TextBox)row.FindControl("txPageIndex");
            TextBox txtPageSize = (TextBox)row.FindControl("txtPageSize");
            ImageButton btPageIndex = (ImageButton)row.FindControl("btPageIndex");
            ImageButton btPageSize = (ImageButton)row.FindControl("btPageSize");
            Label pageShow = (Label)row.FindControl("pageShow");
            Label pageCurrent = (Label)row.FindControl("pageCurrent");

            btPageIndex.Click += delegate
            {
                if (txPageIndex.Text != "")
                {
                    gridView.PageIndex = int.Parse(txPageIndex.Text) - 1;
                    gridView.DataBind();
                }
            };

            btPageSize.Click += delegate
            {
                if (txtPageSize.Text != "")
                {
                    gridView.PageSize = int.Parse(txtPageSize.Text);
                    gridView.DataBind();
                }
            };

            txPageIndex.Text = Convert.ToString(pageIndex + 1);
            txtPageSize.Text = Convert.ToString(pageSize);
            //pageShow.Text = "Show " + Convert.ToString(pageIndex + 1) + " - " + pageCount.ToString() + " From " + pageCount.ToString();
            pageShow.Text = pageCount.ToString();
            pageCurrent.Text = Convert.ToString(pageIndex + 1);
        }

        public static void OnMouseOver(GridViewRowEventArgs e)
        {
            e.Row.Attributes.Add("OnMouseOver", "style.backgroundColor='#DDEAF0'");
            int index = e.Row.RowIndex;

            if ((index % 2) == 0)
            {
                e.Row.Attributes.Add("OnMouseOut", "style.backgroundColor='#FFFFFF'");
            }
            else
            {
                e.Row.Attributes.Add("OnMouseOut", "style.backgroundColor='#ECECEC'");
            }
        }
    }
}
