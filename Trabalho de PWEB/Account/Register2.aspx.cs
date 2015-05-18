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
            Response.Redirect("~/Account/Register3");
        }
    }
}