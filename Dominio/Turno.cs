using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    class Turno
    {
        public int idTurnos { get; set; }
        public DateTime fechaHora { get; set; }
        public Paciente paciente { get; set; }
        public Medico medico { get; set; }
        public string observaciones { get; set; }
        public int estado { get; set; }
    }
}
