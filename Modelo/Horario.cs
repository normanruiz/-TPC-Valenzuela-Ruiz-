using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Horario
    {

        public int Id { get; set; }
        public string Dia { get; set; }
        public int HoraInicio { get; set; }
        public int HoraFin { get; set; }

        public string Turno
        {
            get 
            {
                return Dia + " " + HoraInicio + " - " + HoraFin;
            }
        }
    
    }
}
