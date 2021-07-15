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

                if (!Page.IsPostBack)
                {
                    if (pacientes == null)
                    {
                        pacientes = negocio.listar();
                        Session["Paciente"] = pacientes;
                    }
                }

                repetidor.DataSource = pacientes;
                repetidor.DataBind();

                if (Request.QueryString["dltpte"] == "s")
                {
                    long idp = long.Parse(Request.QueryString["ipc"]);
                    eliminarPaciente(idp);
                }
            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                Response.Redirect("Error.aspx");
            }



        }
        

        private void eliminarPaciente(long id)
        {
            //var id = ((Button)sender).CommandArgument;
            List<Paciente> seleccionado = pacientes;
            Paciente pacienteSeleccionado = seleccionado.Find(x => x.idPaciente == id);

            PacienteNegocio negocio = new PacienteNegocio();
            negocio.eliminar(pacienteSeleccionado.dni);

            seleccionado.Remove(pacienteSeleccionado);
            repetidor.DataSource = seleccionado;
            repetidor.DataBind();

            //Definimos mensajes para la clase alert de bootstrp y cambiamos la bandera del label a true para mostrarlo.
            lblMensaje.Text = "El proceso de eliminar el  Paciente se ha realizado correctamente!";
            lblMensaje.CssClass = "alert alert-success text-center";
            lblMensaje.Visible = true;

            //usamos un sweetalert para avisar que el evento se ralizó con exito. 
            ClientScript.RegisterStartupScript(type: GetType(),
                "K", "<script>swal('Ok!', " +
                "'¡El paciente ha sido eliminado con exito!', " +
                "'success'); " +
                "setTimeout(function() {window.location = 'ListarPacientes.aspx';}, 5000); " +
                "</script>");

        }
        
    }
}