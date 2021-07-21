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
        public List<Horario> horaXDias;
        private Medico doctor;
        private Horario horario;
        protected void Page_Load(object sender, EventArgs e)
        {
            HorarioNegocio negocio = new HorarioNegocio();
            MedicoNegocio profesionales = new MedicoNegocio();
            try
            {
                if (Request.QueryString["idM"] != null)
                {
                    medico = profesionales.listar();
                    doctor = (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);

                    lblMensaje.Visible = false;
                    lblNombre.Text = doctor.nombre + " " + doctor.apellido;
                    horariosRep.DataSource = negocio.leerHorario(doctor.idMedico);
                    horariosRep.DataBind();
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
                if (string.IsNullOrEmpty(txtIngreso.Text)) mensaje += "| El horario de ingreso es obligatorio,";
               
                //lanzamos la excepcion solo en caso de que haya algun camp
                if (!string.IsNullOrEmpty(mensaje)) throw new Exception(mensaje.TrimEnd(','));

                HorarioNegocio negocio = new HorarioNegocio();
                horario = new Horario();
                horario.idDias = (byte)ddlDias.SelectedIndex;
                horario.hora = short.Parse(txtTHoras.Text);
                horario.duracion = byte.Parse(txtDuracion.Text);
                horario.horaEntrada = byte.Parse(txtIngreso.Text);
                horario.medico = (Medico)doctor;

                negocio.agregar(horario);
                lblMensaje.Text = "El proceso de agregar el horario se ha realizado correctamente!";
                lblMensaje.CssClass = "alert alert-success text-center";
                lblMensaje.Visible = true;
                btnAgregar.Visible = false;

                ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>" +
                "setTimeout(function() {window.location = 'ListarMedicos.aspx';}, 5000); " +
                 "</script>");
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

        protected void lbtnEliminar_Click(object sender, EventArgs e)
        {
            var id = ((Button)sender).CommandArgument;
            HorarioNegocio negocio = new HorarioNegocio();
            horaXDias = negocio.listar();
            horario = horaXDias.Find(x => x.id.ToString() == id);

            negocio.eliminar(horario.id);

            horaXDias.Remove(horario);
            horariosRep.DataSource = horaXDias;
            horariosRep.DataBind();

        }

        protected void lbtnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnAgregar_Click(object sender, EventArgs e)
        {
            ddlDias.Visible = true;
            lblDias.Visible = true;
            lblDuracion.Visible = true;
            lblTotalHoras.Visible = true;
            lblIngreso.Visible = true;
            txtDuracion.Visible = true;
            txtIngreso.Visible = true;
            txtTHoras.Visible = true;
            btnAgregar.Visible = true;
        }
    }
}