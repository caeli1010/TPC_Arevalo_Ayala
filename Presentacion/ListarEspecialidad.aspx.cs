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
    public partial class ListarEspecialidad : System.Web.UI.Page
    {
    public List<Especialidad> lista;
    public List<Medico> doctor;
        protected void Page_Load(object sender, EventArgs e)
        {
        EspecialidadNegocio negocio = new EspecialidadNegocio();
        MedicoNegocio datos = new MedicoNegocio();
            try
            {
                lista = (List<Especialidad>)Session["Especialidad"];
                if (lista == null)
                {
                    lista = negocio.listar();
                    Session.Add("Especialidad", lista);
                }
                else
                {
                    lista = (List<Especialidad>)Session["Especialidad"];
                }
                //repetidor.DataSource = lista;
                //repetidor.DataBind();

                Especialidad especial;
                foreach (Especialidad item in lista)
                {
                    especial = (Especialidad)lista.Find(x => x.idEspecialidad == item.idEspecialidad);
                    doctor = datos.leerMedicoXEspecialidad(especial.idEspecialidad);
                    repetidor.DataSource = doctor;
                    repetidor.DataBind();
                }

            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }
    }
}