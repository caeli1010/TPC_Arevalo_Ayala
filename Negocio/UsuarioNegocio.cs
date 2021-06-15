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
                datos.setearConsulta(@"SELECT
                                        A.Id,
                                        A.Codigo,
                                        A.Nombre,
                                        A.Descripcion,
                                        M.Descripcion AS Marca,
                                        C.Descripcion AS Categoria,
                                        A.ImagenUrl AS Imagen,
                                        A.Precio Precio,
                                        M.Id IdMarca,
                                        C.Id as IdCategoria
                                        FROM
                                        UsuarioS AS A
                                        INNER JOIN CATEGORIAS AS C ON C.Id = A.IdCategoria
                                        INNER JOIN MARCAS AS M ON M.Id = A.IdMarca");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    //Usuario aux = new Usuario();
                    //aux.Id = (int)datos.Lector["Id"];
                    //aux.Codigo = (string)datos.Lector["Codigo"];
                    //aux.Nombre = (string)datos.Lector["Nombre"];
                    //aux.Descripcion = (string)datos.Lector["Descripcion"];
                    //aux.marca = new Marca((int)datos.Lector["IdMarca"],(string)datos.Lector["Marca"]);
                    //aux.categoria = new Categoria((int)datos.Lector["IdCategoria"],(string)datos.Lector["Categoria"]);
                    //aux.UrlImagen = (string)datos.Lector["Imagen"];
                    //aux.Precio = (decimal)datos.Lector["Precio"];
                    //lista.Add(aux);

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
                //string valores = @"values('"+
                //                    nuevo.Codigo+"', '"+ 
                //                    nuevo.Nombre+"', '"+
                //                    nuevo.Descripcion+ "', " +
                //                    nuevo.marca.Id + ", " +
                //                    nuevo.categoria.Id + ", '" +
                //                    nuevo.UrlImagen+"', "+
                //                    nuevo.Precio+ ")";
                //datos.setearConsulta(@"insert into UsuarioS (
                //                        Codigo, 
                //                        Nombre,
                //                        Descripcion, 
                //                        IdMarca, 
                //                        IdCategoria, 
                //                        ImagenUrl, 
                //                        Precio
                //                        ) " + valores);
                //datos.ejecutarAccion();

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
                //datos.setearConsulta("update UsuarioS set Codigo = @codigo, Nombre = @nombre, Descripcion = @descripcion, ImagenUrl = @imagenUrl, IdMarca = @marca, IdCategoria = @categoria Where Id = @id");
                //datos.setearParametro("@codigo", modificar.Codigo);
                //datos.setearParametro("@nombre", modificar.Nombre);
                //datos.setearParametro("@descripcion", modificar.Descripcion);
                //datos.setearParametro("@imagenUrl", modificar.UrlImagen);
                //datos.setearParametro("@marca", modificar.marca.Id);
                //datos.setearParametro("@categoria", modificar.categoria.Id);
                //datos.setearParametro("@id", modificar.Id);

                //datos.ejecutarAccion();

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
        public void eliminar(int Id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from UsuarioS where Id = '" + Id + "'");
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
        public void leerUsuario(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from UsuarioS where id = " + id + "");
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
        public void guardarUsuario(Usuario Usuario)
        {

            //if (Usuario.Id==0) 
            //{
            //    this.agregar(Usuario);
            //}
            //else
            //{
            //    this.modificar(Usuario);
            //}
           
        }
       
    }
}
