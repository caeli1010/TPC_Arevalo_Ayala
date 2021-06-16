using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    class Especialidad
    {
        public int idEspecialidad { get; set; }
        public string nombre { get; set; }
        public override string ToString()
        {
            return nombre;
        }
    }
}
