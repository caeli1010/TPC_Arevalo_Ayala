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
    public partial class AdministradorUsuario : System.Web.UI.Page
    {
        //public List<Usuario>users;
        public List<Medico>doc;
        public string dni;
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();

            try
            {
                if (Session["Medicos"] == null)
                {
                    //users = negocio.listar();
                    //Session.Add("Usuarios", users);
                    doc = negocio.listar();
                    Session.Add("Medicos", doc);
                }
                else
                {
                    if (Request.QueryString["dni"] != null)
                    {
                        dni = Request.QueryString["dni"];
                    }
                    //users = (List<Usuario>)Session["Usuarios"];
                   doc = (List<Medico>)Session["Medicos"];
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