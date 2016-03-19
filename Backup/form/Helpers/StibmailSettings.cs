using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Configuration;
using System.Xml.XPath;
using System.Xml.Serialization;
using System.Xml;

namespace form.Helpers
{
    [Serializable]
    public class StibmailSettings 
    {

        public StibmailSettings() 
        { 
        }
        private string m_Email = ""; // "" 

        public string Email 
        {
            get { return m_Email; }
            set { m_Email = value; } 
        } 
 

 
        

    }
}
