using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using StibkampTest.Wrappers;
using form.entities;
using form.Data;

namespace StibkampTest.Controllers
{
    internal class CustomerController
    {
        public IDataContextWrapper DataContext { get; set; } 
        public IEnumerable<StibContact> GetCustomersWithFirstName(string firstName)
        {
            var customers = from customer in DataContext.Table<StibContact>() where customer.Voornaam == firstName select customer; 
            return customers;
        }
    }
}
