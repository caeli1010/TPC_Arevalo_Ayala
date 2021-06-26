using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ObrasocialNegocio
    {
        public List<Obrasocial> listar()
        {
            List<Obrasocial> lista = new List<Obrasocial>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT * FROM OBRAS_SOCIALES");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Obrasocial aux = new Obrasocial();
                    aux.idObraSocial = (int)datos.Lector["IDObrasocial"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
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
        public void agregar(Obrasocial nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = @"values('" + nuevo.nombre + ")";
                datos.setearConsulta(@"insert into OBRAS_SOCIALES ( NOMBRE ) " + valores);
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
        public void modificar(Obrasocial modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update OBRAS_SOCIALES set NOMBRE = @nombre where IDOBRASOCIAL = "+ modificar.idObraSocial+ " ");
                datos.setearParametro("@nombre", modificar.nombre);
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
        //public void eliminar(Obrasocial Obrasocial)
        //{
        //    AccesoDatos datos = new AccesoDatos();
        //    try
        //    {
        //        datos.setearConsulta("update OBRAS_SOCIALES set ESTADO = 0 WHERE DNI = @dni");
        //        datos.setearParametro("@dni", Obrasocial.dni);

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
        public void leerObrasocial(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from OBRAS_SOCIALES where IDOBRASOCIAL = " + id + "");
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
