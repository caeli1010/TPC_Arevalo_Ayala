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

    }
}
