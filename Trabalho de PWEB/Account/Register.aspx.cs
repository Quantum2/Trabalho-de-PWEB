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

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            String selectSQL = "INSERT INTO Cliente (nome) VALUES('" + Nome.Text + "');";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(selectSQL, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                manager.AddToRole(user.Id, "Utilizador");
                String SQL2 = "INSERT INTO RelsClientes VALUES ('" + user.Id + "', (SELECT cod_cliente FROM Cliente WHERE nome='" + Nome.Text + "') )";
                cmd = new SqlCommand(SQL2, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}