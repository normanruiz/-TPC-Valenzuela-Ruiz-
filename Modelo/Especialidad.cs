using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Especialidad
    {
        public int Id { get; set; }
        public String Nombre { get; set; }
        public List<Medico> ListaMedico { get; set; }

    }
}
