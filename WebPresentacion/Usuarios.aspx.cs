using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace WebPresentacion
{
    public partial class Usuarios : System.Web.UI.Page
    {
        public List<Usuario> lista;
        public string dni;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                if (Session["Usuarios"] == null)
                {
                    lista = negocio.listar();
                    Session.Add("Usuarios", lista);
                }
                else
                {
                    if (Request.QueryString["dni"] != null)
                    {
                        dni = string.Parse(Request.QueryString["dni"]);

                    }
                    lista = (List<Usuario>)Session["Usuarios"];
                }
            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                //Response.Redirect("Error.aspx");
            }

    }
    }
}