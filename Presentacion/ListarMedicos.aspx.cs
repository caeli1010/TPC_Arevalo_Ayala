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
    public partial class ListarMedicos : System.Web.UI.Page
    {
        public List<Medico> lista;
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            try
            {
                if (Session["Medicos"] == null)
                {
                    lista = negocio.listar();
                    Session.Add("Medicos", lista);
                }
                else
                {
                    //if (Request.QueryString["dni"] != null)
                    //{
                    //    dni = Request.QueryString["dni"];
                    //}
                    lista = (List<Medico>)Session["Medicos"];
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