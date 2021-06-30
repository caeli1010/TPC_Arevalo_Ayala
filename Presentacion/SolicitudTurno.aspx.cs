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
    public partial class SolicitudTurno : System.Web.UI.Page
    {
        public List<Paciente> paciente = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ipc"] != null)
                {
                    paciente = (List<Paciente>)Session["Paciente"];
                    Paciente seleccionado = paciente.Find(X => X.idPaciente.ToString() == Request.QueryString["ipc"]);

                    lblNombre.Text = (string)seleccionado.nombre + " " + (string)seleccionado.apellido;
                    lblDni.Text = (string)seleccionado.dni;
                    lblEmail.Text = (string)seleccionado.mail;
                    lblObraSocial.Text = (string)seleccionado.obraSocial.nombre;

                }
                
            }
            catch (Exception err)
            {
                Session.Add("Error", err.ToString());
                Response.Redirect("Error.aspx");

            }
 

        }
    }
}