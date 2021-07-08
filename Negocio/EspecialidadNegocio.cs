using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
<<<<<<< Updated upstream
    public class EspecialidadNegocio
=======
    class EspecialidadNegocio
>>>>>>> Stashed changes
    {
        public List<Especialidad> listar()
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
<<<<<<< Updated upstream
                datos.setearConsulta(@"SELECT IDESPECIALIDAD, NOMBRE, ESTADO FROM ESPECIALIDADES WHERE ESTADO = 1");
=======
                datos.setearConsulta(@"SELECT IDESPECIALIDAD, NOMBRE, SEXO,  IDOBRASOCIAL, FECHANAC, NOMBRE, COALESCE(EMAIL, 'sin correo') as EMAIL,  COALESCE(DNI, 'sin dni') as DNI FROM EspecialidadS");
>>>>>>> Stashed changes
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
<<<<<<< Updated upstream
                    aux.idEspecialidad = (long)datos.Lector["IDESPECIALIDAD"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.estado = (Boolean)datos.Lector["ESTADO"];
=======
                    aux.idEspecialidad = (int)datos.Lector["IDESPECIALIDAD"];
                    aux.apellido = (string)datos.Lector["APELLIDO"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    aux.genero = (string)datos.Lector["SEXO"];
                    aux.fechaNacimiento = (DateTime)datos.Lector["FECHANAC"];
                    aux.mail = (string)datos.Lector["EMAIL"];
                    aux.dni = (string)datos.Lector["DNI"];
                    aux.idObraSocial = (int)datos.Lector["IDOBRASOCIAL"];
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                //string valores = @"values('" + nuevo.nombre + "')";
                datos.setearConsulta(@"update ESPECIALIDADES set ESTADO=1 WHERE NOMBRE LIKE '" +nuevo.nombre+"' ");
=======
                string valores = @"values('" +
                                    nuevo.nombre + "', '" +
                                    nuevo.apellido + "', " +
                                    nuevo.genero + ", " +
                                    nuevo.fechaNacimiento + ", '" +
                                    nuevo.idObraSocial + ", '" +
                                    nuevo.mail + "', " +
                                    nuevo.dni + ")";
                datos.setearConsulta(@"insert into EspecialidadS (
                                        NOMBRE,
                                        APELLIDO, 
                                        SEXO, 
                                        FECHANAC, 
                                        IDOBRASOCIAL, 
                                        MAIL,
                                        DNI
                                        ) " + valores);
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        public void agregarXMedico(Especialidad nuevo, Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = @"values( " + medico.idMedico + " , " + nuevo.idEspecialidad + ", 5, 1)";
                datos.setearConsulta(@"insert into ESPECIALIDAD_X_MEDICO (IDMEDICO, IDESPECIALIDAD, IDCONVENIO, ESTADO) " + valores);
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
=======
>>>>>>> Stashed changes
        public void modificar(Especialidad modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
<<<<<<< Updated upstream
                datos.setearConsulta("update EspecialidadS set NOMBRE = @nombre where IDESPECIALIDAD =@id");
                datos.setearParametro("@nombre", modificar.nombre);
                datos.setearParametro("@id", modificar.idEspecialidad);
                datos.ejecutarAccion();
                
=======
                datos.setearConsulta("update EspecialidadS set " +
                                                        "NOMBRE = @nombre, " +
                                                        "APELLIDO = @apellido, " +
                                                        "IDOBRASICIAL=@idObraSocial, " +
                                                        "EMAIL= @email");
                datos.setearParametro("@nombre", modificar.nombre);
                datos.setearParametro("@apellido", modificar.apellido);
                datos.setearParametro("@idObraSocial", modificar.idObraSocial);
                datos.setearParametro("@email", modificar.mail);
                datos.ejecutarAccion();

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
                                     WHERE ME.IDMEDICO = "+ id +" ");
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
=======
        //public void eliminar(Especialidad Especialidad)
        //{
        //    AccesoDatos datos = new AccesoDatos();
        //    try
        //    {
        //        datos.setearConsulta("update EspecialidadS set ESTADO = 0 WHERE DNI = @dni");
        //        datos.setearParametro("@dni", Especialidad.dni);

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
        public void leerEspecialidad(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from EspecialidadS where DNI = " + dni + "");
                datos.ejecutarLectura();
>>>>>>> Stashed changes

            }
            catch (global::System.Exception)
            {
                throw;
            }

            finally
            {
                datos.cerrarConexion();
            }
<<<<<<< Updated upstream

        }
    }
=======
    }   }
>>>>>>> Stashed changes
}
