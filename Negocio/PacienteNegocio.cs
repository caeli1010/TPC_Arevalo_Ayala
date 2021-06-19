using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class PacienteNegocio
    {
        public List<Paciente> listar()
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT * FROM PACIENTES");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Paciente aux = new Paciente();
                    aux.apellido = (string)datos.Lector["APELLIDO"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.dni.dni = (string)datos.Lector["DNI"];
                    aux.idObraSocial = (int)datos.Lector["IDOBRASOCIAL"];
                    aux.mail = (string)datos.Lector["MAIL"];
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
        public void agregar(Paciente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = @"values('" +
                                    nuevo.apellido + "', '" +
                                    nuevo.nombre + "', '" +
                                    nuevo.idObraSocial + "', " +
                                    nuevo.fechaNacimiento + ", " +
                                    nuevo.genero + ", '" +
                                    nuevo.dni + "', " +
                                    nuevo.mail + ")";
                datos.setearConsulta(@"insert into PACIENTES (
                                    APELLIDO, 
                                    NOMBRE,
                                    IDOBRASOCIAL, 
                                    FECHANAC, 
                                    SEXO, 
                                    DNI, 
                                    EMAIL
                                    ) " + valores);
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
        public void modificar(Paciente modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //datos.setearConsulta("update PACIENTES set IDOBRASOCIAL = @obsoc");
                //datos.setearParametro("@obsoc", modificar.idObraSocial);
                //datos.ejecutarAccion();

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
        public void eliminar(Paciente Paciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //datos.setearConsulta("update PACIENTES set ESTADO = 0 WHERE DNI = @dni");
                //datos.setearParametro("@dni", Paciente.dni);
                //datos.ejecutarAccion();

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
        public void leerPaciente(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from PACIENTES where DNI = " + dni + "");
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