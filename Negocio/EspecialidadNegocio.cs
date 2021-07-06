﻿using System;
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
                datos.setearConsulta(@"SELECT IDESPECIALIDAD, NOMBRE, ESTADO FROM ESPECIALIDADES WHERE ESTADO = 1");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.idEspecialidad = (long)datos.Lector["IDESPECIALIDAD"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.estado = (Boolean)datos.Lector["ESTADO"];
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
                string valores = @"values(6 , " + medico.idMedico + " , " + nuevo.idEspecialidad + ", 5)";
                datos.setearConsulta(@"insert into ESPECIALIDAD_X_MEDICO (ID, IDMEDICO, IDESPECIALIDAD, IDCONVENIO) " + valores);
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
                datos.setearConsulta("update ESPECIALIDADES set ESTADO = 0 from WHERE DNI = @id");
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

        public List<Especialidad> leerEspecialidad(long id)
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT * FROM ESPECIALIDADES ES
                                     INNER JOIN ESPECIALIDAD_X_MEDICO EM ON EM.IDESPECIALIDAD = ES.IDESPECIALIDAD
                                     INNER JOIN MEDICOS ME ON ME.IDMEDICO = EM.IDMEDICO 
                                     WHERE ME.IDMEDICO = id");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.idEspecialidad = (long)datos.Lector["IDESPECIALIDAD"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.estado = (Boolean)datos.Lector["ESTADO"];
                    lista.Add(aux);

                }
                return lista;

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
