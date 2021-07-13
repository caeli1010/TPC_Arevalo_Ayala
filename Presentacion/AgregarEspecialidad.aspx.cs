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
            Session.Add("especialidad", negocio.listar());
            insertar = (List<Especialidad>)Session["especialidad"];
            try
            {
                if(Request.QueryString["idM"] != null)
                {
                    medico = (List<Medico>)Session["medicos"];
                    doctor= (Medico)medico.Find(X => X.idMedico.ToString() == Request.QueryString["idM"]);
                    
                    lblNombre.Text = doctor.nombre +" "+ doctor.apellido;

                    Session.Add("EspecialidadXMedico", negocio.leerEspecialidad(doctor.idMedico));
                    especial = (List<Especialidad>)Session["EspecialidadXMedico"];
                    repetidor.DataSource = especial;
                    repetidor.DataBind();                       

                    //if (!Page.IsPostBack)
                    //{
                        ddlEspecialidad.DataValueField = "idEspecialidad";
                        ddlEspecialidad.DataTextField = "nombre";
                        ddlEspecialidad.DataSource = negocio.listar();
                        ddlEspecialidad.DataBind();
                        ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
                    //}
                }
            //Cuando el id especialidad viene de ListarEspecialidad, oculta los elemento utilizados en Listar Medicos
                if(Request.QueryString["idM"] != null)
                {
                    btnAgregarEspecialidad.Visible = false;
                    lblEspecialidad.Visible = false;
                    ddlEspecialidad.Visible = false;
                    btnGuardar.Visible = false;
                    btnHabilitar.Visible = false;
                    lbtnNEspecialidad.Visible = false;
                    lblNombre.Visible = false;
                    repetidor.Visible = false;

                    if (Request.QueryString["d"] == "e")
                    {
                        //Elimina una especialidad
                        btnElEspecialidad.Visible = true;
                        lblElEspecialidad.Visible = true;
                        txtElEspecialidad.Visible = true;

                    }
                    //Modifica una especialidad
                    btnModEspecialidad.Visible = true;
                    lblModEspecialidad.Visible = true;
                    txtNEspecialidad.Visible = true;

                   
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

                        btnNEspecialidad.Visible = true;
                        lblNEspecialidad.Visible = true;
                        txtNEspecialidad.Visible = true;

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
                Session.Add("EspecialidadXMedico", negocio.leerEspecialidad(doctor.idMedico));
                especial = (List<Especialidad>)Session["EspecialidadXMedico"];
                repetidor.DataSource = especial;
                repetidor.DataBind();
                Response.Redirect("ListarMedico.aspx");
                //ClientScript.RegisterStartupScript(type: GetType(), "mensaje", "<script>" +
                //"window.location='AgregarEspecilidad.aspx?idM="+doctor.idMedico+"'</script>");
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
                string nuevo = txtNEspecialidad.Text;
                negocio.agregar(nuevo);

                //Definimos mensajes para la clase alert de bootstrp y cambiamos la bandera del label a true para mostrarlo.
                lblMensaje.Text = "El proceso de agregar la especialidad se ha realizado correctamente!";
                lblMensaje.CssClass = "alert alert-success text-center";
                lblMensaje.Visible = true;

                //usamos un sweetalert para avisar que el evento se ralizó con exito. 
                ClientScript.RegisterStartupScript(type: GetType(), "K", "<script>" +
                "setTimeout(function() {window.location = 'AgregarEspecialidad.aspx';}, 5000); " +
                 "</script>");

                if(lblMensaje.Visible == false)
                {
                    btnHabilitar.Visible = false;
                    txtNEspecialidad.Visible = false;
                    lbtnNEspecialidad.Visible = true;
                    lblEspecialidad.Visible = true;
                    ddlEspecialidad.Visible = true;
                    btnGuardar.Visible = true;

                    Session.Add("idM", doctor.idMedico);
                    Response.Redirect("AgregarEspecialidad.aspx");

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
                txtNEspecialidad.Visible = true;
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

        protected void btnNEspecialidad_Click(object sender, EventArgs e)
        {

        }

        protected void btnElEspecialidad_Click(object sender, EventArgs e)
        {

        }

        protected void btnModEspecialidad_Click(object sender, EventArgs e)
        {

        }
    }
}