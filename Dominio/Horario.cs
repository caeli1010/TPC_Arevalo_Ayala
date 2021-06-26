using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Horario
    {
        public long id { get; set; }
        public int idDias { get; set; }
        public long idMedico{ get; set; }
        public int hora { get; set; }
        public int duracion { get; set; }
        public Horario(){ }
        public Horario(long _id, int _idDias, long _idMedico, int _hora, int _duracion)
        {
            id = _id;
            idDias = _idDias;
            idMedico = _idMedico;
            hora = _hora;
            duracion = _duracion;
        }
    }
}
