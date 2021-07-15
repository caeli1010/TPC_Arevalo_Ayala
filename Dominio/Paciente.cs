using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Paciente
    {
        public long idPaciente { get; set; }
        public string apellido { get; set; }
        public string nombre { get; set; }
        public Obrasocial obraSocial { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string genero { get; set; }
        public string dni { get; set; }
        public string mail { get; set; }
        public int nroCarnet { get; set; }

        public Paciente() { }

        public Paciente(string _nombre, string _apellido)
        {
            apellido = _apellido;
            nombre = _nombre;
        }
        public Paciente(long id)
        {
            idPaciente = id;
        }

        public override string ToString()
        {
            string datoPaciente = nombre + apellido;
            return datoPaciente;
        }
    }
}
