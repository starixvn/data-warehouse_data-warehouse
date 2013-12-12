using System;
using System.IO;

namespace System.Business
{
    public class FileUtility
    {
        public static void DirectoryExist(string Path)
        {
            if (!System.IO.Directory.Exists(Path))
            {
                System.IO.Directory.CreateDirectory(Path);
            }
        }

        public static bool FileExist(string Path)
        {
            bool flag = false;
            if (File.Exists(Path))
            {
                flag = true;
            }
            return flag;
        }

        public static string GetFilePath(string FileName, string ReportName)
        {
            string filePath = string.Empty;
            filePath = ReportName.Replace("MIS", "").Replace("SR", "") + "/" + System.Utility.ServiceUtility.GetUserName() + "/" + FileName;
            if (filePath.StartsWith("/"))
            {
                filePath = filePath.Substring(filePath.IndexOf("/") + 1);
            }
            return filePath;
        }

        public static bool IsExisted(string FilePath)
        {
            return System.Business.FileUtility.FileExist(FilePath);
        }
    }
}
