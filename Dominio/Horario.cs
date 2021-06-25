using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Horario
    {
        public int idDias { get; set; }
        public Medico medico{ get; set; }
        public int hora { get; set; }
        public int duración { get; set; }
    }
}
