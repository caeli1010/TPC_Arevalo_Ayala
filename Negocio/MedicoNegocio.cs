﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class MedicoNegocio
    {
        public List<Medico>listar()
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT IDMEDICO, APELLIDO, NOMBRE, SEXO, 
                                       FECHANAC, FECHAINGRESO, COALESCE(EMAIL, 'Sin email') AS CORREO,
                                       MATRICULA, DNI, ESTADO FROM MEDICOS WHERE ESTADO=1");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.idMedico = (long)datos.Lector["IDMEDICO"];
                    aux.apellido = (string)datos.Lector["APELLIDO"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.genero = (string)(datos.Lector["SEXO"]);
                    aux.fechaNac = (DateTime)datos.Lector["FECHANAC"];
                    aux.fechaIngreso = (DateTime)datos.Lector["FECHAINGRESO"];
                    aux.mail = (string)datos.Lector["CORREO"];
                    aux.dni = (string)datos.Lector["DNI"];
                    aux.matricula = (int)datos.Lector["MATRICULA"];
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
        public void agregar(Medico nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearParametro("@nombre", nuevo.nombre);
                datos.setearParametro("@apellido", nuevo.apellido);
                datos.setearParametro("@sexo", nuevo.genero);
                datos.setearParametro("@fechaNac", nuevo.fechaNac);
                datos.setearParametro("@fechaIngreso", nuevo.fechaIngreso);
                datos.setearParametro("@email", nuevo.mail);
                datos.setearParametro("@dni", nuevo.dni);
                datos.setearParametro("@estado", 1);
                datos.setearConsulta(@"insert into MEDICOS (NOMBRE, APELLIDO, SEXO, FECHANAC, 
                                        FECHAINGRESO, EMAIL, DNI, ESTADO) 
                                        VALUES(@nombre, @apellido, @sexo, @fechaNac, @fechaIngreso, 
                                        @email, @dni, @estado )");
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
        public void modificar(Medico modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update MEDICOS set NOMBRE = @nombre, EMAIL= @email where IDMEDICO = @id");
                datos.setearParametro("@nombre", modificar.nombre);
                datos.setearParametro("@email", modificar.mail);
                datos.setearParametro("@id", modificar.idMedico);


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
        public void eliminar(Medico Medico)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from MEDICOS WHERE DNI = @dni");
                datos.setearParametro("@dni", Medico.dni);

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
        public void leerMedico(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearParametro("@dni", dni);
                datos.setearConsulta("select * from MEDICOS where DNI = @dni");
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
