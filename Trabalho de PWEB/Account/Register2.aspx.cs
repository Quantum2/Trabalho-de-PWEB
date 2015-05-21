using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Trabalho_de_PWEB.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Configuration;

namespace Trabalho_de_PWEB.Account
{
    public partial class Register : Page
    {
        private string connectionString2 = WebConfigurationManager.ConnectionStrings["DBContext"].ConnectionString;

        protected void MudarPagina2(object sender, EventArgs e)
        {
            String command1 = "INSERT INTO [Animal] ([nome], [raca], [idade]) VALUES (@nome, @raca, @idade)";
            SqlConnection con= new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(command1, con);
            cmd.Parameters.AddWithValue("@nome", Nome_animal.Text);
            cmd.Parameters.AddWithValue("@raca", Raca.Text);
            cmd.Parameters.AddWithValue("@idade", Data_animal.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/");
        }
    }
}