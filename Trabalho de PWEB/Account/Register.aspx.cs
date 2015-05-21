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
        private string connectionString = WebConfigurationManager.ConnectionStrings["DBContext"].ConnectionString;

      
        protected void MudarPagina(object sender, EventArgs e)
        {
            int userID;
            String command = "INSERT INTO [Cliente] ([nome], [morada], [data_nascimento]) VALUES (@nome, @morada, @data)";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(command, con);
            cmd.Parameters.AddWithValue("@nome", Nome.Text);
            cmd.Parameters.AddWithValue("@morada", Morada.Text);
            cmd.Parameters.AddWithValue("@data", Data.Text);
            
            con.Open();
            cmd.ExecuteNonQuery();

            SqlCommand command3 = new SqlCommand("SELECT [cod_cliente] FROM [Cliente] WHERE ([nome] = @nome)", con);
            command3.Parameters.AddWithValue("@nome", Nome.Text);
            SqlDataReader reader = command3.ExecuteReader();
            reader.Read();
            userID = reader.GetInt32(0);

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            String command2 = "INSERT INTO [RelsClientes] ([user_id], [cod_cliente]) VALUES (@user_id, @cod_cliente)";
            SqlConnection con1 = new SqlConnection(connectionString);
            SqlCommand cmd2 = new SqlCommand(command2, con1);
            con1.Open();
            cmd2.Parameters.AddWithValue("@user_id", user.Id);
            cmd2.Parameters.AddWithValue("@cod_cliente", userID);
            cmd2.ExecuteNonQuery();
            con.Close();
            con1.Close();

            Response.Redirect("~/Account/Register2");
        }
    }
}