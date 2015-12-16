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
    public partial class deleteServiceForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void deleteService_Click(object sender, EventArgs e)
        {
            insertUpdateDeleteData("DELETE FROM Service_ WHERE Name = '" + chosenService.SelectedValue + "'");
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Script", "alert('Послугу успішно видалено.');", true);
            //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Послугу успішно видалено.')</SCRIPT>");
            Page.DataBind();
        }
    }
}