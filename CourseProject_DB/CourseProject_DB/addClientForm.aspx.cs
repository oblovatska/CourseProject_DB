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
    public partial class addClientForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NewName.Attributes.Add("placeholder", "Імя");
            NewSurname.Attributes.Add("placeholder", "Прізвище");
            NewSecondName.Attributes.Add("placeholder", "По батькові");
            NewPhoneNumber.Attributes.Add("placeholder", "Номер телефону");
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
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Виникла помилка при обробці даних.');", true);
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
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Виникла помилка при обробці даних.');", true);
                //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
                return false;
                // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Успішно додано нового клієнта!')</SCRIPT>");
            }
        }

        protected void AddNewClient_Click(object sender, EventArgs e)
        {
            Regex rgx = new Regex(@"[^0-9]");
            if (NewName.Text != "" && NewSurname.Text != "" && NewSecondName.Text != "" && NewPhoneNumber.Text != "" && !rgx.IsMatch(NewPhoneNumber.Text))
            {
                NewName.Text = NewName.Text.Replace("'","''");
                NewSurname.Text = NewSurname.Text.Replace("'", "''");
                NewSecondName.Text = NewSecondName.Text.Replace("'", "''");
                if (selectID("SELECT Client_ID FROM Client WHERE LastName = '" + NewSurname.Text + "' AND Name = '" + NewName.Text + "' AND SecondName = '" + NewSecondName.Text + "' AND PhoneNumber = " + NewPhoneNumber.Text, "Client_ID") == -1)
                {
                    insertUpdateDeleteData("INSERT INTO Client (LastName, Name, SecondName, PhoneNumber) VALUES('" + NewSurname.Text + "', '" + NewName.Text + "', '" + NewSecondName.Text + "', " + NewPhoneNumber.Text + ")");
                   // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Успішно додано нового клієнта!')</SCRIPT>");
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно додано нового клієнта.');", true);
                    Page.DataBind();
                
                }
                else Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Такий клієнт вже є в базі даних.');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Перевірте, будь ласка, заповненість полів. Також номер телефону має складатися з цифр.');", true);
            }

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void NewName_TextChanged(object sender, EventArgs e)
        {

        }


    }
}