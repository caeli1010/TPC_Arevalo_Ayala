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
    public partial class AgregarHorario : System.Web.UI.Page
    {
        public List<Horario> lista;
        public List<Medico> medico;
        private Medico doctor;
        private Horario horario;
        protected void Page_Load(object sender, EventArgs e)
        {
        
            try
            {
                if (Request.QueryString["idM"] != null)
                {
                    medico = (List<Medico>)Session["medicos"];
                    doctor = (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);

                    lblNombre.Text = doctor.nombre + " " + doctor.apellido;
                    //lblDni.Text = doctor.dni;
                    //lblMatricula.Text = doctor.matricula.ToString();
                    //lblEmail.Text = doctor.mail;

                    //if (!Page.IsPostBack)
                    //{
                    //    ddlDias.Items.Insert(0, new ListItem("Seleccione una opción", "1"));
                    //}
                }

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
                string mensaje = string.Empty;
                if (string.IsNullOrEmpty(txtDuracion.Text)) mensaje += "| La duracion de trabajo es obligatorio,";
                if (string.IsNullOrEmpty(txtTHoras.Text)) mensaje += "| El tiempo por turno es obligatorio,";
               
                //lanzamos la excepcion solo en caso de que haya algun camp
                if (!string.IsNullOrEmpty(mensaje)) throw new Exception(mensaje.TrimEnd(','));

                HorarioNegocio negocio = new HorarioNegocio();
                horario = new Horario();
                horario.idDias = (int)ddlDias.SelectedIndex;
                horario.hora = int.Parse(txtTHoras.Text);
                horario.duracion = int.Parse(txtDuracion.Text);
                horario.medico = (Medico)doctor;

                negocio.agregar(horario);
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

        protected void btnInsertarHorario_Click(object sender, EventArgs e)
        {
            ddlDias.Text = String.Empty;
            txtDuracion.Text = String.Empty;
            txtTHoras.Text = String.Empty;
        }
    }
}