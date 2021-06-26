using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Obrasocial
    {
        public int idObraSocial { get; set; }
        public string nombre { get; set; }
        public Obrasocial(){}
        public Obrasocial(string _nombre) {
            nombre = _nombre;
        }
        public Obrasocial(int _idObraSocial)
        {
            idObraSocial = _idObraSocial;
        }

        public Obrasocial(int _idObraSocial, string _nombre) {
            nombre = _nombre;
            idObraSocial = _idObraSocial;
        }
        public override string ToString()
        {
            string _nombre = nombre;
            return _nombre;
        }
    }
}
