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
    public partial class BajaMedico : System.Web.UI.Page
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

                    txtMatricula.Text = doctor.matricula.ToString();
                        txtNombre.Text = doctor.nombre;
                        txtApellido.Text = doctor.apellido;
                        txtDoc.Text = doctor.dni;                 
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");

            }
          

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
            MedicoNegocio negocio = new MedicoNegocio();
            negocio.eliminar(doctor);

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

    }
}