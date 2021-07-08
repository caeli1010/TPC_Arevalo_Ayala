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
                repetidor.DataSource = pacientes;
                repetidor.DataBind();
            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void eliminiar_Click(object sender, EventArgs e)
        {

            try
            {
                
                var id = ((Button)sender).CommandArgument;
                List<Paciente> seleccionado = (List<Paciente>)Session["Paciente"];
                Paciente pacienteSeleccionado = seleccionado.Find(x => x.idPaciente.ToString() == id);

                PacienteNegocio negocio = new PacienteNegocio();
                negocio.eliminar(pacienteSeleccionado.dni);

                seleccionado.Remove(pacienteSeleccionado);
                repetidor.DataSource = seleccionado;
                repetidor.DataBind();

                //lblMensaje.Text = "Eliminado!";
                //lblMensaje.CssClass = "alert alert-success";
                //lblMensaje.Visible = true;


                //string mensaje = string.Empty;
                //if (string.IsNullOrEmpty(txtApellido.Text)) mensaje += " El apellido es obligatorio,";

                //if () throw new Exception(mensaje.TrimEnd(','));
                ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>swal({title: 'Quieres eliminar el registro?', text: 'Se realizará una  baja lógica, si deseas recuperar el paciente comunicate con el administrador del sistema', icon: 'warning', buttons: true, dangerMode: true,}).then((willDelete) => { if (willDelete) { swal('¡El paciente ha sido eliminado!', { icon: 'success',}); } else { swal('No se realizaron cambios!'); }}); window.location = 'ListarPacientes.aspx'</script>");
                //ClientScript.RegisterStartupScript(
                //    this.GetType(),
                //    "Mensaje",
                //    "<script> swal('Correcto!', ' La accion se realizó con exito!', 'success')</script>"
                //);

                //ClientScript.RegisterClientScriptBlock(
                //       this.GetType(),"Mensaje","<script> swal('Correcto!', ' La accion se realizó con exito!', 'success')</script>", true
                //   );

            }
            catch (Exception ex)
            {

                ClientScript.RegisterClientScriptBlock(
                        this.GetType(),
                        "Mensaje",
                        "<scripr> swal('Error!', '" + ex.Message + "!', 'error')</script>",
                        true
                    );
            }
            
        }
             
    }
}