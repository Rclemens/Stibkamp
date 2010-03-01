using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using form.entities;

namespace StibkampTest.Mocks
{
    class StibContactMockDatabase:MockDatabase
    {
        protected override void CreateTables()
        {
            AddTable<StibContact>();
        }

        protected override void PopulateTables()
        {
            var testCustomer1 = new StibContact { ID = Guid.NewGuid(), Voornaam = "Stuart", Achternaam = "Clemens", Kamptype = "Jongste Kamp", Vraag = "een vraag" };
            var testCustomer2 = new StibContact { ID = Guid.NewGuid(), Voornaam = "Raymond", Achternaam = "Clemens", Kamptype = "Oudste Kamp", Vraag = "een vraag" };
            
            GetTable<StibContact>().Add(testCustomer1); 
            GetTable<StibContact>().Add(testCustomer2);
        }
    }


}
