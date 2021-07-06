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
    public partial class ListarPacientes : System.Web.UI.Page
    {
        public List<Paciente> pacientes;
        public string dni;
        protected void Page_Load(object sender, EventArgs e)
        {
            PacienteNegocio negocio = new PacienteNegocio();

            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login2.aspx");
            //}

            try
            {
                //if (Session["Paciente"] == null)
                //{
                pacientes = negocio.listar();
                    Session.Add("Paciente", pacientes);
                //}
                //else
                //{
                    if (Request.QueryString["dni"] != null)
                    {
                        dni = Request.QueryString["dni"];
                    }
                    pacientes = (List<Paciente>)Session["Paciente"];
                //}
               
            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void eliminiar_Click(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            //var id = ((Button)sender).CommandArgument;
            ClientScript.RegisterClientScriptBlock(
                this.GetType(),
                "K",
                "swal('Barrado!', 'Su registro se ha elimniado ameo , 'succeess')",
                true);
        }
              
        //protected void btnEliminar_Click(object sender, EventArgs e)
        //{
        //    //string mensaje = '';
        //    ScriptManager.RegisterStartupScript(
        //        this, 
        //        this.GetType(),
        //        "alert",
        //        "alert('Vas a eliminar el paciente.'); windows.location='ListarPacientes.aspx'",
        //        true
        //        );

        //}
    }
}