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

            try
            {
                string mensaje = string.Empty;
                if (string.IsNullOrEmpty(txtDni.Text)) mensaje += "| El Número de documento es obligatorio,";
                if (string.IsNullOrEmpty(txtEmail.Text)) mensaje += "| El correo electrónico es obligatorio,";
                if (string.IsNullOrEmpty(txtConfEmail.Text)) mensaje += "| La confirmación del correo es obligatoria,";
                if (string.IsNullOrEmpty(txtNombre.Text)) mensaje += "| El Nombre es obligatorio,";
                if (string.IsNullOrEmpty(txtApellido.Text)) mensaje += "| El Apellido es obligatorio,";
                if (string.IsNullOrEmpty(txtFechaNac.Text)) mensaje += "| Debe seleccionar una fecha válida,";
                if (string.IsNullOrEmpty(txtNroCred.Text)) mensaje += "| El numero de credencial es obligatorio, si no posee ingrese Cero,";
       
               
                if (!string.IsNullOrEmpty(mensaje)) throw new Exception(mensaje.TrimEnd(','));


            
            var idOs = ddlObraSocial.SelectedItem.Value;
            if (txtEmail.Text == txtConfEmail.Text)
            {
                Paciente paciente = new Paciente();
                PacienteNegocio agregar = new PacienteNegocio();
                paciente.dni = txtDni.Text;
                paciente.mail = txtEmail.Text;
                paciente.apellido = txtApellido.Text;
                paciente.nombre = txtNombre.Text;
                paciente.obraSocial = new Obrasocial(5);
                paciente.fechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                paciente.genero = ddlSexo.SelectedItem.Value;
                paciente.nroCarnet = int.Parse(txtNroCred.Text);
                agregar.agregar(paciente);

            }

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "Mensaje",
                    "<script> swal('Error!', '" + ex.Message + "!', 'error'); </script>"
                );
            }

        }
    }
}