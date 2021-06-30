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
    public partial class ModificarPaciente : System.Web.UI.Page
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

                    txtPaciente.Text = (string)seleccionado.nombre + " " + (string)seleccionado.apellido;
                    txtDNI.Text = (string)seleccionado.dni;
                    txtEmail.Text = (string)seleccionado.mail;
                    txtGenero.Text = (string)seleccionado.genero;

                }

            }
            catch (Exception err)
            {
                Session.Add("Error", err.ToString());
                Response.Redirect("Error.aspx");

            }

        }

        protected void btnModificarPte(object sender, EventArgs e)
        {
            PacienteNegocio negocio = new PacienteNegocio();

            if (txtDNI.Text != "")
            {
                paciente = (List<Paciente>)Session["Paciente"];
                Paciente seleccionado = paciente.Find(x => x.dni.ToUpper().Contains(txtDNI.Text.ToUpper()) );

                seleccionado.obraSocial.idObraSocial = int.Parse(cbxObraSocial.Text);
                seleccionado.nroCarnet = int.Parse(txtNroCarnet.Text);
                seleccionado.mail = (string)txtEmail.Text;
                
                negocio.modificar(seleccionado);

                Response.Redirect("ListarPacientes.aspx");


            }
        }
    }
}