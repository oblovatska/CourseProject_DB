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
    public partial class deleteClientForm : System.Web.UI.Page
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
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('При обробці даних виникла помилка.');", true);
               // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
                return false;
                // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Успішно додано нового клієнта!')</SCRIPT>");
            }
        }

        protected void deleteClient_Click(object sender, EventArgs e)
        {
           // Regex rgx = new Regex(@"[^0-9]");
           // if (ClientToChange0.Text != "" && !rgx.IsMatch(ClientToChange.Text))
          //  {
               // int ID = selectID("SELECT Client_ID FROM Client WHERE Client_ID = " + ClientToChange0.Text, "Client_ID");
             //   if (ID != -1)
              //  {
            string choice = ChosenClient.SelectedValue;
            string b = Regex.Match(choice, @"\d+").Value;
            //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('"+ b + "')</SCRIPT>");
            if (insertUpdateDeleteData("DELETE FROM Client WHERE Client_ID = " + b))
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Успішно видалено.');", true);
               // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Успішно видалено!')</SCRIPT>");
                Page.DataBind();
            }
            
             //   }
            //    else
            //    {
                   // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Клієнта з таким номером не знайдено.')</SCRIPT>");
           //     }
          //  }
          //  else
        //    {
         //       System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Перевірте, будь ласка, заповненість полів.')</SCRIPT>");
        //    }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }
    }
}