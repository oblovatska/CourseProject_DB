using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace CourseProject
{
    public partial class changeClassesForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string selectID(String sql, String whatToRead)
        {
            string ID = "";
            try
            {
                using (SqlConnection myConnection = new SqlConnection("Integrated Security=SSPI;Persist Security Info=False;" +
                               "Initial Catalog=CourseProject;Data Source=localhost"))
                {
                    SqlCommand oCmd = new SqlCommand(sql, myConnection);
                    myConnection.Open();
                    using (SqlDataReader oReader = oCmd.ExecuteReader())
                    {
                        while (oReader.Read())
                        {
                            ID = oReader[whatToRead].ToString();
                        }
                        myConnection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('При обробці даних виникла помилка.');", true);
                //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
            }
            return ID;
        }
        public bool insertUpdateDeleteData(String sql)
        {
            try
            {
                SqlConnection connect = null;
                connect = new SqlConnection("Integrated Security=SSPI;Persist Security Info=False;" +
                               "Initial Catalog=CourseProject;Data Source=localhost");
                //підключитися до БД
                connect.Open();
                //виконати команду
                using (SqlCommand cmd = new SqlCommand(sql, connect))
                {
                    cmd.ExecuteNonQuery();
                }
                connect.Close();
                return true;
            }
            catch (Exception ex)
            {
                // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('При обробці даних виникла помилка.');", true);
                return false;
                // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Успішно додано нового клієнта!')</SCRIPT>");
            }
        }
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }

        protected void change_Click(object sender, EventArgs e)
        {
            string ID = Regex.Match(chosen.SelectedValue, @"\d+").Value;
            DateTime time1 = Convert.ToDateTime(start.SelectedValue);
            DateTime time2 = time1.AddHours(1);
          //  Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('" + time2.ToString("HH:mm") + "');", true);
            insertUpdateDeleteData("UPDATE Classes SET DayOfTheWeek = '" + day.SelectedValue + "', StartTime = '" + start.SelectedValue + "', EndTime = '" + time2.ToString("HH:mm") + "' WHERE Classes_ID = " + ID);
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно видалено!');", true);
            Page.DataBind();
        }

        protected void chosen_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID = Regex.Match(chosen.SelectedValue, @"\d+").Value;
            string a = selectID("SELECT DayOfTheWeek FROM Classes WHERE Classes_ID = " + ID, "DayOfTheWeek");
            if (a == "П'ятниця") a = "П''ятниця";
            string b = selectID("SELECT StartTime FROM Classes WHERE Classes_ID = " + ID,"StartTime");
            DateTime time1 = Convert.ToDateTime(b);
            start.SelectedValue = time1.ToString("HH:mm"); 
           // Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('"+ time1.ToString("HH:mm") +"');", true);
            day.SelectedValue = a;
        }
    }
}