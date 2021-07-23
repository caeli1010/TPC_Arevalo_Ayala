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
                                        T.IDESP_X_MED,
                                        T.FECHAHORA,
                                        T.IDESTADO,
                                        P.NOMBRE NOMBREP, 
                                        P.APELLIDO APELLIDOP, 
                                        P.IDOBRASOCIAL,
                                        P.NROCARNET, 
                                        (SELECT  ME.APELLIDO FROM MEDICOS ME WHERE  ME.IDMEDICO = T.IDMEDICO
                                        ) as APELLIDO, 
                                        (SELECT  ME.NOMBRE FROM MEDICOS ME WHERE  ME.IDMEDICO = T.IDMEDICO
                                        ) as NOMBRE, 
                                        (SELECT  ME.MATRICULA FROM MEDICOS ME WHERE  ME.IDMEDICO = T.IDMEDICO
                                        ) as MATRICULA, 
                                        (SELECT  E.NOMBRE FROM ESPECIALIDADES E WHERE E.IDESPECIALIDAD =  EXM.IDESPECIALIDAD 
                                        ) AS ESPECIAL,
                                        T.IDESTADO
                                        FROM TURNOS AS T
                                        INNER JOIN PACIENTES AS  P ON P.IDPACIENTE = T.IDPACIENTE
                                        INNER JOIN ESPECIALIDAD_X_MEDICO EXM ON EXM.ID= T.IDESP_X_MED
                                        WHERE  T.IDESTADO = 1 AND T.FECHAHORA >= GETDATE() ORDER BY T.FECHAHORA ASC ");
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
                    aux.idEsp_X_Med = (int)datos.Lector["IDESP_X_MED"];
                    aux.fechaHora = (DateTime)datos.Lector["FECHAHORA"];
                    aux.estado = (byte)datos.Lector["IDESTADO"];
                    lista.Add(aux);

                }
                return lista;
            }
            catch (Exception EX)
            {
                throw EX;
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
                datos.setearConsulta(@"insert into TURNOS (FECHAHORA, IDMEDICO, IDPACIENTE, IDESP_X_MED, IDESTADO)
                 VALUES(@fecha, @idMedico, @idPaciente, @idEsp_X_Med, @estado)");
                datos.setearParametro("@fecha", nuevo.fechaHora);
                datos.setearParametro("@idMedico", nuevo.medico.idMedico);
                datos.setearParametro("@idPaciente", nuevo.idPaciente);
                datos.setearParametro("@idEsp_X_Med", nuevo.idEsp_X_Med);
                datos.setearParametro("@estado", 1);
                //datos.setearParametro("@Observ", (nuevo.observaciones == null) ? nuevo.observaciones : "SIN OBSERVACION");

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
                datos.setearConsulta("select * from TURNOS where IDTURNO= @id AND IDESTADO=1");
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
        public int especialidadXMedico(Medico idM, long idE)
        {
            List<Turno> idEsp_x_medi = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearParametro("@idMedico", idM.idMedico);
                datos.setearParametro("@idEspecialidad", idE);
                datos.setearConsulta(@"SELECT ID FROM ESPECIALIDAD_X_MEDICO WHERE IDMEDICO = @idMedico AND 
                                        IDESPECIALIDAD = @idEspecialidad AND ESTADO = 1");
                datos.ejecutarLectura();
                Turno aux = new Turno();
                aux.idEsp_X_Med= (int)datos.Lector["ID"];
                return aux.idEsp_X_Med;
                //idEsp_x_medi.Add(aux);
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

