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
    public partial class ModificarMedico : System.Web.UI.Page
    {
        public List<Medico> medico;
        private Medico doctor;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["idM"] != null)
                {
                    medico = (List<Medico>)Session["medicos"];
                    doctor = (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);

                    txtMatricula.Text = doctor.matricula;
                    txtNombre.Text = doctor.nombre;
                    txtApellido.Text = doctor.apellido;
                    txtSexo.Text = doctor.genero;
                    txtFechaNac.Text = doctor.fechaNac.ToString();
                    txtFechaIngreso.Text = doctor.fechaIngreso.ToString();
                    txtEmail.Text = doctor.mail;
                    txtDoc.Text = doctor.dni;
                    txtEspecialidad.Text = doctor.especialidad.nombre;

                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");

            }

        }

        protected void btnModificarMedico_Click(object sender, EventArgs e)
        {
            try
            {
                doctor.mail = txtEmail.Text;
                doctor.fechaIngreso = DateTime.Parse(txtFechaIngreso.Text);
                doctor.fechaNac = DateTime.Parse(txtFechaNac.Text);

                MedicoNegocio negocio = new MedicoNegocio();
                negocio.modificar(doctor);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ListarMedicos");
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }
    }
}