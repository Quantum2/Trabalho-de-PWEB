using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using Trabalho_de_PWEB.Models;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Trabalho_de_PWEB.Admin
{
    public partial class Principal : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["DBContext"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            var user = manager.FindById(User.Identity.GetUserId());

            if (user != null && manager.GetRoles(User.Identity.GetUserId()).Contains("Veterinario"))
            {

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            consultas.Visible = true;
            animais.Visible = false;
            clientes.Visible = false;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            consultas.Visible = false;
            animais.Visible = true;
            clientes.Visible = false;
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            consultas.Visible = false;
            animais.Visible = false;
            clientes.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String local_consulta = TextBox1.Text;
            String data = TextBox2.Text;
            int hora = Convert.ToInt32(DropDownList1.SelectedValue);
            int minutos = Convert.ToInt32(DropDownList2.SelectedValue);

            String command = "INSERT INTO [Consulta] ([local], [data], [hora]) VALUES (@local, @data, @hora)";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(command, con);

            con.Open();


        }
    }
}