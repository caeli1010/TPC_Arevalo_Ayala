using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    class Medico
    {
        public int idMedico { get; set; }
        public string apellido { get; set; }
        public string nombre { get; set; }
        public string genero { get; set; }
        public DateTime fechaIngreso { get; set; }
        public string mail { get; set; }

        public override string ToString()
        {
            string datoMedico = nombre + apellido;
            return datoMedico;
        }
    }
}
