﻿using System;
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
                Paciente pacienteSeleccionado = (Paciente)seleccionado.Find(x => x.idPaciente.ToString() == id);

                PacienteNegocio negocio = new PacienteNegocio();
                negocio.eliminar(pacienteSeleccionado);

                seleccionado.Remove(pacienteSeleccionado);
                repetidor.DataSource = seleccionado;
                repetidor.DataBind();

                //string mensaje = string.Empty;
                //if (string.IsNullOrEmpty(txtApellido.Text)) mensaje += " El apellido es obligatorio,";

                //if () throw new Exception(mensaje.TrimEnd(','));

                ClientScript.RegisterClientScriptBlock(
                       this.GetType(),"Mensaje","<scripr> swal('Correcto!', ' La accion se realizó con exito!', 'success')</script>", true
                   );

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