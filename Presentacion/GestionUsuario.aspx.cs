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
    public partial class GestionUsuario : System.Web.UI.Page
    {
        public List<Usuario> usuarios;
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario datos = new Usuario();

            datos.idRol = 3;
            datos.username = txtUser.Text;
            datos.password = txtPassw.Text;
            datos.dni = txtDNI.Text;
            negocio.agregar(datos);
        }
    }
}