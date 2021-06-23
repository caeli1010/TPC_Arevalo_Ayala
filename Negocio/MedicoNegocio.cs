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
                datos.setearConsulta(@"SELECT M.IDMEDICO, M.APELLIDO, M.NOMBRE, M.SEXO, M.FECHANAC, M.FECHAINGRESO,
                                        COALESCE(EMAIL, 'Sin email') AS CORREO, M.DNI, E.NOMBRE AS ESPEC FROM MEDICOS M 
                                        INNER JOIN ESPECIALIDAD_X_MEDICO EM ON EM.IDMEDICO=M.IDMEDICO 
                                        INNER JOIN ESPECIALIDADES E ON E.IDESPECIALIDAD=EM.IDESPECIALIDAD");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.idMedico = (long)datos.Lector["IDMEDICO"];
                    aux.apellido = (string)datos.Lector["APELLIDO"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.genero = (string)datos.Lector["SEXO"];
                    aux.fechaNac = (DateTime)datos.Lector["FECHANAC"];
                    aux.fechaIngreso = (DateTime)datos.Lector["FECHAINGRESO"];
                    aux.mail = (string)datos.Lector["CORREO"];
                    aux.dni = (string)datos.Lector["DNI"];
                    aux.especialidad = (string)datos.Lector["ESPEC"];
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
