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
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login2.aspx");
            //}
            try
            {
                MedicoNegocio negocio = new MedicoNegocio();
                Medico nuevo = new Medico();
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
                MedicoNegocio negocio = new MedicoNegocio();
                Medico nuevo = new Medico();
                nuevo.dni = txtDoc.Text;
                nuevo.mail = txtCEmail.Text;
                //nuevo.fechaNac = ddl
                nuevo.nombre = txtNombre.Text;
                nuevo.apellido = txtApellido.Text;
                nuevo.matricula = txtMatricula.Text;
                nuevo.especialidad.idEspecialidad = int.Parse(ddlEspecialidad.SelectedItem.Value);
                //nuevo.fechaIngreso =
                negocio.agregar(nuevo);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }
    }
}