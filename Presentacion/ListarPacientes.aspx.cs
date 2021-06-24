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
    public partial class ListarPacientes : System.Web.UI.Page
    {
        public List<Paciente> pacientes;
        public string dni;
        protected void Page_Load(object sender, EventArgs e)
        {
            PacienteNegocio negocio = new PacienteNegocio();

            if (Session["Login"] == null)
            {
                Response.Redirect("Login2.aspx");
            }

            try
            {
                if (Session["Paciente"] == null)
                {
                    pacientes = negocio.listar();
                    Session.Add("Paciente", pacientes);
                }
                else
                {
                    if (Request.QueryString["dni"] != null)
                    {
                        dni = Request.QueryString["dni"];
                    }
                    pacientes = (List<Paciente>)Session["Paciente"];
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