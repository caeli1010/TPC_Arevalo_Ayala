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
    public partial class ListarUsuarios : System.Web.UI.Page
    {
        public List<Usuario> users;
        public string dni;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            if (Session["Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Usuario user = (Usuario)Session["Login"];
                if(user.idRol != 1)
                {
                    Response.Redirect("Default.aspx");
                }

            }

            try
            { 


                if (Session["Usuarios"] == null)
                {
                    users = negocio.listar();
                    Session.Add("Usuarios", users);
                    
                }
                else
                {
                    if (Request.QueryString["dni"] != null)
                    {
                        dni = Request.QueryString["dni"];
                    }
                    users = (List<Usuario>)Session["Usuarios"];
                }
            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                Response.Redirect("Error.aspx");
            }

        }
    }
}