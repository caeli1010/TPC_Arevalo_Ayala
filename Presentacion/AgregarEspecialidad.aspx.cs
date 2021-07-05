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
        private Especialidad especialidad;
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

                    if (!Page.IsPostBack)
                    {
                        ddlEspecialidad.DataValueField = "id";
                        ddlEspecialidad.DataTextField = "nombre";
                        ddlEspecialidad.DataSource = negocio.listar();
                        ddlEspecialidad.DataBind();
                        ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "-1"));
                    }
                }

//Queda pendiente reañizar el alta de las especialidades en caso de que la organizacion quiera agregar mas
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
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                Session.Add("especialidad", negocio.listar());
                insertar = (List<Especialidad>)Session["especialidad"];

                var argument = ddlEspecialidad.SelectedItem.Value;
                especialidad = (Especialidad)insertar.Find(X => X.idEspecialidad.ToString() == argument.ToString());
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
           
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                negocio.agregarXMedico(especialidad, doctor);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
           
           
        }

    }
}