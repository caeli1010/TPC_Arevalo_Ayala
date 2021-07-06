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
                    ddlEspecialidad.DataValueField = "id";
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
            Page.Validate(); 
             if(!Page.IsValid)
                return;

            try
            {
                MedicoNegocio negocio = new MedicoNegocio();
                Medico nuevo = new Medico();
                nuevo.matricula = txtMatricula.Text;
                nuevo.apellido = txtApellido.Text;
                nuevo.nombre = txtNombre.Text;
                nuevo.genero = char.Parse(ddlSexo.SelectedValue);
                nuevo.fechaNac = DateTime.Parse(txtFechaNac.Text);
                nuevo.fechaIngreso = DateTime.Parse(txtFechaIngreso.Text);
                nuevo.mail = txtCEmail.Text;
                nuevo.dni = txtDoc.Text;
                nuevo.especialidad.idEspecialidad = especialidad;
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