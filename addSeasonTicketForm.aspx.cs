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
    public partial class addSeasonTicketForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void classesType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (classesType.SelectedValue == "Необмежений")
            {
                endDate.Enabled = true;
                endMonth.Enabled = true;
                endYear.Enabled = true;
            }
            else
            {
                endDate.Enabled = false;
                endMonth.Enabled = false;
                endYear.Enabled = false;
            }
            if (classesType.SelectedValue == "Обмежений")
            {
                day1.Enabled = true;
                day2.Enabled = true;
                start1.Enabled = true;
                start2.Enabled = true;
            }
            else
            {
                day1.Enabled = false;
                day2.Enabled = false;
                start1.Enabled = false;
                start2.Enabled = false;
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
               
               int service_ID = selectID("SELECT Service_ID FROM Service_ WHERE Name = '" + service.SelectedValue + "'","Service_ID");
               string client_ID = Regex.Match(client.SelectedValue, @"\d+").Value;
               int clubCard = selectID("SELECT ClubCard_ID FROM Client WHERE Client_ID = " + client_ID, "CLubCard_ID");
              // convert(datetime,'18-06-12 10:34:09 PM',5)
               if (classesType.SelectedValue != "Обмежений" || day1.SelectedValue != day2.SelectedValue)
                   insertUpdateDeleteData("INSERT INTO SeasonTicket(ClassesType, StartOf, EndOf, ClubCard_ID, service_ID) VALUES('" + classesType.SelectedValue + "', '" + startYear.SelectedValue + "-" + startMonth.SelectedValue + "-" + startDate.SelectedValue + "', '" + endYear.SelectedValue + "-" + endMonth.SelectedValue + "-" + endDate.SelectedValue + "', " + clubCard + ", " + service_ID + ")");
               else { Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Перевірте, будь ласка, обрані дні занять: заняття не можуть проводитись в один день.');", true); }
               int seasonTicket_ID = selectID("SELECT SeasonTicket_ID FROM SeasonTicket WHERE ClubCard_ID = " + clubCard + " AND service_ID = " + service_ID + " AND StartOf = '" + startYear.SelectedValue + "-" + startMonth.SelectedValue + "-" + startDate.SelectedValue + "'", "SeasonTicket_ID");
               if (classesType.SelectedValue == "Обмежений")
               {
                    DateTime time = Convert.ToDateTime(start1.SelectedValue);
                    DateTime time1 =  time.AddHours(1);
                    DateTime time3 = Convert.ToDateTime(start2.SelectedValue);
                    DateTime time2 = time3.AddHours(1);

                   //Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('"+ time1.ToString("HH:mm") + "');", true);
                    //insertUpdateDeleteData("INSERT INTO SeasonTicket(ClassesType, StartOf, EndOf, ClubCard_ID, service_ID) VALUES('"+ classesType.SelectedValue +"', " + startDate.SelectedValue + "." + startMonth.SelectedValue + "." + startYear.SelectedValue + ", " + endDate.SelectedValue + "." + endMonth.SelectedValue + "." + endYear.SelectedValue + ", " + clubCard + ", " + service_ID + ")");
                   insertUpdateDeleteData("INSERT INTO Classes(DayOfTheWeek, StartTime, EndTime, SeasonTicket_ID) VALUES('" + day1.SelectedValue + "', '" + start1.SelectedValue + "', '" + time1.ToString("HH:mm") + "', " + seasonTicket_ID + ")");
                   insertUpdateDeleteData("INSERT INTO Classes(DayOfTheWeek, StartTime, EndTime, SeasonTicket_ID) VALUES('" + day2.SelectedValue + "', '" + start2.SelectedValue + "', '" + time2.ToString("HH:mm") + "', " + seasonTicket_ID + ")");
                  
                   
               }
               Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно додано!');", true);
               Page.DataBind();
        }

        protected void startDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (startDate.SelectedIndex > 27)
            {
                startMonth.Items[1].Enabled = false;
                if (startDate.SelectedIndex == 30)
                {
                    startMonth.Items[3].Enabled = false;
                    startMonth.Items[5].Enabled = false;
                    startMonth.Items[8].Enabled = false;
                    startMonth.Items[10].Enabled = false;
                }
            }
                
                else
                {
                    startMonth.Items[3].Enabled = true; //апрель
                    startMonth.Items[5].Enabled = true; //июнь
                    startMonth.Items[8].Enabled = true; //сентябрь
                    startMonth.Items[10].Enabled = true;    //ноябрь
                    startMonth.Items[1].Enabled = true; //февраль
                }
        }

        protected void endDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (endDate.SelectedIndex > 27)
            {
                endMonth.Items[1].Enabled = false;
                if (endDate.SelectedIndex == 30)
                {
                    endMonth.Items[3].Enabled = false;
                    endMonth.Items[5].Enabled = false;
                    endMonth.Items[8].Enabled = false;
                    endMonth.Items[10].Enabled = false;
                }
            }
            
               
                else
                {
                    endMonth.Items[3].Enabled = true; //апрель
                    endMonth.Items[5].Enabled = true; //июнь
                    endMonth.Items[8].Enabled = true; //сентябрь
                    endMonth.Items[10].Enabled = true;    //ноябрь
                    endMonth.Items[1].Enabled = true; //февраль
                }
        }

        protected void startMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (startMonth.SelectedIndex == 1)
            {
                startDate.Items[28].Enabled = false;
                startDate.Items[29].Enabled = false;
                startDate.Items[30].Enabled = false;
            }
            else
            if (startMonth.SelectedIndex == 3 || startMonth.SelectedIndex == 5 || startMonth.SelectedIndex == 8 || startMonth.SelectedIndex == 10)
            {
                startDate.Items[30].Enabled = false;
            }
            else
            {
                startDate.Items[28].Enabled = true;
                startDate.Items[29].Enabled = true;
                startDate.Items[30].Enabled = true;
            }
        }

        protected void endMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (endMonth.SelectedIndex == 1)
            {
                endDate.Items[28].Enabled = false;
                endDate.Items[29].Enabled = false;
                endDate.Items[30].Enabled = false;
            }
            else
                if (endMonth.SelectedIndex == 3 || endMonth.SelectedIndex == 5 || endMonth.SelectedIndex == 8 || endMonth.SelectedIndex == 10)
                {
                    endDate.Items[30].Enabled = false;
                }
                else
                {
                    endDate.Items[28].Enabled = true;   //29
                    endDate.Items[29].Enabled = true;   //30
                    endDate.Items[30].Enabled = true;   //31
                }
        }
    }
}