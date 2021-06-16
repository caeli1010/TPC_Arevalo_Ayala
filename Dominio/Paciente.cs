using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    class Paciente
    {
        public int idPaciente{ get; set; }
        public string apellido { get; set; }
        public string nombre { get; set; }
        public int idObraSocial { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string genero { get; set; }
        public Usuario dni { get; }
        public string mail { get; set; }
        
        public override string ToString()
        {
            string datoPaciente = nombre + apellido;
            return datoPaciente;
        }
    }
}
