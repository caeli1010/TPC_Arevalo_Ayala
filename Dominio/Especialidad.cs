using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Especialidad
    {
        public int idEspecialidad { get; set; }
        public string nombre { get; set; }
        public int convenio { get; set; }
        public Especialidad()
        {

        }
        public Especialidad(int id, string _nombre)
        {
            idEspecialidad = id;
            nombre = _nombre;
        }
        public override string ToString()
        {
            return nombre;
        }
    }
}
