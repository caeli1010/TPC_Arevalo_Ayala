using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Dominio
{
    public class Usuario
    {
        public int idUsuario { get; set; }
        public int idRol { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public int  estado { get; set; }
        public string dni { get; set; }
        public int idTipoDocumento { get; set; }
        public string imagen { get; set; }
        public override string ToString()
        {
            return dni;
        }
    }
}
