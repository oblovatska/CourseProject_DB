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
    public partial class addServiceForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Name.Attributes.Add("placeholder", "Назва нової послуги");
            price1.Attributes.Add("placeholder", "Ціна одного заняття");
            price2.Attributes.Add("placeholder", "Вартість обмеженого абонемента на місяць");
            price3.Attributes.Add("placeholder", "Вартість необмеженого абонемента на місяць");
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
            }
            return ID;
        }

        public void insertUpdateDeleteData(String sql)
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
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('При обробці даних виникла помилка.');", true);
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }

        protected void addService_Click(object sender, EventArgs e)
        {
            Regex rgx = new Regex(@"[^0-9+.+,]");
            double a;
            if (Name.Text != "" && price1.Text != "" && price2.Text != "" && price2.Text != "" && price3.Text != "" && double.TryParse(price1.Text, out a) && double.TryParse(price2.Text, out a) && double.TryParse(price3.Text, out a))
            {
                if (selectID("SELECT Service_ID FROM Service_ WHERE Name = '" + Name.Text + "' AND OneClassValue = " + price1.Text + " AND MonthlyClassesDeterminedValue = " + price2.Text + " AND MonthlyClassesNotDeterminedValue = " + price3.Text, "Service_ID") == -1)
                {
                    insertUpdateDeleteData("INSERT INTO Service_ (Name, OneClassValue, MonthlyClassesDeterminedValue, MonthlyClassesNotDeterminedValue) VALUES('" + Name.Text + "', " + price1.Text + ", " + price2.Text + ", " + price3.Text + ")");
                    //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Успішно додано нову послугу!')</SCRIPT>");
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно додано нову послугу.');", true);
                    Page.DataBind();

                }
                else Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Така послуга вже є в базі даних.');", true);//System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Така послуга вже є в базі даних.')</SCRIPT>");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Перевірте, будь ласка, заповненість полів. Усі вартості мають бути числами.');", true);
                //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Перевірте, будь ласка, заповненість полів. Усі вартості мають бути числами.')</SCRIPT>");
            }
        }
    }
}