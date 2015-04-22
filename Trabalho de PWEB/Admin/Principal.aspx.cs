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
    public partial class Login : System.Web.UI.Page
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

            }
        }
    }
}