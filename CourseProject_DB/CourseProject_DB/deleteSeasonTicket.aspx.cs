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
    public partial class deleteSeasonTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
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
                //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Виникла помилка при обробці даних.')</SCRIPT>");
                return false;
                // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Успішно додано нового клієнта!')</SCRIPT>");
            }
        }
        protected void deleteST_Click(object sender, EventArgs e)
        {
            string choice = chosenSeasonTicket.SelectedValue;
            string b = Regex.Match(choice, @"\d+").Value;
            if (insertUpdateDeleteData("DELETE FROM SeasonTicket WHERE SeasonTicket_ID = " + b))
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Абонемент успішно видалено.');", true);
               // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Абонемент успішно видалено.')</SCRIPT>");
                Page.DataBind();
            }
        }
    }
}