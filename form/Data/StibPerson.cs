using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace form.Data
{
    [Serializable()]
    public class StibPerson
    {
        public StibPerson()
        {
        }

        public String Kamptype { get; set; }
        public String VoorNaam { get; set; }
        public String Achternaam { get; set; }
        public String TussenVoegsel { get; set; }
        public String Roepnaam { get; set; }
        public String Geboortedatum { get; set; }
        public int Geslacht { get; set; }
        public String Email { get; set; }
        public String Adres { get; set; }
        public String Postcode { get; set; }
        public String Plaats { get; set; }
        public String Telefoonnr { get; set; }
        public String Mobielnr { get; set; }
        public String NaamOuders { get; set; }
        public String AdresOuders { get; set; }
        public String AdresOuders2 { get; set; }
        public String ExtraTel1 { get; set; }
        public String ExtraTel2 { get; set; }
        public String NaamHuisarts{ get; set; }
        public String AdresHuisarts{ get; set; }
        public String PlaatsHuisarts { get; set; }
        public String TelnrHuisarts { get; set; }
        public String NaamZiektekosten{ get; set; }
        public String InschrijfnrZiektekosten{ get; set; }
        public String WaVerzek{ get; set; }
        public String WaVerzekerInschrijfnr{ get; set; }
        public int AnderVakanties { get; set; }
        public int HeeftZiektes { get; set; }
        public String Ziektes { get; set; }
        public String ZiektesMedicijnen { get; set; }
        public int PlastInBed { get; set; }
        public String PlastInBedInfo{ get; set; }
        public int Vactinaties { get; set; }
        public int Zwemdiploma { get; set; }
        public String ZwemdiplomaInfo{ get; set; }
        public String ExtraDiploma{ get; set; }
        public int AllesEten { get; set; }
        public String AllesEtenInfo{ get; set; }
        public String StibGevonden{ get; set; }
        public String StibGevondenAnders{ get; set; }


    }
}
