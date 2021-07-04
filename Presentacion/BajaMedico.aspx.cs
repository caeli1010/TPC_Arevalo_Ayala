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
    public partial class BajaMedico : System.Web.UI.Page
    {
        public List<Medico> medicos;
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            try
            {
                if (!Page.IsPostBack)
                {
                    ddlApellido.DataSource = negocio.listar();
                    ddlApellido.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");

            }
          

        }

        protected void ddlNombre_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlApellido_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}