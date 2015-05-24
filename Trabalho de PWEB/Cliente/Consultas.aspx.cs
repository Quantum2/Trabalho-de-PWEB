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
        }

        public void existentes_Click(object sender, EventArgs e)
        {
            PlaceHolder1.Visible = true;
            PlaceHolder2.Visible = false;
            PlaceHolder3.Visible = false;
        }

        public void novas_Click(object sender, EventArgs e)
        {
            PlaceHolder2.Visible = true;
            PlaceHolder1.Visible = false;
            PlaceHolder3.Visible = false;
        }

        protected void animais_Click(object sender, EventArgs e)
        {
            PlaceHolder1.Visible = false;
            PlaceHolder2.Visible = false;
            PlaceHolder3.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query1 = "";
            string query2 = "";


        }
    }
}