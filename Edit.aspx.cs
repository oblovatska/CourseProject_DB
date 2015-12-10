using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace CourseProject
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*NewName.Attributes.Add("placeholder", "Імя");
            NewLastName.Attributes.Add("placeholder", "Прізвище");
            NewSecondName.Attributes.Add("placeholder", "По-батькові");
            NewPhoneNumber.Attributes.Add("placeholder", "Номер телефону");

            NewServiceName.Attributes.Add("placeholder", "Назва нової послуги");
            NewServiceClass.Attributes.Add("placeholder", "Ціна одного заняття");
            NewService1.Attributes.Add("placeholder", "Вартість обмеженого абонемента на місяць");
            NewService2.Attributes.Add("placeholder", "Вартість необмеженого абонемента на місяць");

            NewName0.Attributes.Add("placeholder", "Імя");
            NewLastName0.Attributes.Add("placeholder", "Прізвище");
            NewSecondName0.Attributes.Add("placeholder", "По-батькові");
            NewPhoneNumber0.Attributes.Add("placeholder", "Номер телефону");
            ClientToChange.Attributes.Add("placeholder", "Номер клієнта, якого необхідно змінити");
            ClientToChange0.Attributes.Add("placeholder", "Номер клієнта, якого необхідно видалити");*/
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

            }
        }

        protected void addNewClient_Click(object sender, EventArgs e)
        {
            Response.Redirect("addClientForm.aspx");

        }

        protected void AddService_Click(object sender, EventArgs e)
        {
            Response.Redirect("addServiceForm.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("changeClientForm.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            Response.Redirect("deleteClientForm.aspx");
        }
        protected void ClientToChange0_TextChanged(object sender, EventArgs e)
        {

        }


        protected void addClientChoice_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("changeSeasonTicketForm.aspx");
        }

        protected void changeService_Click(object sender, EventArgs e)
        {
            Response.Redirect("changeServiceForm.aspx");
        }

        protected void deleteSeasonTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("deleteSeasonTicket.aspx");
        }

        protected void deleteService_Click(object sender, EventArgs e)
        {
            Response.Redirect("deleteServiceForm.aspx");
        }

        protected void addSeasonTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("addSeasonTicketForm.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("changeClassesForm.aspx");
        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            Response.Redirect("addClasses.aspx");
        }

        protected void deleteClasses_Click(object sender, EventArgs e)
        {
            Response.Redirect("deleteClassesForm.aspx");
        }
    }
    }
