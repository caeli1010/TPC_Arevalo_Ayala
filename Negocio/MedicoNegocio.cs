using System;
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
                datos.setearConsulta(@"SELECT IDMEDICO, APELLIDO, NOMBRE, SEXO, FECHANAC, FECHAINGRESO, EMAIL, DNI FROM MEDICOS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.idMedico = (int)datos.Lector["IDMEDICO"];
                    aux.apellido = (string)datos.Lector["APELLIDO"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.genero = (string)datos.Lector["SEXO"];
                    aux.fechaNac = (DateTime)datos.Lector["FECHANAC"];
                    aux.fechaIngreso = (DateTime)datos.Lector["FECHAINGRESO"];
                    aux.mail = (string)datos.Lector["EMAIL"];
                    aux.dni = (string)datos.Lector["DNI"];
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
                string valores = @"values('" +
                                    nuevo.idMedico + "', '" +
                                    nuevo.nombre + "', '" +
                                    nuevo.apellido + "', " +
                                    nuevo.genero + ", " +
                                    nuevo.fechaNac + ", '" +
                                    nuevo.fechaIngreso + "', " +
                                    nuevo.mail + "', " +
                                    nuevo.dni + ")";
                datos.setearConsulta(@"insert into MEDICOS (
                                        IDMEDICO, 
                                        NOMBRE,
                                        APELLIDO, 
                                        SEXO, 
                                        FECHANAC, 
                                        FECHAINGRESO, 
                                        MAIL,
                                        DNI
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
        public void modificar(Medico modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update MEDICOS set NOMBRE = @nombre, EMAIL= @email");
                datos.setearParametro("@nombre", modificar.nombre);
                datos.setearParametro("@email", modificar.mail);


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
        //public void eliminar(Medico Medico)
        //{
        //    AccesoDatos datos = new AccesoDatos();
        //    try
        //    {
        //        datos.setearConsulta("update MEDICOS set ESTADO = 0 WHERE DNI = @dni");
        //        datos.setearParametro("@dni", Medico.dni);

        //        datos.ejecutarAccion();

        //    }
        //    catch (global::System.Exception)
        //    {
        //        throw;
        //    }

        //    finally
        //    {
        //        datos.cerrarConexion();
        //        datos = null;
        //    }

        //}
        public void leerMedico(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from MEDICOS where DNI = " + dni + "");
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
