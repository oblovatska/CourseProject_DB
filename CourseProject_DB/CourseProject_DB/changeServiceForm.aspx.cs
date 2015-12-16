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
    public partial class changeServiceForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            price1.Attributes.Add("placeholder", "Вартість одного заняття");
            price2.Attributes.Add("placeholder", "Вартість обмеженого абонемента");
            price3.Attributes.Add("placeholder", "Вартість необмеженого абонемента");
            
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

        private double selectPrice(String sql, String whatToRead)
        {
            double ID = -1;
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
                            ID = Convert.ToDouble(oReader[whatToRead].ToString());
                        }
                        myConnection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('При обробці даних виникла помилка.');", true);
               // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
            }
            return ID;
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
              //  System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
            }
            return ID;
        }

        protected void chosenService_SelectedIndexChanged(object sender, EventArgs e)
        {
            //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Hello')</SCRIPT>");
            //int ID = selectID("SELECT Service_ID FROM Service_ WHERE Name = '" + chosenService.SelectedValue + "'", "Service_ID");
           // Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Hello');", true);
            price1.Text = selectPrice("SELECT OneClassValue FROM Service_ WHERE Name = '" + chosenService.SelectedValue + "'", "OneClassValue").ToString();
            price2.Text = selectPrice("SELECT MonthlyClassesDeterminedValue FROM Service_ WHERE Name = '" + chosenService.SelectedValue + "'", "MonthlyClassesDeterminedValue").ToString();
            price3.Text = selectPrice("SELECT MonthlyClassesNotDeterminedValue FROM Service_ WHERE Name = '" + chosenService.SelectedValue + "'", "MonthlyClassesNotDeterminedValue").ToString();
            
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }

        protected void change_Click(object sender, EventArgs e)
        {
            double a;
            if (price1.Text != "" && price2.Text != "" && price2.Text != "" && price3.Text != "" && double.TryParse(price1.Text, out a) && double.TryParse(price2.Text, out a) && double.TryParse(price3.Text, out a))
            {
                price1.Text = price1.Text.Replace(',','.');
                price2.Text = price2.Text.Replace(',', '.');
                price3.Text = price3.Text.Replace(',', '.');
                insertUpdateDeleteData("UPDATE Service_ SET OneClassValue = " + price1.Text + ", MonthlyClassesDeterminedValue = " + price2.Text + ", MonthlyClassesNotDeterminedValue = " + price3.Text + " WHERE Name = '" + chosenService.SelectedValue + "'");
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно оновлено!');", true);
                Page.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Перевірте, будь ласка, введені значення цін.');", true);
            }
            
        }
    }
}