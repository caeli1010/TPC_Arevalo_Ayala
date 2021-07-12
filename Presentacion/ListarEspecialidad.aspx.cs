using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
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
                repetidorPadre.DataSource = lista;
                repetidorPadre.DataBind();

                Especialidad especial;
                foreach (Especialidad item in lista)
                {
                    especial = (Especialidad)lista.Find(x => x.idEspecialidad == item.idEspecialidad);
                    doctor = datos.leerMedicoXEspecialidad(especial.idEspecialidad);
                  
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void repetidorPadre_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {

            MedicoNegocio negocio = new MedicoNegocio();
            if(e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var idEspecialidad = (HiddenField)e.Item.FindControl("hdfidEspecialidad");
                Repeater repetidorHijo = (Repeater)e.Item.FindControl("repetidorHijo");
                repetidorHijo.DataSource = negocio.leerMedicoXEspecialidad(long.Parse(idEspecialidad.Value));
                repetidorHijo.DataBind();
             }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}