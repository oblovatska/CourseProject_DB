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
    public partial class changeClientForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NewName.Attributes.Add("placeholder", "Імя");
            NewSurname.Attributes.Add("placeholder", "Прізвище");
            NewSecondName.Attributes.Add("placeholder", "По батькові");
            NewPhoneNumber.Attributes.Add("placeholder", "Номер телефону");
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
               // Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('При обробці даних виникла помилка.');", true);
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
               // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
            }
            return ID;
        }

        private string selectName(String sql, String whatToRead)
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

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            NewSurname.Text = selectName("SELECT LastName FROM Client WHERE Client_ID = " + Regex.Match(DropDownList1.SelectedValue, @"\d+").Value, "LastName");
            NewName.Text = selectName("SELECT Name FROM Client WHERE Client_ID = " + Regex.Match(DropDownList1.SelectedValue, @"\d+").Value, "Name");
            NewSecondName.Text = selectName("SELECT SecondName FROM Client WHERE Client_ID = " + Regex.Match(DropDownList1.SelectedValue, @"\d+").Value, "SecondName");
            NewPhoneNumber.Text = selectID("SELECT PhoneNumber FROM Client WHERE Client_ID = " + Regex.Match(DropDownList1.SelectedValue, @"\d+").Value, "PhoneNumber").ToString();
        }

        protected void change_Click(object sender, EventArgs e)
        {
            int a;
            if (NewName.Text != "" && NewSurname.Text != "" && NewSecondName.Text != "" && NewPhoneNumber.Text != "" && int.TryParse(NewPhoneNumber.Text, out a) )
            {
                insertUpdateDeleteData("UPDATE Client SET LastName = '" + NewSurname.Text + "', Name = '" + NewName.Text + "', SecondName = '" + NewSecondName.Text + "', PhoneNumber = " + NewPhoneNumber.Text + " WHERE Client_ID = " + Regex.Match(DropDownList1.SelectedValue, @"\d+").Value);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно оновлено!');", true);
                Page.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Перевірте, будь ласка, введені дані.');", true);
            }
        }
    }
}