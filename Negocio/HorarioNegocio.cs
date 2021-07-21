﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class HorarioNegocio
    {
        public List<Horario> listar()
        {
            List<Horario> lista = new List<Horario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT * FROM DIAS_Y_HORARIOS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Horario aux = new Horario();
                    aux.id = (int)datos.Lector["ID"];
                    aux.duracion = (byte)datos.Lector["DURACION"];
                    aux.medico = new Medico((long)datos.Lector["IDMEDICO"]);
                    aux.hora = (short)datos.Lector["HORAS"];
                    aux.idDias = (int)datos.Lector["IDDIAS"];
                    aux.horaEntrada = (byte)datos.Lector["HORAINICIO"];
                    aux.especXMed = (int)datos.Lector["IDESP_X_MED"];

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
        public void agregar(Horario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearParametro("@duracion", nuevo.duracion);
                datos.setearParametro("@idMedico", nuevo.medico.idMedico);
                datos.setearParametro("@horas", nuevo.hora);
                datos.setearParametro("@idDias", nuevo.idDias);
                datos.setearParametro("@horarioInicio", nuevo.horaEntrada);
                datos.setearParametro("@idEspXMed", nuevo.especXMed);
                datos.setearParametro("@estado", 1);
                datos.setearConsulta(@"insert into DIAS_Y_HORARIOS (DURACION, IDMEDICO, HORAS, IDDIAS,
                                        HORARIOINICIO, IDESP_X_MED, ESTADO) 
                                        VALUES(@duracion, @idMedico, @horas, @idDias, @horarioInicio, 
                                        @idEspXMed, @estado)");
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
        public void modificar(Horario modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"update DIAS_Y_HORARIOS set DURACION = @duracion,
                                     IDMEDICO = @idMedico, HORAS = @hora, IDDIAS= @idDias, 
                                      HORAINICIO = @horarioEntrada WHERE ID = @id");
                datos.setearParametro("@duracion", modificar.duracion);
                datos.setearParametro("@idMedico", modificar.medico.idMedico);
                datos.setearParametro("@hora", modificar.hora);
                datos.setearParametro("@idDias", modificar.idDias);
                datos.setearParametro("@horarioEntrada", modificar.horaEntrada);
                datos.setearParametro("@id", modificar.id);


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
        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearParametro("@id", id);
                datos.setearConsulta(@"UPDATE DIAS_Y_HORARIOS SET ESTADO = 0 WHERE ID = @id");

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

        public List<Horario> leerHorario(long id)
        {
            List<Horario> lista = new List<Horario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearParametro("@id", id);
                datos.setearConsulta(@"SELECT * FROM DIAS_Y_HORARIOS WHERE IDMEDICO = @id");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Horario aux = new Horario();
                    aux.id= (int)datos.Lector["ID"];
                    aux.idDias = (byte)datos.Lector["IDDIAS"];
                    aux.horaEntrada = (byte)datos.Lector["HORAINICIO"];
                    aux.hora = (short)datos.Lector["HORAS"];
                    lista.Add(aux);

                }
                return lista;
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
