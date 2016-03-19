using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using form.entities;
using form.Helpers;

namespace form.Data
{
    public class StibContactManager
    {

        private StibContactDataContext stibContactDataContext;

        public StibContactManager()
        {
            stibContactDataContext = new StibContactDataContext();
        }

        public StibContactManager(StibContactDataContext dataContext)
        {
            stibContactDataContext = dataContext;
        }

        public Boolean SaveContact(StibContact stibContact)
        {
            StibContactDataContext db = new StibContactDataContext();
            stibContact.ID = Guid.NewGuid();
            
            if (!IsValidStibContact(stibContact))
                throw new InvalidContactInfoException("Er is niet voldoende informatie om de contactinfo op te slaan.");


            db.StibContacts.InsertOnSubmit(stibContact);
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }

        private bool IsValidStibContact(StibContact stibContact)
        {
            bool isValid = true;

            if(stibContact.Achternaam.Length==0)
                isValid = false;

            if(stibContact.Voornaam.Length==0)
                isValid = false;

            if(stibContact.Vraag.Length==0)
                isValid = false;

            if(stibContact.ID==Guid.Empty)
                isValid = false;

            return isValid;
        }
    }
}
