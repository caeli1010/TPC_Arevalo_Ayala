using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;


namespace Negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT * FROM USUARIOS"); 
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.idRol = (int)datos.Lector["IDROL"];
                    aux.idUsuario = (int)datos.Lector["IDUSUARIO"];
                    aux.dni = (string)datos.Lector["DNI"];
                    aux.username = (string)datos.Lector["USERNAME"];
                    aux.password = (string)datos.Lector["PASSWORD"];
                    aux.estado = (bool)datos.Lector["ESTADO"];
                    aux.idTipoDocumento = (byte)datos.Lector["IDTIPODOC"];
                    aux.imagen = (string)datos.Lector["IMAGEN"];
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
        public void agregar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = @"values('" +
                                    nuevo.idRol + "', '" +
                                    nuevo.username + "', '" +
                                    nuevo.password + "', " +
                                    nuevo.estado + ", " +
                                    nuevo.dni + ", '" +
                                    nuevo.idTipoDocumento + "', " +
                                    nuevo.imagen + ")";
                datos.setearConsulta(@"insert into USUARIOS (
                                        IDROL, 
                                        USERNAME,
                                        PASSWORD, 
                                        ESTADO, 
                                        DNI, 
                                        IDTIPODOC, 
                                        IMAGEN
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
        public void modificar(Usuario modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update USUARIOS set PASSWORD = @password, IMAGEN= @imagen");
                datos.setearParametro("@password", modificar.password);
                datos.setearParametro("@imagen", modificar.imagen);
                

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
        public void eliminar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update USUARIOS set ESTADO = 0 WHERE DNI = @dni");
                datos.setearParametro("@dni", usuario.dni);
               
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
        public void leerUsuario(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from USUARIOS where DNI = " + dni + "");
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
