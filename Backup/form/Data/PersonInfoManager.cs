using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using form.entities;
using System.Xml.Linq;
using System.Xml;
using System.Reflection;

namespace form.Data
{
    public class PersonInfoManager
    {
        private PersonsDataContext dataContext = new PersonsDataContext();

        #region Person filtering

        public PersonInfo GetPersonById(Guid Id)
        {
            PersonInfo person = new PersonInfo();
            person = (from p in dataContext.PersonInfos
                      where p.ID == Id
                      select p).Single();

            return person;
        }


        public List<PersonInfo> GetEveybody()
        {
            List<PersonInfo> persons = new List<PersonInfo>();

            persons = (from p in dataContext.PersonInfos
                       select p).ToList<PersonInfo>();

            return persons;
        }
        #endregion

        #region Saving data

        public Boolean SaveFormRegistration(StibPerson stibInfo)
        {
            return SaveFormRegistration(ConvertStibPersonToPersonInfo(stibInfo));
        }

        public Boolean SaveFormRegistration(PersonInfo personInfo)
        {
            PersonsDataContext db = new PersonsDataContext();
            personInfo.CreateDate = DateTime.Now;
            personInfo.ChangedDate = DateTime.Now;

            db.PersonInfos.InsertOnSubmit(personInfo);
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

        private PersonInfo ConvertStibPersonToPersonInfo(StibPerson stibPerson)
        {
            PersonInfo person = new PersonInfo();

            person.ID = Guid.NewGuid();
            person.Firstname = stibPerson.VoorNaam;
            person.Lastname = String.Concat(stibPerson.TussenVoegsel, " ", stibPerson.Achternaam);
            person.xmldoc = CreateXML(stibPerson);

            return person;
        }

        private XElement CreateXML<T>(T _object)
        {
            XmlDocument xmldoc = new XmlDocument();
            XmlNode xmlnode;
            XmlElement xmlelem;
            XmlText xmltext;

            xmlnode = xmldoc.CreateNode(XmlNodeType.XmlDeclaration, "", "");
            xmldoc.AppendChild(xmlnode);

            xmlelem = xmldoc.CreateElement("", _object.GetType().Name, "");
            xmldoc.AppendChild(xmlelem);
            //let's add another element (child of the root)

            PropertyInfo[] properties = _object.GetType().GetProperties();

            foreach (PropertyInfo property in properties)
            {
                xmlelem = xmldoc.CreateElement("", property.Name, "");
                xmltext = xmldoc.CreateTextNode(((property.GetValue(_object, null).ToString() == null) ? "" : property.GetValue(_object, null).ToString()));
                xmlelem.AppendChild(xmltext);
                xmldoc.ChildNodes.Item(1).AppendChild(xmlelem);
            }

            //return xmldoc.InnerXml;

            return XElement.Load(xmldoc.CreateNavigator().ReadSubtree());

        }

        #endregion
    }
}
