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
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Trabalho_de_PWEB.Cliente
{
    public partial class Consultas : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["DBContext"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userid;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var user = manager.FindById(User.Identity.GetUserId());

            userid = user.Id;

            SqlDataSource1.SelectParameters["user_id"].DefaultValue = userid;
            Page.Title = "Área do cliente";
        }

        public void existentes_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
        }

        public void novas_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            Panel3.Visible = false;
        }

        protected void animais_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = true;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            String userid;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var user = manager.FindById(User.Identity.GetUserId());

            userid = user.Id;

            string query1 = "SELECT local, data, hora FROM Consulta";
            string query2 = "INSERT INTO Consulta (local, data, hora) VALUES(@local, @data, @hora)";

            String local_consulta = TextBox1.Text;
            String data = TextBox2.Text;
            int hora = Convert.ToInt32(DropDownList1.SelectedValue);
            int minutos = Convert.ToInt32(DropDownList2.SelectedValue);

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query2, con);
            SqlCommand read = new SqlCommand(query1, con);

            cmd.Parameters.AddWithValue("@local", local_consulta);
            cmd.Parameters.AddWithValue("@data", data);
            cmd.Parameters.AddWithValue("@hora", hora + ":" + minutos);

            con.Open();

            SqlDataReader rdr = read.ExecuteReader();
            rdr.Read();
            var myString = rdr.GetString(0);
            var myString2 = rdr.GetDateTime(1).ToString();
            rdr.Close();
        }
    }
}