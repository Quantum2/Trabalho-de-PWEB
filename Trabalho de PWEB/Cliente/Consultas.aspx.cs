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
        private string erroString = "Não pode marcar um consulta na data e hora definida";
        private int idCliente;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userid;
            String query1 = "SELECT * FROM [RelsClientes] WHERE ([user_id] = @user_id)";
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var user = manager.FindById(User.Identity.GetUserId());

            userid = user.Id;

            SqlDataSource1.SelectParameters["user_id"].DefaultValue = userid;
            GridView1.DataBind();
            Page.Title = "Área do cliente";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand read = new SqlCommand(query1, con);
            read.Parameters.AddWithValue("@user_id", userid);

            con.Open();

            SqlDataReader rdr = read.ExecuteReader();
            rdr.Read();
            idCliente = rdr.GetInt32(1);

            con.Close();
        }

        public void existentes_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;

            GridView1.DataBind();
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
            int valido = 1;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var user = manager.FindById(User.Identity.GetUserId());

            userid = user.Id;

            string query1 = "SELECT cod_consulta, local, data, hora FROM Consulta";
            string query2 = "INSERT INTO Consulta (local, data, hora) VALUES(@local, @data, @hora)";
            string query3 = "INSERT INTO Cliente_consulta (cod_consulta, cod_cliente) VALUES(@c1, @c2)";

            String local_consulta = TextBox1.Text;
            String data = TextBox2.Text;
            int hora = Convert.ToInt32(DropDownList1.SelectedValue);
            int minutos = Convert.ToInt32(DropDownList2.SelectedValue);

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query2, con);
            SqlCommand cmd2 = new SqlCommand(query3, con);
            SqlCommand read = new SqlCommand(query1, con);

            cmd.Parameters.AddWithValue("@local", local_consulta);
            cmd.Parameters.AddWithValue("@data", data);
            cmd.Parameters.AddWithValue("@hora", hora + ":" + minutos);

            con.Open();

            SqlDataReader rdr = read.ExecuteReader();
            var myString = new List<String>();
            var myString2 = new List<DateTime>();
            var myString3 = new List<String>();
            var codConsulta = new List<int>();

            while (rdr.Read())
            {
                codConsulta.Add(rdr.GetInt32(0));
                myString.Add(rdr.GetString(1));
                myString2.Add(rdr.GetDateTime(2));
                myString3.Add(rdr.GetTimeSpan(3).ToString());
            }
            rdr.Close();

            for(int i = 0; i < myString.Count; i++)
            {
                string temp = cmd.Parameters["@data"].Value.ToString();
                if (((string)cmd.Parameters["@hora"].Value + ":00") == myString3[i] && myString3.Any(s => s.Contains(temp)))
                {
                    valido = 0;
                }
            }

            if(valido == 1)
            {
                cmd.ExecuteNonQuery();
                cmd2.Parameters.AddWithValue("@c1", codConsulta.Last().ToString());
                cmd2.Parameters.AddWithValue("@c2", idCliente.ToString());
                cmd2.ExecuteNonQuery();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + erroString + "');", true);
                Response.Write(Request.RawUrl.ToString());
            }

            con.Close();
        }
    }
}