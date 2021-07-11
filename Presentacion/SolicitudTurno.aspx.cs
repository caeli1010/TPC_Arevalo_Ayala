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
        public List<Especialidad> listEspecialidades;
        public List<Medico> listMedicosConEspe;
        private Paciente paciente;
        public List<Paciente> listPacientes;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               
                MedicoNegocio medNegocio = new MedicoNegocio();
                EspecialidadNegocio espNegocio = new EspecialidadNegocio();
                if (Request.QueryString["ipc"] != null)
                {
                    listPacientes = (List<Paciente>)Session["Paciente"];
                    paciente = listPacientes.Find(X => X.idPaciente.ToString() == Request.QueryString["ipc"]);

                    lblNombre.Text = (string)paciente.nombre + " " + (string)paciente.apellido;
                    lblDni.Text = (string)paciente.dni;
                    lblEmail.Text = (string)paciente.mail;
                    lblObraSocial.Text = (string)paciente.obraSocial.nombre;
                    //turno.fechaHora = DateTime.Parse(txtFecha.Text);
                    if (!IsPostBack)
                    {

                    ddlEspecialidad.DataValueField = "idEspecialidad";
                    ddlEspecialidad.DataTextField = "nombre";
                    ddlEspecialidad.DataSource = espNegocio.listar();
                    ddlEspecialidad.DataBind();
                    ddlEspecialidad.Items.Insert(0, new ListItem("Especialidades", "1"));

                    }
                }
                else
                {

                    btnAgendar.Visible = false;
    
                }


            }
            catch (Exception err)
            {
                Session.Add("Error", err.ToString());
                Response.Redirect("Error.aspx");

            }
 

        }

        protected void ddlProfesional_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlProfesional.Visible = true;
                var argument = ddlEspecialidad.SelectedItem.Text;
                //long idEspecialidad = long.Parse(ddlEspecialidad.SelectedValue);
                MedicoNegocio medNegocio = new MedicoNegocio();
                listMedicosConEspe = medNegocio.listar();

                ddlProfesional.DataSource = (listMedicosConEspe).FindAll(x => x.especialidad.nombre.ToString() == argument.ToString());
                ddlProfesional.DataValueField = "idMedico";
                ddlProfesional.DataTextField = "apellido";
                ddlProfesional.DataBind();
                ddlProfesional.Items.Insert(0, new ListItem("Profesionales", "0"));
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }
    }
}