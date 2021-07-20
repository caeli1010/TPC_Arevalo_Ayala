using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TurnoNegocio
    {
        public List<Turno> listar()
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT
                        T.IDTURNO,
                        T.IDMEDICO, 
                        T.IDPACIENTE, 
                        T.FECHAHORA,
                        T.IDESTADO,
                        P.NOMBRE NOMBREP, 
                        P.APELLIDO APELLIDOP, 
                        P.IDOBRASOCIAL,
                        P.NROCARNET, 
                        M.APELLIDO, 
                        M.NOMBRE, 
                        M.MATRICULA,
						E.NOMBRE ESPECIAL
                        FROM TURNOS AS T
                        INNER JOIN PACIENTES AS  P ON P.IDPACIENTE = T.IDPACIENTE
                        INNER JOIN MEDICOS AS M ON M.IDMEDICO = T.IDMEDICO
                        INNER JOIN ESPECIALIDAD_X_MEDICO  AS EXM ON EXM.IDMEDICO = M.IDMEDICO
                        INNER JOIN ESPECIALIDADES  AS E ON E.IDESPECIALIDAD = EXM.IDESPECIALIDAD
                        WHERE  T.IDESTADO = 1");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    //Paciente pac = new Paciente();
                    Turno aux = new Turno(
                        (string)datos.Lector["NOMBRE"], 
                        (string)datos.Lector["APELLIDO"], 
                        (string)datos.Lector["NOMBREP"], 
                        (string)datos.Lector["APELLIDOP"],
                        (string)datos.Lector["ESPECIAL"]
                    );
                    aux.idTurnos = (long)datos.Lector["IDTURNO"];
                    aux.idPaciente = (long)datos.Lector["IDPACIENTE"];
                    aux.fechaHora = (DateTime)datos.Lector["FECHAHORA"];
                    aux.estado = (byte)datos.Lector["IDESTADO"];
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
        public void agregar(Turno nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"insert into TURNOS (FECHAHORA, IDMEDICO, IDPACIENTE, ESTADO)
                 VALUES(@fecha, @idMedico, @idPaciente, @Observ, @estado)");
                datos.setearParametro("@fecha", nuevo.fechaHora);
                datos.setearParametro("@idMedico", nuevo.medico.idMedico);
                datos.setearParametro("@idPaciente", nuevo.paciente.idPaciente);
                datos.setearParametro("@Observ", (nuevo.observaciones == null) ? nuevo.observaciones : "SIN OBSERVACION");
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
        public void modificar(Turno modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"update TURNOS 
                SET FECHAHORA= @fecha
                WHERE IDTURNO = @idTurno");
                datos.setearParametro("@idTurno", modificar.idTurnos);
                datos.setearParametro("@fecha", modificar.fechaHora);
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
        public void eliminar(long id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE TURNOS WHERE IDTURNO = @id");
                datos.setearParametro("@id", id);
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
        public void leerTurno(long id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from TURNOS where IDTURNO= @id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

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

