﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Perfil
    {
        public int Id { get; set; }
        public String Tipo { get; set; }

        public override string ToString()
        {
            return Tipo;
        }

    }
}
