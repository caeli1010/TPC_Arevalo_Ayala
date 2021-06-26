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
    public partial class SolicitudTurno : System.Web.UI.Page
    {
        public List<Paciente> paciente = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            paciente = (List<Paciente>)Session["Paciente"];
            Paciente seleccionado = paciente.Find(X => X.idPaciente.ToString() == Request.QueryString["ipc"]);
            ////lblNombre.Text = (string)seleccionado.nombre;

            lblNombre.Text = (string)seleccionado.apellido;

            //if (Session["Login"] == null)
            //{
            //    Response.Redirect("Login2.aspx");
            //}

        }
    }
}