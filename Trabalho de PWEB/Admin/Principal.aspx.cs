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
                Page.Title = "Administração";
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
            String reads = "SELECT cod_consulta FROM Consulta WHERE (local = @d) AND (hora = @h)";
            String command2 = "INSERT INTO [Animal_consulta] ([cod_consulta], [cod_animal]) VALUES (@cod_consulta, @cod_animal)";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(command, con);
            SqlCommand cmd2 = new SqlCommand(command2, con);
            SqlCommand read = new SqlCommand(reads, con);

            cmd.Parameters.AddWithValue("@local", local_consulta);
            cmd.Parameters.AddWithValue("@data", data);
            cmd.Parameters.AddWithValue("@hora", hora + ":" + minutos);
            read.Parameters.AddWithValue("@d", local_consulta);
            read.Parameters.AddWithValue("@h", hora + ":" + minutos + ":00");

            con.Open();

            cmd.ExecuteNonQuery();

            SqlDataReader rdr = read.ExecuteReader();
            rdr.Read();
            var myString = rdr.GetInt32(0);
            rdr.Close();

            cmd2.Parameters.AddWithValue("@cod_consulta", Convert.ToInt32(myString));
            cmd2.Parameters.AddWithValue("@cod_animal", DropDownList4.SelectedValue);

            cmd2.ExecuteNonQuery();

            GridView1.DataBind();

            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String nome = TextBox3.Text;
            String raca = TextBox4.Text;
            int idade = Convert.ToInt32(TextBox5.Text);
            int dono = Convert.ToInt32(DropDownList5.SelectedValue);

            String command = "INSERT INTO [Animal] ([nome], [raca], [idade]) VALUES (@nome, @raca, @idade)";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(command, con);

            cmd.Parameters.AddWithValue("@nome", nome);
            cmd.Parameters.AddWithValue("@raca", raca);
            cmd.Parameters.AddWithValue("@idade", idade);

            con.Open();
            cmd.ExecuteNonQuery();
            GridView3.DataBind();
            con.Close();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}