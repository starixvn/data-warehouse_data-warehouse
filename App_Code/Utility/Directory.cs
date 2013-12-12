using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.ComponentModel;

namespace System.Business
{
    [DataObject]
    public class Directory
    {
        public Directory()
        {
            _table.Columns.Add("Name");
            _table.Columns.Add("Path");
            _table.Columns.Add("FullName");
            _table.Columns.Add("Type");
            _table.Columns.Add("Index");
        }

        private DataTable _table = new DataTable();

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetDirectory(string sourcePath, string size, int index)
        {
            string fullPath = HttpContext.Current.Server.MapPath(sourcePath + size);
            System.IO.DirectoryInfo sourceDir = new System.IO.DirectoryInfo(fullPath);

            if (sourceDir.Exists)
            {
                foreach (System.IO.FileInfo file in sourceDir.GetFiles())
                {

                    DataRow _row = _table.NewRow();
                    _row["Name"] = file.Name;
                    _row["Path"] = sourcePath;
                    _row["FullName"] = sourcePath + size + "/" + file.Name;
                    _row["Type"] = "File";
                    _row["Index"] = index;
                    _table.Rows.Add(_row);
                }

                foreach (System.IO.DirectoryInfo dir in sourceDir.GetDirectories())
                {
                    DataRow _row = _table.NewRow();
                    _row["Name"] = dir.Name;
                    _row["Path"] = sourcePath;
                    _row["FullName"] = sourcePath + size + "/" + dir.Name;
                    _row["Type"] = "Folder";
                    _row["Index"] = index;
                    _table.Rows.Add(_row);
                    GetDirectory(dir.FullName, size, index + 1);
                }
            }

            return _table;
        }
    }
}
