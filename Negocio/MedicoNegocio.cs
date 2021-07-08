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
                string valores = @"values('" +
                                    nuevo.nombre + "', '" +
                                    nuevo.apellido + "', '" +
                                    nuevo.genero + "', '" +
                                    nuevo.fechaNac + "', '" +
                                    nuevo.fechaIngreso + "', '" +
                                    nuevo.mail + "', '" +
                                    nuevo.dni + "', "+ 1 +")";
                datos.setearConsulta(@"insert into MEDICOS (
                                        NOMBRE,
                                        APELLIDO, 
                                        SEXO, 
                                        FECHANAC, 
                                        FECHAINGRESO, 
                                        EMAIL,
                                        DNI,
                                        ESTADO
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
