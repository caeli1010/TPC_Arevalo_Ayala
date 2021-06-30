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
    public partial class AgregarEspecialidad : System.Web.UI.Page
    {
        public List<Especialidad>insertar;
        public List<Medico> medico;
        private Medico doctor;
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            try
            {
                if(Request.QueryString["idM"] != null)
                {
                    medico = (List<Medico>)Session["medicos"];
                    doctor= (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);
                    lblNombre.Text = doctor.nombre;
                    lblDni.Text = doctor.dni;
                    lblMatricula.Text = doctor.matricula;
                    lblEmail.Text = doctor.mail;

                    Session.Add("especialidad", negocio.listar());
                    insertar = (List<Especialidad>)Session["especialidades"];
                    ddlEspecialidad.DataSource = insertar;
                    ddlEspecialidad.DataMember = "nombre";
                    ddlEspecialidad.DataBind();

                    foreach (ListItem ltItem in ddlEspecialidad.Items)
                    {

                        ltItem.Text = (string)ltItem.Text;
                        ltItem.Value = (string)ltItem.Value;
                    }
                }
              
                    //Especialidad especialidad = (Especialidad)insertar.Find(X => X.idEspecialidad.ToString() == ddlEspecialidad.SelectedValue);
                    //negocio.agregar(especialidad);

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad especialidad = (Especialidad)insertar.Find(X => X.idEspecialidad.ToString() == ddlEspecialidad.SelectedValue);
            negocio.agregarXMedico(especialidad, doctor);
        }
    }
}