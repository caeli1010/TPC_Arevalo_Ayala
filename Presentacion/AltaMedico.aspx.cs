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
    public partial class AltaMedico : System.Web.UI.Page
    {
        public List<Especialidad> lista;
        private int especialidad;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login2.aspx");
            //}
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                Especialidad nuevo = new Especialidad();

                if(!Page.IsPostBack)
                {
                    ddlEspecialidad.DataSource = negocio.listar();
                    ddlEspecialidad.DataTextField = "nombre";
                    ddlEspecialidad.DataValueField = "idEspecialidad";
                    ddlEspecialidad.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }
        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                especialidad = int.Parse(ddlEspecialidad.SelectedItem.Value);


            }                
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void btnGrabarMedico_Click(object sender, EventArgs e)
        {

            try
            {
                string mensaje = string.Empty;
                if (string.IsNullOrEmpty(txtDoc.Text)) mensaje += "| El Número de documento es obligatorio,";
                if (string.IsNullOrEmpty(txtEmail.Text)) mensaje += "| El correo electrónico es obligatorio,";
                if (string.IsNullOrEmpty(txtCEmail.Text)) mensaje += "| La confirmación del correo es obligatoria,";
                if (string.IsNullOrEmpty(txtNombre.Text)) mensaje += "| El Nombre es obligatorio,";
                if (string.IsNullOrEmpty(txtApellido.Text)) mensaje += "| El Apellido es obligatorio,";
                if (string.IsNullOrEmpty(txtFechaNac.Text)) mensaje += "| Debe seleccionar una fecha válida,";
                if (string.IsNullOrEmpty(txtMatricula.Text)) mensaje += "| El numero de matricula es obligatorio,";
                if (string.IsNullOrEmpty(ddlSexo.Text)) mensaje += "| Debe seleccionar una opcion, el campo es obligatorio,";
                if (string.IsNullOrEmpty(ddlEspecialidad.Text)) mensaje += "| Debe seleccionar una espacialidad, es obligatorio,";
                if (!string.Equals(txtEmail.Text, txtCEmail.Text)) mensaje += " La casilla de email ingresada no es la misma,";
                //lanzamos la excepcion solo en caso de que haya algun camp
                if (!string.IsNullOrEmpty(mensaje)) throw new Exception(mensaje.TrimEnd(','));

                    MedicoNegocio negocio = new MedicoNegocio();
                    Medico nuevo = new Medico();
                if (txtEmail.Text == txtCEmail.Text)
                {
                    nuevo.matricula = int.Parse(txtMatricula.Text);
                    nuevo.apellido = txtApellido.Text;
                    nuevo.nombre = txtNombre.Text;
                    nuevo.genero = ddlSexo.SelectedValue;
                    nuevo.fechaNac = DateTime.Parse(txtFechaNac.Text);
                    nuevo.fechaIngreso = DateTime.Parse(txtFechaIngreso.Text);
                    nuevo.mail = txtCEmail.Text;
                    nuevo.dni = txtDoc.Text;
                    nuevo.especialidad = new Especialidad(especialidad);
                    negocio.agregar(nuevo);
                }
                Response.Redirect("ListarMedico.aspx");
            }
            catch (Exception ex)
            {
                    ClientScript.RegisterStartupScript(
                     this.GetType(),
                     "Mensaje",
                     "<script> swal('Falla!', '" + ex.Message + "!', 'warning'); </script>"
                 );
            }

        }

    }
}