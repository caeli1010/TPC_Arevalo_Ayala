using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using Microsoft.Ajax.Utilities;

namespace Presentacion
{
    public partial class ListarMedicos : System.Web.UI.Page
    {
        public List<Medico> lista;
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            HorarioNegocio datos = new HorarioNegocio();
            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login2.aspx");
            //}
            try
            {
                lista = (List<Medico>)Session["Medicos"];
                if (lista == null)
                {
                    lista = negocio.listar(); 
                   
                    Session.Add("Medicos", lista);
                }
                else
                {
                  
                    lista = (List<Medico>)Session["Medicos"];
                }
                repetidor.DataSource = lista;
                repetidor.DataBind();
            }
            catch (Exception error)
            {
                Session.Add("Error", error.ToString());
                Response.Redirect("Error.aspx");
            }

        }


        //protected void btnDeshabilitar_Click(object sender, EventArgs e)
        //{
        //    var argument = ((Button)sender).CommandArgument;
        //    List<Medico> seleccionado = (List<Medico>)Session["Medicos"];
        //    Medico medicoSeleccionado = (Medico)seleccionado.Find(x => x.idMedico.ToString() == argument);

        //    MedicoNegocio negocio = new MedicoNegocio();
        //    negocio.eliminar(medicoSeleccionado);

        //    seleccionado.Remove(medicoSeleccionado);
        //    repetidor.DataSource = seleccionado;
        //    repetidor.DataBind();
        //}
    }
}