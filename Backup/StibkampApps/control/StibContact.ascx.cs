using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using form.Helpers;
using form.Data;
using System.IO;

namespace StibkampApps.control
{
    public partial class StibContact : System.Web.UI.UserControl
    {
        private form.entities.StibContact stibcontact;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void wizard_finishClick(object sender, WizardNavigationEventArgs e)
        {
            if (CaptchaControl1.IsValid)
            {
                GetContactInfo();
                
                StibContactManager manager = new StibContactManager();


                if (manager.SaveContact(stibcontact))
                {
                    MailHelper mailhelper = new MailHelper();
                    String kamptype = String.Empty;
                    String stibnaam = String.Format("{0} {1} {2}", stibcontact.Voornaam, stibcontact.Tussenvoegsel, stibcontact.Achternaam);
                    
                    List<String> emails = new List<String>();

                    if (stibcontact.Kamptype == "1")
                    {
                        emails = mailhelper.GetStibMailFromConfig(false);
                        kamptype = "Jongste kamp";
                    }
                    else
                    {
                        emails = mailhelper.GetStibMailFromConfig(true);
                        kamptype = "Oudste kamp";

                    }

                    String subject = String.Format("Stibkamp {0} vraag: {1}", GetKamptype(stibcontact.Kamptype), stibnaam);

                    mailhelper.Send(CreateBody(), emails, subject);
                }
            }
        }

        private void GetContactInfo()
        {
            stibcontact = new form.entities.StibContact();
            stibcontact.Kamptype = rbl_kamptype.SelectedValue;
            stibcontact.Voornaam = txt_naam.Text;
            stibcontact.Achternaam = txt_achternaam.Text;
            stibcontact.Tussenvoegsel = txt_tussenvoegsel.Text;
            stibcontact.Vraag = txt_vraag.Text;

        }

        private String CreateBody()
        {
            StreamReader reader = new StreamReader("D:/projects/StibkampApps/StibkampApps/EmailTemplate/StibContact.html");
            String body = reader.ReadToEnd();

            body = body.Replace("[%StibContact.Kamptype%]", GetKamptype(stibcontact.Kamptype));
            body = body.Replace("[%StibContact.VoorNaam%]", stibcontact.Voornaam);
            body = body.Replace("[%StibContact.Achternaam%]", stibcontact.Achternaam);
            body = body.Replace("[%StibContact.TussenVoegsel%]", stibcontact.Tussenvoegsel);
            body = body.Replace("[%StibContact.Vraag%]", stibcontact.Vraag);

            return body;

        }

        protected string GetKamptype(string p)
        {
            if (p == "1")
            {
                return "Jongste kamp";
            }
            else
            {
                return "Oudste Kamp";
            }
        }
    }
}