using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace form.Data
{
    [Serializable()]
    public class StibContactInfo
    {
        public StibContactInfo()
        {
        }

        public String Kamptype { get; set; }
        public String VoorNaam { get; set; }
        public String Achternaam { get; set; }
        public String TussenVoegsel { get; set; }
        public String Vraag { get; set; }


    }
}
