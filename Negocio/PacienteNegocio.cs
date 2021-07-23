using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
                datos.setearConsulta(@"SELECT
	                                    P.IDPACIENTE,
	                                    P.APELLIDO,
	                                    P.SEXO,
	                                    OS.IDOBRASOCIAL,
	                                    OS.NOMBRE as OSNOMBRE ,
	                                    P.FECHANAC,
	                                    P.NOMBRE,
	                                    COALESCE ( P.EMAIL, 'sin correo' ) AS EMAIL,
	                                    COALESCE ( P.NROCARNET, 0000 ) AS NROCARNET,
	                                    COALESCE ( P.DNI, 'sin dni' ) AS DNI 
                                    FROM
	                                    PACIENTES AS P
	                                    INNER JOIN OBRAS_SOCIALES AS OS ON OS.IDOBRASOCIAL= P.IDOBRASOCIAL WHERE P.ESTADO = 1 ORDER BY P.IDPACIENTE DESC");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Paciente aux = new Paciente();
                    aux.idPaciente = (long)datos.Lector["IDPACIENTE"];
                    aux.apellido = (string)datos.Lector["APELLIDO"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.genero = (string)datos.Lector["SEXO"];
                    aux.fechaNacimiento = (DateTime)datos.Lector["FECHANAC"];
                    aux.mail = (string)datos.Lector["EMAIL"];
                    aux.nroCarnet = (int)datos.Lector["NROCARNET"];
                    aux.dni = (string)datos.Lector["DNI"];
                    aux.obraSocial = new Obrasocial((int)datos.Lector["IDOBRASOCIAL"]);
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
                datos.setearConsulta(@"insert into PACIENTES (APELLIDO, NOMBRE, IDOBRASOCIAL,  FECHANAC,  SEXO, DNI, EMAIL, NROCARNET, ESTADO)
                 VALUES(@apellido, @nombre, @idObraSocial, @fecha, @genero, @dni, @mail, @nroCarnet, @estado)");
                datos.setearParametro("@apellido", nuevo.apellido);
                datos.setearParametro("@nombre", nuevo.nombre);
                datos.setearParametro("@idObraSocial", nuevo.obraSocial.idObraSocial);
                datos.setearParametro("@fecha", nuevo.fechaNacimiento);
                datos.setearParametro("@genero", nuevo.genero);
                datos.setearParametro("@dni", nuevo.dni);
                datos.setearParametro("@mail", nuevo.mail);
                datos.setearParametro("@nroCarnet", nuevo.nroCarnet);
                datos.setearParametro("@estado", 1);

                datos.ejecutarAccion();



            }
            catch (global::System.Exception ex)
            {
                throw ex;
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
                datos.setearConsulta(@"update PACIENTES 
                SET NROCARNET= @nroCarnet, 
                    IDOBRASOCIAL = @idObraSocial, 
                    EMAIL = @email 
                WHERE IDPACIENTE = @idPaciente");
                datos.setearParametro("@idPaciente", modificar.idPaciente);
                datos.setearParametro("@nroCarnet", modificar.nroCarnet);
                datos.setearParametro("@idObraSocial", modificar.obraSocial.idObraSocial);
                datos.setearParametro("@email", modificar.mail);
                datos.ejecutarAccion();

            }
            catch (global::System.Exception ex)
            {
                throw ex;
            }

            finally
            {
                datos.cerrarConexion();
                datos = null;
            }
        }
        public void eliminar(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update PACIENTES set ESTADO = 0 WHERE DNI = @dni");
                datos.setearParametro("@dni", dni);
                datos.ejecutarAccion();

            }
            catch (global::System.Exception ex)
            {
                throw ex;
            }

            finally
            {
                datos.cerrarConexion();
                datos = null;
            }

        }
        public Paciente leerPaciente(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from PACIENTES where DNI = @dni");
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();
                Paciente aux = new Paciente();
                while (datos.Lector.Read())
                {
                    aux.idPaciente = (long)datos.Lector["IDPACIENTE"];
                    aux.apellido = (string)datos.Lector["APELLIDO"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.genero = (string)datos.Lector["SEXO"];
                    aux.fechaNacimiento = (DateTime)datos.Lector["FECHANAC"];
                    aux.mail = (string)datos.Lector["EMAIL"];
                    aux.nroCarnet = (int)datos.Lector["NROCARNET"];
                    aux.dni = (string)datos.Lector["DNI"];
                    aux.obraSocial = new Obrasocial((int)datos.Lector["IDOBRASOCIAL"]);
                }
                return aux;

            }
            catch (global::System.Exception ex)
            {
                throw ex;
            }

            finally
            {
                datos.cerrarConexion();
            }

        }
    }
}
