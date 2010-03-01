using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using form.entities;
using form.Data;
using System.Xml.Serialization;
using System.Xml;
using System.IO;
using System.Reflection;
using System.Xml.Linq;

namespace form
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Wizard2_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            PersonInfoManager manager = new PersonInfoManager();
            StibPerson stibPerson = SetFormInfoToObject();
            PersonInfo person = new PersonInfo();

            person.ID = Guid.NewGuid();
            person.Firstname = stibPerson.VoorNaam;
            person.Lastname = String.Concat(stibPerson.TussenVoegsel," ", stibPerson.Achternaam);
            person.xmldoc = CreateXML(stibPerson);

            manager.SaveFormRegistration(person);
        }

        private StibPerson SetFormInfoToObject()
        {
            StibPerson person = new StibPerson();
            
           // person.VoorNaam = tb_voornaam.Text;
           // person.Achternaam = tb_achternaam.Text;
           //// person.TussenVoegsel = tb_tussenvoegsel.Text;
           // person.Adres = tb_adres.Text;
           // person.AdresHuisarts = tb_adresHuisarts.Text;
           // person.AdresOuders = tb_adresOuders.Text;
           // person.AdresOuders2 = tb_adresOuders2.Text;
           // person.AllesEten = Convert.ToInt16(rl_allesEten.SelectedValue);
           // person.AllesEtenInfo = tb_watNietEten.Text;
           // person.AnderVakanties = Convert.ToInt16(rl_andereVakanties.SelectedValue);
           // person.Email = tb_email.Text;
           // person.ExtraDiploma = tb_andereDiploma.Text;
           // person.ExtraTel1 = tb_extraTel1.Text;
           // person.ExtraTel2 = tb_extraTel2.Text;
           // person.Geboortedatum = calendar.SelectedDate.ToString();
           // person.Geslacht = Convert.ToInt16(db_geslacht.SelectedValue);
           // person.InschrijfnrZiektekosten = tb_verzekInschrijfnr.Text;
           // person.Kamptype = db_kamptype.SelectedValue;
           // person.Mobielnr = tb_mobiel.Text;
           // person.NaamHuisarts = tb_naamHuisarts.Text;
           // person.NaamOuders = tb_naamOuders.Text;
           // person.NaamZiektekosten = tb_ziektekosten.Text;
           // person.Plaats = tb_plaats.Text;
           // person.PlaatsHuisarts = tb_plaatsHuisarts.Text;
           // person.PlastInBed = Convert.ToInt16(rl_plastInBed.SelectedValue);
           // person.PlastInBedInfo = tb_rekeningMetPlassen.Text;
           // person.Postcode = tb_postcode.Text;
           // person.Roepnaam = tb_roepnaam.Text;
           // person.StibGevonden = dd_hoeGevonden.SelectedValue;
           // person.StibGevondenAnders = tb_stibAndersGevonden.Text;
           // person.TelnrHuisarts = tb_telnrHuisarts.Text;
           // person.Telefoonnr = tb_telefoon.Text;
           // person.Vactinaties = Convert.ToInt16(rl_vactinaties.SelectedValue);
           // person.WaVerzek = tb_waVerzek.Text;
           // person.WaVerzekerInschrijfnr = tb_waInschrijfnr.Text;
           // person.Ziektes = Convert.ToInt16(rl_ziektes.SelectedValue);
           // person.ZiektesMedicijnen = tb_extraMedicijnen.Text;
           // person.Zwemdiploma = Convert.ToInt16(rl_zwemdiploma.SelectedValue);
           // person.ZwemdiplomaInfo = tb_andereDiploma.Text;
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


        //private String CreateXML<T>(T _object)
        //{
        //    XmlDocument xmldoc = new XmlDocument();
        //    XmlNode xmlnode;
        //    XmlElement xmlelem;
        //    XmlText xmltext;

        //    xmlnode = xmldoc.CreateNode(XmlNodeType.XmlDeclaration, "", "");
        //    xmldoc.AppendChild(xmlnode);

        //    xmlelem = xmldoc.CreateElement("", _object.GetType().Name, "");
        //    xmldoc.AppendChild(xmlelem);
        //    //let's add another element (child of the root)

        //    PropertyInfo[] properties = _object.GetType().GetProperties();

        //    foreach (PropertyInfo property in properties)
        //    {
        //        xmlelem = xmldoc.CreateElement("", property.Name, "");
        //        xmltext = xmldoc.CreateTextNode(((property.GetValue(_object, null).ToString() == null)? "" : property.GetValue(_object, null).ToString()));
        //        xmlelem.AppendChild(xmltext); 
        //        xmldoc.ChildNodes.Item(1).AppendChild(xmlelem);
        //    }

        //    return xmldoc.InnerXml;

        //}

        protected void RequiredTextValidator(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value.Length > 0) ? true : false;
        }

        protected void ValidateBtn_OnClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblOutput.Text = "Page is valid.";
            }
            else
            {
                lblOutput.Text = "Page is not valid!";
            }
        }

        protected void btn_click(object source, EventArgs args)
        {

        }

        protected string GetClientId(TextBox control)
        {
            return control.ClientID;
        }
    }
}
