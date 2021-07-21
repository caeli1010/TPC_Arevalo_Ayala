using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Horario
    {
        public int id { get; set; }
        public int idDias { get; set; }
        public Medico medico { get; set; }
        public short hora { get; set; }
        public byte horaEntrada { get; set; }
        public int especXMed { get; set; }
        public byte duracion { get; set; }
        public Horario() { }
        public Horario(int idHorario)
        {
            id = idHorario;
        }
        //public Horario(long _id, int _idDias, int _hora, int _duracion)
        //{
        //    id = _id;
        //    idDias = _idDias;
        //    hora = _hora;
        //    duracion = _duracion;
        //}

        public override string ToString()
        {
            return medico.nombre;
        }

    }
}
