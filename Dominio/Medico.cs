using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Medico
    {
        public long idMedico { get; set; }
        public int matricula { get; set; }
        public string apellido { get; set; }
        public string nombre { get; set; }
        public string genero { get; set; }
        public DateTime fechaNac { get; set; }
        public DateTime fechaIngreso { get; set; }
        public string mail { get; set; }
        public string dni { get; set; }
        public Especialidad especialidad { get; set; }
        public Boolean estado { get; set; }
        public override string ToString()
        {
            string datoMedico = dni;
            return datoMedico;
        }
    }
}
