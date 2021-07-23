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
                datos.setearParametro("idRol", nuevo.idRol);
                datos.setearParametro("@userName", nuevo.username);
                datos.setearParametro("@passWord", nuevo.password);
                datos.setearParametro("@passWord", nuevo.password);
                datos.setearParametro("@estado", 1);
                datos.setearConsulta(@"insert into USUARIOS (IDROL, USERNAME, PASSWORD, ESTADO, DNI, IDTIPODOC, IMAGEN)
                Values(@idRol, @userName, @passWord, @estado, @dni, NULL, NULL)");
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
        public Usuario leerUsuario(string user, string pass)
        {
            Usuario usuario = new Usuario();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearParametro("@usuario", user);
                datos.setearParametro("@password", pass);
                datos.setearConsulta("select * from USUARIOS where USERNAME = @usuario AND PASSWORD=@password");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.idRol = (int)datos.Lector["IDROL"];
                    usuario.idUsuario = (int)datos.Lector["IDUSUARIO"];
                    usuario.dni = (string)datos.Lector["DNI"];
                    usuario.username = (string)datos.Lector["USERNAME"];
                    usuario.password = (string)datos.Lector["PASSWORD"];
                    usuario.estado = (bool)datos.Lector["ESTADO"];
                    usuario.idTipoDocumento = (byte)datos.Lector["IDTIPODOC"];
                    usuario.imagen = (string)datos.Lector["IMAGEN"];
                }
                return usuario;

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
