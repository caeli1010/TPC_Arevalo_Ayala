using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class EspecialidadNegocio
    {
        public List<Especialidad> listar()
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT IDESPECIALIDAD, NOMBRE FROM ESPECIALIDADES");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.idEspecialidad = (int)datos.Lector["IDESPECIALIDAD"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    lista.Add(aux);

                }
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void agregar(Especialidad nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = @"values('" + nuevo.nombre + "')";
                datos.setearConsulta(@"insert into ESPECIALIDADES ( NOMBRE ) " + valores);
                datos.ejecutarAccion();

            }
            catch (global::System.Exception)
            {
                throw;
            }

            finally
            {
                datos.cerrarConexion();
            }
        }
        public void agregarXMedico(Especialidad nuevo, Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = @"values('" + nuevo.idEspecialidad + "','" + medico.idMedico+ "')";
                datos.setearConsulta(@"insert into ESPECIALIDADXMEDICO ( IDMEDICO, IDESPECIALIDAD ) " + valores);
                datos.ejecutarAccion();

            }
            catch (global::System.Exception)
            {
                throw;
            }

            finally
            {
                datos.cerrarConexion();
            }
        }
        public void modificar(Especialidad modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update EspecialidadS set NOMBRE = @nombre where IDESPECIALIDAD =@id");
                datos.setearParametro("@nombre", modificar.nombre);
                datos.setearParametro("@id", modificar.idEspecialidad);
                datos.ejecutarAccion();
                
            }
            catch (global::System.Exception)
            {
                throw;
            }

            finally
            {
                datos.cerrarConexion();
                datos = null;
            }
        }
        public void eliminar(Especialidad especialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("updateESPECIALIDADES set ESTADO = 0 from WHERE DNI = @id");
                datos.setearParametro("@id", especialidad.idEspecialidad);

                datos.ejecutarAccion();

            }
            catch (global::System.Exception)
            {
                throw;
            }

            finally
            {
                datos.cerrarConexion();
                datos = null;
            }

        }

        public void leerEspecialidad(string nombre)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from ESPECIALIDADES where NOMBRE like " + nombre  + "");
                datos.ejecutarLectura();

            }
            catch (global::System.Exception)
            {
                throw;
            }

            finally
            {
                datos.cerrarConexion();
            }

        }
    }
}
