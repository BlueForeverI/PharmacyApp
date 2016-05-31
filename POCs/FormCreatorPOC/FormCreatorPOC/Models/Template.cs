using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormCreatorPOC.Models
{
    [Serializable]
    public class Template
    {
        public string Name { get; set; }

        public List<TemplateControl> Controls { get; set; } 
    }
}
