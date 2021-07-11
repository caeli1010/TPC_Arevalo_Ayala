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
        public List<Paciente> listPacientes;
        private Paciente paciente;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               

                if (Request.QueryString["ipc"] != null)
                {
                    EspecialidadNegocio espNegocio = new EspecialidadNegocio();
                  

                    listPacientes = (List<Paciente>)Session["Paciente"];
                    paciente = listPacientes.Find(X => X.idPaciente.ToString() == Request.QueryString["ipc"]);

                    lblNombre.Text = (string)paciente.nombre + " " + (string)paciente.apellido;
                    lblDni.Text = (string)paciente.dni;
                    lblEmail.Text = (string)paciente.mail;
                    lblObraSocial.Text = (string)paciente.obraSocial.nombre;
                    //turno.fechaHora = DateTime.Parse(txtFecha.Text); //seria prudente colocar la fecha del dia
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
                long idEsp = long.Parse(ddlEspecialidad.SelectedItem.Value);
                MedicoNegocio medNegocio = new MedicoNegocio();
                listMedicosConEspe = medNegocio.leerMedicoXEspecialidad(idEsp);
                ddlProfesional.Visible = true;
                //long idEspecialidad = long.Parse(ddlEspecialidad.SelectedValue);


                ddlProfesional.DataSource = listMedicosConEspe;
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