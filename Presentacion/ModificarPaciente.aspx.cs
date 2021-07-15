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
    public partial class ModificarPaciente : System.Web.UI.Page
    {
        public List<Paciente> paciente = null;
        public List<Obrasocial> oSocial = null;
        public Obrasocial obrasocial = null;
        public Paciente seleccionado = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ipc"] != null)
                {
                    paciente = (List<Paciente>)Session["Paciente"];
                     seleccionado = paciente.Find(X => X.idPaciente.ToString() == Request.QueryString["ipc"]);
                    
                    ObrasocialNegocio oNegocio = new ObrasocialNegocio();
                    oSocial = oNegocio.listar();
                    obrasocial = oSocial.Find(k => k.idObraSocial == seleccionado.obraSocial.idObraSocial);

                    ddlObSocial.DataValueField = "idObrasocial";
                    ddlObSocial.DataTextField = "nombre";
                    ddlObSocial.DataSource = oNegocio.listar();
                    ddlObSocial.DataBind();
                    ddlObSocial.Items.Insert(0, new ListItem(obrasocial.nombre, obrasocial.idObraSocial.ToString()));


                    if (!IsPostBack)
                    {
                        txtPaciente.Text = (string)seleccionado.nombre + " " + (string)seleccionado.apellido;
                        txtDNI.Text = (string)seleccionado.dni;
                        txtId.Text = seleccionado.idPaciente.ToString();
                        txtEmail.Text = (string)seleccionado.mail;
                        txtGenero.Text = (string)seleccionado.genero;
                    }

                }

            }
            catch (Exception err)
            {
                Session.Add("Error", err.ToString());
                Response.Redirect("Error.aspx");

            }

        }

        protected void btnModificarPte(object sender, EventArgs e)
        {
            PacienteNegocio negocio = new PacienteNegocio();

            if (!string.IsNullOrEmpty(txtId.Text))
            {
                seleccionado.obraSocial.idObraSocial = int.Parse(ddlObSocial.SelectedItem.Value);
                seleccionado.nroCarnet = int.Parse(txtNroCarnet.Text);
                seleccionado.mail = (string)txtEmail.Text;
                negocio.modificar(seleccionado);
                Response.Redirect("ListarPacientes.aspx");

            }
        }
    }
}