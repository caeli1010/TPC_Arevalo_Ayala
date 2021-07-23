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
    public partial class ListarTurnos : System.Web.UI.Page
    {
        public List<Turno> turnos;
        protected void Page_Load(object sender, EventArgs e)
        {
            TurnoNegocio negocio = new TurnoNegocio();

            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}

            try
            {

                if (!Page.IsPostBack)
                {
                    if (turnos == null)
                    {
                        turnos = negocio.listar();
                        Session["Turnos"] = turnos;
                    }
                }
                rptTurnos.DataSource = turnos;
                rptTurnos.DataBind();

                if (Request.QueryString["dlttrn"] == "s")
                {
                    long idt = long.Parse(Request.QueryString["itr"]);
                    eliminarTurno(idt);
                }
            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                Response.Redirect("Error.aspx");
            }


        }
        private void eliminarTurno(long id)
        {
            //var id = ((Button)sender).CommandArgument;
            List<Turno> seleccionado = turnos;
            Turno turnoSeleccionado = seleccionado.Find(x => x.idTurnos == id);

            TurnoNegocio negocio = new TurnoNegocio();
            negocio.eliminar(turnoSeleccionado.idTurnos);

            seleccionado.Remove(turnoSeleccionado);
            rptTurnos.DataSource = seleccionado;
            rptTurnos.DataBind();
            lblMensaje.Text = "Se ha eliminado correctamente!";
            lblMensaje.CssClass = "alert alert-success text-center";
            lblMensaje.Visible = true;

            //usamos un sweetalert para avisar que el evento se ralizó con exito. 
            ClientScript.RegisterStartupScript(type: GetType(),
                "K", "<script>swal('Ok!', " +
                "'¡El Turno ha sido eliminado con exito!', " +
                "'success'); " +
                "setTimeout(function() {window.location = 'ListarTurnos.aspx';}, 2000); " +
                "</script>");

        }
    }
}