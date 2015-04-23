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

namespace Trabalho_de_PWEB.Admin
{
    public partial class Principal : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

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
    }
}