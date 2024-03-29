﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Dominio;
using Negocio;

namespace Presentacion
{
    public partial class SolicitudTurno : System.Web.UI.Page
    {
        public List<Especialidad> listEspecialidades;
        public List<Horario> listHorarioConMedicos;
        public List<Medico> listMedicosConEspe;
        public List<Paciente> listPacientes;
        //private Medico medico;
        private Paciente paciente;
        private long idt;
        private DateTime dateValue;
        private DateTime date1 = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               

                if (Request.QueryString["ipc"] != null)
                {
                    EspecialidadNegocio espNegocio = new EspecialidadNegocio();
                                      
                    listPacientes = (List<Paciente>)Session["Paciente"];
                    paciente = listPacientes.Find(X => X.idPaciente.ToString() == Request.QueryString["ipc"]);

                    lblNombre.Text = (string)paciente.nombre + " " + (string)paciente.apellido;
                    lblDni.Text = (string)paciente.dni;
                    lblEmail.Text = (string)paciente.mail;
                    lblObraSocial.Text = (string)paciente.obraSocial.nombre;
                    //turno.fechaHora = DateTime.Parse(txtFecha.Text); //seria prudente colocar la fecha del dia
                    if (!IsPostBack)
                    {

                        ddlEspecialidad.DataValueField = "idEspecialidad";
                        ddlEspecialidad.DataTextField = "nombre";
                        ddlEspecialidad.DataSource = espNegocio.listar();
                        ddlEspecialidad.DataBind();
                        ddlEspecialidad.Items.Insert(0, new ListItem("Especialidades", "0"));

                    }
                    if (!string.IsNullOrEmpty(Request.QueryString["rep"])) {
                        idt = long.Parse(Request.QueryString["rep"]);
                    }
                }
                else
                {

                    btnAgendar.Visible = false;
    
                }


            }
            catch (Exception err)
            {
                Session.Add("Error", err.ToString());
                Response.Redirect("Error.aspx");

            }
 

        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                long idEsp = long.Parse(ddlEspecialidad.SelectedItem.Value);
                MedicoNegocio medNegocio = new MedicoNegocio();
                listMedicosConEspe = medNegocio.leerMedicoXEspecialidad(idEsp);
                ddlProfesional.Visible = true;
                lblProfesional.Visible = true;
                //long idEspecialidad = long.Parse(ddlEspecialidad.SelectedValue);


                ddlProfesional.DataSource = listMedicosConEspe;
                ddlProfesional.DataValueField = "idMedico";
                ddlProfesional.DataTextField = "apellido";
                ddlProfesional.DataBind();
                ddlProfesional.Items.Insert(0, new ListItem("Profesionales", "0"));
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void ddlProfesional_SelectedIndexChanged(object sender, EventArgs e)
        {


            ddlMeses.Visible = true;
            lblMese.Visible = true;

            

        }

        protected void ddlMeses_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlDiasSemana.Visible = true;
            lblDias.Visible = true;

            long idMed = long.Parse(ddlProfesional.SelectedItem.Value);
            HorarioNegocio horarioNegocio = new HorarioNegocio();
            listHorarioConMedicos = horarioNegocio.leerHorario(idMed);
            //listHorarioConMedicos.ToString();
            List<string> dia = new List<string>();
            //for (int i = 0; i < listHorarioConMedicos.Count(); i++)
            foreach (Horario itemss in listHorarioConMedicos)
            {
                switch (itemss.idDias)
                {
                    case 1: dia.Add("Lunes"); break;
                    case 2: dia.Add("Martes"); break;
                    case 3: dia.Add("Miercoles"); break;
                    case 4: dia.Add("Jueves"); break;
                    case 5: dia.Add("Viernes"); break;
                    case 6: dia.Add("Sabado"); break;
                    case 7: dia.Add("Domingo"); break;
                    default: break;
                }
            }



            //ddlDiasSemana.DataValueField = "index";
            //ddlDiasSemana.DataTextField = "Valor";
            ddlDiasSemana.DataSource = dia;
            ddlDiasSemana.DataBind();
            ddlDiasSemana.Items.Insert(0, new ListItem("Dias", "0"));

        }

        protected void ddlDiasSemana_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idDiaSemana = (int)date1.DayOfWeek;
            byte diaSeleccionado = byte.Parse(ddlDiasSemana.SelectedIndex.ToString());
            int diferncia = diaSeleccionado - idDiaSemana;

            if (idDiaSemana > diaSeleccionado)
            {
                date1.AddDays(7 + diferncia);
            }
            else
            {
                date1.AddDays(diferncia);
            }

            dateValue = new DateTime(date1.Year, int.Parse(ddlMeses.SelectedItem.Value), date1.Day + 5);
            lblTurno.Text = dateValue.ToString();
            lblTurno.Visible = true;
            ddlHorario.Visible = true;
            lblHorario.Visible = true;
        }
        protected void ddlHorario_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAgendar.Visible = true;

        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {


            try
            {

                dateValue = new DateTime(2021, int.Parse(ddlMeses.SelectedItem.Value), 1);

                ClientScript.RegisterStartupScript(type: GetType(),
               "K", "<script>swal('Exito!', " +
               "'¡Correcto se ha agendado el turno y el paciente recibirá un mensaje al correo: " + paciente.mail.ToString() + "  ', " +
               "'success'); " +
               " console.log('hola mundo'); " +
               "</script>");

                btnVolver.Visible = true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {

            Response.Redirect("ListarTurnos.aspx");
        }

        protected void btnDias_Click(object sender, EventArgs e)
        {
            ddlHorario.Visible = true;
            lblHorario.Visible = true;
        }

        //protected void clndFecha_TextChanged(object sender, EventArgs e)
        //{
            

        //    int idDiaSemana = (int)date1.DayOfWeek;
        //    byte diaSeleccionado = byte.Parse(clndFecha.Text);
        //    int diferncia = diaSeleccionado - idDiaSemana;

        //    if (idDiaSemana > diaSeleccionado)
        //    {
        //        date1.AddDays(7 + diferncia);
        //    }
        //    else
        //    {
        //        date1.AddDays(diferncia);
        //    }
        //    ///date1.AddDays()
        //    //dateValue = new DateTime(date1.Year, int.Parse(ddlMeses.SelectedItem.Value), date1.Day);

        //    dateValue = new DateTime(date1.Year, int.Parse(ddlMeses.SelectedItem.Value), date1.Day + 5);
        //    lblTurno.Text = dateValue.ToString();
        //    lblTurno.Visible = true;
        //    ddlHorario.Visible = true;
        //    lblHorario.Visible = true;
        //}
    }
}