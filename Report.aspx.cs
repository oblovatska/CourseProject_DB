using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace CourseProject
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

    /*    private void DownloadFile(string fname, bool forceDownload)
        {
            string path = MapPath(fname);
            string name = Path.GetFileName(path);
            string ext = Path.GetExtension(path);
            string type = "";
            // set known types based on file extension  
            if (ext != null)
            {
                switch (ext.ToLower())
                {
                    case ".htm":
                    case ".html":
                        type = "text/HTML";
                        break;

                    case ".txt":
                        type = "text/plain";
                        break;

                    case ".doc":
                    case ".rtf":
                        type = "Application/msword";
                        break;
                }
            }
            if (forceDownload)
            {
                Response.AppendHeader("content-disposition",
                    "attachment; filename=" + name);
            }
            if (type != "")
                Response.ContentType = type;
            Response.WriteFile(path);
            Response.End();
        }
        */
        protected void SaveReport1_Click(object sender, EventArgs e)
        {
            string path = "report.doc";
            ReportWord.repot_word("SELECT Service_.Name AS Назва_послуги, COUNT(*) AS Кількість_клієнтів FROM Service_, SeasonTicket WHERE SeasonTicket.service_ID = Service_.Service_ID GROUP BY Service_.Name ORDER BY Кількість_клієнтів DESC", true);
        }

        protected void Report2_Click(object sender, EventArgs e)
        {
            ReportWord.repot_word("SELECT Service_.Name AS Назва_послуги, ROUND(SUM(SeasonTicket.Cost),2) AS Прибуток FROM Service_, SeasonTicket WHERE SeasonTicket.service_ID = Service_.Service_ID GROUP BY Service_.Name ORDER BY Прибуток DESC", false);
        }
    }
}