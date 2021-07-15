using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Turno
    {
        public long idTurnos { get; set; }
        public DateTime fechaHora { get; set; }
        public Paciente paciente { get; set; }
        public Medico medico { get; set; }

        public string nombre_p { get; set; }
        public string apellido_p { get; set; }

        public string nombre_m { get; set; }
        public string apellido_m { get; set; }

        public string especialidad { get; set; }
        public string observaciones { get; set; }
        public int estado { get; set; }
        public Turno() { }
        public Turno( string _nombreM, string _apellidoM, string _nombreP, string _apellidoP, string _espec) {
            nombre_p = _nombreP;
            apellido_p = _apellidoP;
            nombre_m = _nombreM;
            apellido_m = _apellidoM;
            especialidad = _espec;
        }
    }
}
