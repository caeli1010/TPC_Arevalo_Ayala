using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Presentacion
{
    public partial class Login2 : System.Web.UI.Page
    {
        public List<Usuario> user;
        private Usuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                string mensaje = string.Empty;
                if (string.IsNullOrEmpty(txtUser.Text)) mensaje += "| El campo es obligatorio,";
                if (string.IsNullOrEmpty(txtPassw.Text)) mensaje += "| La contraseña es obligatorio,";

                //lanzamos la excepcion solo en caso de que haya algun camp
                if (!string.IsNullOrEmpty(mensaje)) throw new Exception(mensaje.TrimEnd(','));


                string username = txtUser.Text;
                string password = txtPassw.Text;
                usuario = negocio.leerUsuario(username, password);

                if (usuario != null)
                {
                    Session.Add("Login", usuario);
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Los datos ingresados no son correctos";
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                 this.GetType(), "Mensaje",
                  "<script> swal('Falla!', '" + ex.Message + "!', 'warning'); </script>"
                   );
            }
                        
        }
    }
}