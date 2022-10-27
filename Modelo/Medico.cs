using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Medico : Persona
    {
        public int Id { get; set; }
        public Especialidad especialidad { get; set; }


    }
}
