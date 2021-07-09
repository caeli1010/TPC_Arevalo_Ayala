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
        public List<Especialidad> insertar; 
        public List<Especialidad> especial;
        public List<Medico> medico;
        private Medico doctor;
        private Especialidad especialidad;
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Session.Add("especialidad", negocio.listar());
            insertar = (List<Especialidad>)Session["especialidad"];
            try
            {
                if(Request.QueryString["idM"] != null)
                {
                    medico = (List<Medico>)Session["medicos"];
                    doctor= (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);
                    
                    lblNombre.Text = doctor.nombre +" "+ doctor.apellido;
                    Session.Add("EspecialidadXMedico", negocio.leerEspecialidad(doctor.idMedico));
                    especial = (List<Especialidad>)Session["EspecialidadXMedico"];
                    repetidor.DataSource = especial;
                    repetidor.DataBind();                       

                    if (!Page.IsPostBack)
                    {
                        ddlEspecialidad.DataValueField = "idEspecialidad";
                        ddlEspecialidad.DataTextField = "nombre";
                        ddlEspecialidad.DataSource = negocio.listar();
                        ddlEspecialidad.DataBind();
                        ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
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

                var argument = ddlEspecialidad.SelectedItem.Value;
                especialidad = (Especialidad)insertar.Find(X => X.idEspecialidad.ToString() == argument.ToString());
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
           
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                negocio.agregarXMedico(especialidad, doctor);
                Session.Add("EspecialidadXMedico", negocio.leerEspecialidad(doctor.idMedico));
                especial = (List<Especialidad>)Session["EspecialidadXMedico"];
                repetidor.DataSource = especial;
                repetidor.DataBind();
                //ClientScript.RegisterStartupScript(type: GetType(), "mensaje", "<script>" +
                //"window.location='AgregarEspecilidad.aspx?idM="+doctor.idMedico+"'</script>");
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
           
           
        }

        protected void btnAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            try
            {
                btnAgregarEspecialidad.Visible = false;
                lblEspecialidad.Visible = true;
                ddlEspecialidad.Visible = true;
                btnGuardar.Visible = true;
             
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");

            }
        }

        protected void btnNEspecialidad_Click(object sender, EventArgs e)
        {
            btnHabilitar.Visible = true;
            txtNEspecialidad.Visible = true;

        }

        protected void btnHabilitar_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            string nuevo = txtNEspecialidad.Text;
            negocio.agregar(nuevo);

        }
    }
}