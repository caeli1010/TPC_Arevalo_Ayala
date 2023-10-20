using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public AccesoDatos()
        {
            conexion = new SqlConnection("data source =.\\SQLEXPRESS; initial catalog=AREVALO_AYALA_DB; integrated security=sspi");
            //conexion = new SqlConnection("data source =.\\SQLEXPRESS; initial catalog=AREVALO_AYALA_DB; integrated security=sspi");
            comando = new SqlCommand();
            //conexion = new SqlConnection("data source=.\\SQLEXPRESS; initial catalog=DB_Miranda_Paz; integrated security=sspi");
            //comando = new SqlCommand();
        }
        public void setearConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void ejecutarLectura()
        {
            comando.Connection = conexion;
            conexion.Open();
            lector = comando.ExecuteReader();
        }
        public void cerrarConexion()
        {
            if(lector != null)
            {
                lector.Close();
                conexion.Close();
            }
        }
        public SqlDataReader Lector
        {
            get { return lector; }
        }
        internal void ejecutarAccion()
        {
            comando.Connection = conexion;
            conexion.Open();
            comando.ExecuteNonQuery();
        }
        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
    }
}
