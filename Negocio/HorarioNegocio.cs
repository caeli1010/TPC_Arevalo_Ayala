using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class HorarioNegocio
    {
        public List<Horario> listar()
        {
            List<Horario> lista = new List<Horario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"SELECT * FROM DIAS_Y_HORARIOS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Horario aux = new Horario();
                    aux.id = (long)datos.Lector["ID"];
                    aux.duracion = (int)datos.Lector["DURACION"];
                    aux.medico = new Medico((long)datos.Lector["IDMEDICO"]);
                    aux.hora = (int)datos.Lector["HORAS"];
                    aux.idDias = (int)datos.Lector["IDDIAS"];

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
        public void agregar(Horario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = @"values(" +
                                    nuevo.duracion + ", " +
                                    nuevo.medico.idMedico + ", " +
                                    nuevo.hora + ", " +
                                    nuevo.idDias + ", " +
                                    1 +")";
                datos.setearConsulta(@"insert into DIAS_Y_HORARIOS (
                                        DURACION,
                                        IDMEDICO, 
                                        HORAS, 
                                        IDDIAS,
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
        public void modificar(Horario modificar)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update DIAS_Y_HORARIOS set " +
                                            "DURACION = @duracion, " +
                                            "IDMEDICO = @idMedico, " +
                                            "HORAS = @hora, " +
                                            "IDDIAS= @idDias");
                datos.setearParametro("@duracion", modificar.duracion);
                datos.setearParametro("@idMedico", modificar.medico.idMedico);
                datos.setearParametro("@hora", modificar.hora);
                datos.setearParametro("@idDias", modificar.idDias);


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
        
        public void leerHorario(int idMedico)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from DIAS_Y_HORARIOS where IDMEDICO = idMedico  ");
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
