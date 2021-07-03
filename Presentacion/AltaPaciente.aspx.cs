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
    public partial class AltaPaciente : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login2.aspx");
            //}

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var idOs = ddlObraSocial.SelectedItem.Value;
            if (txtEmail.Text == txtConfEmail.Text)
            {
                Paciente paciente = new Paciente();
                PacienteNegocio agregar = new PacienteNegocio();
                paciente.apellido = txtApellido.Text;
                paciente.nombre = txtNombre.Text;
                paciente.obraSocial.idObraSocial= 5;
                paciente.fechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                paciente.genero = ddlSexo.SelectedItem.Value;
                paciente.dni = txtDni.Text;
                paciente.mail = txtEmail.Text;
                paciente.nroCarnet = int.Parse(txtNroCred.Text);
                agregar.agregar(paciente);

            }



        }
    }
}