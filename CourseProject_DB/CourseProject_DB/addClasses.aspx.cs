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
    public partial class addClasses : System.Web.UI.Page
    {
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

        private int selectID(String sql, String whatToRead)
        {
            int ID = -1;
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
                            ID = Convert.ToInt32(oReader[whatToRead].ToString());
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

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {
            string ID = Regex.Match(seasonTicket.SelectedValue, @"\d+").Value;
           // insertUpdateDeleteData("INSERT INTO SeasonTicket(ClassesType, StartOf, EndOf, ClubCard_ID, service_ID) VALUES('" + classesType.SelectedValue + "', '" + startYear.SelectedValue + "-" + startMonth.SelectedValue + "-" + startDate.SelectedValue + "', '" + endYear.SelectedValue + "-" + endMonth.SelectedValue + "-" + endDate.SelectedValue + "', " + clubCard + ", " + service_ID + ")");
            DateTime time = Convert.ToDateTime(start.SelectedValue);
           DateTime time1 = time.AddHours(1);
            //DateTime time2 = Convert.ToDateTime(start2.SelectedValue);
           // time2.AddHours(1);
          
            insertUpdateDeleteData("INSERT INTO Classes(DayOfTheWeek, StartTime, EndTime, SeasonTicket_ID) VALUES('" + day.SelectedValue + "', '" + start.SelectedValue + "', '" + time1.ToString("HH:mm") + "', " + ID + ")");
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно додано!');", true);
            Page.DataBind();
        }
            
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }
    }
}