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
    public partial class AgregarEspecialidad : System.Web.UI.Page
    {
        public List<Especialidad> insertar; 
        public List<Especialidad> especial;
        public List<Medico> medico;
        private Medico doctor;
        private Especialidad especialidad;
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            MedicoNegocio profesionales = new MedicoNegocio();
            insertar = negocio.listar();
            try
            {
                if(Request.QueryString["idM"] != null)
                {
                    medico = profesionales.listar();
                    doctor= (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);
                    
                    lblNombre.Text = doctor.nombre +" "+ doctor.apellido;

                    especial = negocio.leerEspecialidad(doctor.idMedico);
                    repetidor.DataSource = especial;
                    repetidor.DataBind();

                    if (!Page.IsPostBack)
                    {
                        ddlEspecialidad.DataValueField = "idEspecialidad";
                        ddlEspecialidad.DataTextField = "nombre";
                        ddlEspecialidad.DataSource = negocio.listar();
                        ddlEspecialidad.DataBind();
                        ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
                    }
                }
            //Cuando el id especialidad viene de ListarEspecialidad, oculta los elemento utilizados en Listar Medicos
                if(Request.QueryString["idE"] != null)
                {
                    btnAgregarEspecialidad.Visible = false;
                    lblEspecialidad.Visible = false;
                    ddlEspecialidad.Visible = false;
                    btnGuardar.Visible = false;
                    btnHabilitar.Visible = false;
                    lbtnNEspecialidad.Visible = false;
                    lblNombre.Visible = false;
                    repetidor.Visible = false;
                    lblMensaje.Visible = false;

                    especialidad = (Especialidad)insertar.Find(x => x.idEspecialidad.ToString() == Request.QueryString["idE"]);

                    if (Request.QueryString["d"] == "e")
                    {
                        //Elimina una especialidad
                        btnElEspecialidad.Visible = true;
                        lblNEspecialidad.Visible = true;
                        txtEspecialidad.Visible = true;

                    }
                    else
                    {
                        //Modifica una especialidad
                        btnModEspecialidad.Visible = true;
                        lblNEspecialidad.Visible = true;
                        txtEspecialidad.Visible = true;

                    }

                   
                }
                else
                {
                    if(Request.QueryString["d"] == "a")
                    {
                        btnAgregarEspecialidad.Visible = false;
                        lblEspecialidad.Visible = false;
                        ddlEspecialidad.Visible = false;
                        btnGuardar.Visible = false;
                        lbtnNEspecialidad.Visible = false;
                        lblNombre.Visible = false;
                        repetidor.Visible = false;
                        lblMensaje.Visible = false;

                        btnHabilitar.Visible = true;
                        lblNEspecialidad.Visible = true;
                        txtEspecialidad.Visible = true;

                    }
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }
      
        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            { 

                var argument = ddlEspecialidad.SelectedItem.Value;
                especialidad = (Especialidad)insertar.Find(X => X.idEspecialidad.ToString() == argument.ToString());
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
           
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                negocio.agregarXMedico(especialidad, doctor);
                especial = negocio.leerEspecialidad(doctor.idMedico);
                repetidor.DataSource = especial;
                repetidor.DataBind();

                lblMensaje.Text = "El proceso de agregar la especialidad se ha realizado correctamente!";
                lblMensaje.CssClass = "alert alert-success text-center";
                lblMensaje.Visible = true;

                ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>" +
                "setTimeout(function() {window.location = 'ListarMedicos.aspx';}, 5000); " +
                 "</script>");
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
           
           
        }

        protected void btnAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            try
            {
                btnAgregarEspecialidad.Visible = false;
                lblEspecialidad.Visible = true;
                ddlEspecialidad.Visible = true;
                btnGuardar.Visible = true;
                lbtnNEspecialidad.Visible = true;
             
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");

            }
        }


        protected void btnHabilitar_Click(object sender, EventArgs e)
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                string nuevo = txtEspecialidad.Text;
                negocio.agregar(nuevo);

                //Definimos mensajes para la clase alert de bootstrp y cambiamos la bandera del label a true para mostrarlo.
                lblMensaje.Text = "El proceso de agregar la especialidad se ha realizado correctamente!";
                lblMensaje.CssClass = "alert alert-success text-center";
                lblMensaje.Visible = true;

                //usamos un sweetalert para avisar que el evento se ralizó con exito. 
                    if(Request.QueryString["d"] == "a")
                    {
                        ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>" +
                        "setTimeout(function() {window.location = 'ListarEspecialidad.aspx';}, 5000); " +
                         "</script>");
                        
                    }
                else
                {

                    long i = doctor.idMedico;
                    ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>" +
                       "setTimeout(function() {window.location = 'AgregarEspecialidad.aspx?idM=i';}, 5000); " +
                        "</script>");

                    if (lblMensaje.Visible == false)
                    {
                        btnHabilitar.Visible = false;
                        txtEspecialidad.Visible = false;
                        lbtnNEspecialidad.Visible = true;
                        lblEspecialidad.Visible = true;
                        ddlEspecialidad.Visible = true;
                        btnGuardar.Visible = true;

                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void lbtnNEspecialidad_Click(object sender, EventArgs e)
        {
            try
            {
                btnHabilitar.Visible = true;
                txtEspecialidad.Visible = true;
                lbtnNEspecialidad.Visible = false;
                lblEspecialidad.Visible = false;
                ddlEspecialidad.Visible = false;
                btnGuardar.Visible = false;

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }


        }

        protected void btnElEspecialidad_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad datos = new Especialidad();

            txtEspecialidad.Text = especialidad.nombre;

            datos.idEspecialidad = especialidad.idEspecialidad;
            datos.nombre = txtEspecialidad.Text;
            negocio.eliminar(datos);

            lblMensaje.Text = "El proceso de eliminar la especialidad se ha realizado correctamente!";
            lblMensaje.CssClass = "alert alert-success text-center";
            lblMensaje.Visible = true;

            ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>" +
             "setTimeout(function() {window.location = 'ListarEspecialidad.aspx';}, 5000); " +
              "</script>");
        }

        protected void btnModEspecialidad_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad datos = new Especialidad();

            txtEspecialidad.Text = especialidad.nombre;
            //ver porque no modifica
            datos.idEspecialidad = especialidad.idEspecialidad;
            datos.nombre = txtEspecialidad.Text;
            negocio.modificar(datos);

            lblMensaje.Text = "El proceso de modoficar la especialidad se ha realizado correctamente!";
            lblMensaje.CssClass = "alert alert-success text-center";
            lblMensaje.Visible = true;

            ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>" +
            "setTimeout(function() {window.location = 'ListarEspecialidad.aspx';}, 5000); " +
             "</script>");
        }
    }
}