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
            //    Response.Redirect("Login2.aspx");

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

        }
    }
}