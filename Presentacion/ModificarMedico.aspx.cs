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
                    medico = (List<Medico>)Session["Medicos"];
                    doctor = (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);

                    lblApellido.Text = doctor.nombre +" "+ doctor.apellido;
                    txtSexo.Text = doctor.genero.ToString();

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
                if (txtEmail.Text == txtCEmail.Text) {
                    doctor.mail = txtEmail.Text;
                    doctor.genero = txtSexo.Text;
                    MedicoNegocio negocio =  new MedicoNegocio();
                    negocio.modificar(doctor);
                    Response.Redirect("ListarMedicos.aspx");
                }
                else
                {
                    //Definimos mensajes para la clase alert de bootstrp y cambiamos la bandera del label a true para mostrarlo.
                    lblMensaje.Text = "Los email ingresados no coinciden!";
                    lblMensaje.CssClass = "alert alert-danger text-center";
                    lblMensaje.Visible = true;

                    //usamos un sweetalert para avisar que el evento se ralizó con exito. 
                    ClientScript.RegisterStartupScript(type: GetType(),
                        "K", "<script>"+
                        "setTimeout(function() {window.location = 'ListarPacientes.aspx';}, 5000); " +
                        "</script>");

                }
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