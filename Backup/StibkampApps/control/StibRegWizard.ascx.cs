using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using form.Data;
using form.Helpers;
using System.IO;

namespace StibkampApps.control
{
    public partial class StibRegWizard : System.Web.UI.UserControl
    {
        protected StibPerson stibber;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitStibPerson();
        }

        private void InitStibPerson()
        {
            if (this.ViewState["stibperson"] == null)
            {
                stibber = new StibPerson();
            }
            else
            {
                stibber = (StibPerson)this.ViewState["stibperson"];
            }
        }


        protected void wizard_nextClick(object sender, WizardNavigationEventArgs e)
        {

            if (wiz_reg.ActiveStepIndex == 3)
            {
                stibber.Kamptype = rbl_kamptype.SelectedValue;
                stibber.VoorNaam = txt_naam.Text;
                stibber.Achternaam = txt_achternaam.Text;
                stibber.TussenVoegsel = txt_tussenvoegsel.Text;
                stibber.Roepnaam = txt_roepnaam.Text;
                stibber.Geboortedatum = txt_geb.Text;
                stibber.Geslacht = Convert.ToInt16(rbl_geslacht.SelectedValue);
                stibber.Email = txt_email.Text;
                stibber.Adres = txt_straat.Text;
                stibber.Postcode = txt_postcode.Text;
                stibber.Plaats = txt_stad.Text;
                stibber.Telefoonnr = txt_telnr.Text;
                stibber.Mobielnr = txt_mobnr.Text;
                stibber.NaamOuders = txt_naamOuders.Text;
                stibber.AdresOuders = txt_adresOuders.Text;
                stibber.AdresOuders2 = txt_adresOudersNietThuis.Text;
                stibber.ExtraTel1 = txt_extraTel1.Text;
                stibber.ExtraTel2 = txt_extraTel2.Text;
                stibber.NaamHuisarts = txt_naamHuisarts.Text;
                stibber.AdresHuisarts = txt_adresHuisarts.Text;
                stibber.PlaatsHuisarts = txt_plaatsHuisarts.Text;
                stibber.TelnrHuisarts = txt_telHuisarts.Text;
                stibber.NaamZiektekosten = txt_naamVerzekering.Text;
                stibber.InschrijfnrZiektekosten = txt_inschrijfnrVerzekering.Text;
                stibber.WaVerzek = txt_waVerzekering.Text;
                stibber.WaVerzekerInschrijfnr = txt_waInschrijfnr.Text;
                stibber.AnderVakanties = Convert.ToInt16(rbl_andereVakanties.SelectedValue);
                stibber.HeeftZiektes = Convert.ToInt16(rbl_ziektesKind.SelectedValue);
                stibber.Ziektes = txt_ziektesKind.Text;
                stibber.ZiektesMedicijnen = txt_medicijnenKind.Text;
                stibber.PlastInBed = Convert.ToInt16(rbl_kindPlastInBed.SelectedValue);
                stibber.PlastInBedInfo = txt_bedPlassenInfo.Text;
                stibber.Vactinaties = Convert.ToInt16(rbl_vactinaties.SelectedValue);
                stibber.Zwemdiploma = Convert.ToInt16(rbl_heeftZwemdiploma.SelectedValue);
                stibber.ZwemdiplomaInfo = rbl_typeZwemdiploma.SelectedValue;
                stibber.ExtraDiploma = txt_extraDiploma.Text;
                stibber.AllesEten = Convert.ToInt16(rbl_kindeetalles.SelectedValue);
                stibber.AllesEtenInfo = txt_kindeetnietallesinfo.Text;
                stibber.StibGevonden = rbl_stibgevonden.SelectedValue;
                stibber.StibGevondenAnders = txt_stibandersgevonden.Text;

                this.ViewState["stibperson"] = stibber;
            }

        }

        protected void wizard_finishClick(object sender, WizardNavigationEventArgs e)
        {
            if (CaptchaControl1.IsValid)
            {
                PersonInfoManager manager = new PersonInfoManager();

                if (manager.SaveFormRegistration(stibber))
                {
                    MailHelper mailhelper = new MailHelper();
                    String kamptype = String.Empty;
                    String stibnaam = String.Format("{0} {1} {2}", stibber.VoorNaam, stibber.TussenVoegsel, stibber.Achternaam);

                    List<String> emails = new List<String>();

                    if (stibber.Kamptype == "1")
                    {
                        emails = mailhelper.GetStibMailFromConfig(false);
                        kamptype = "Jongste kamp";
                    }
                    else
                    {
                        emails = mailhelper.GetStibMailFromConfig(true);
                        kamptype = "Oudste kamp";

                    }

                    String subject = String.Format("Stibkamp {0} registratie: {1}", kamptype, stibnaam);

                    mailhelper.Send(CreateBody(), emails,subject);
                }
            }
        }

        private String CreateBody()
        {
            StreamReader reader = new StreamReader("D:/projects/StibkampApps/StibkampApps/EmailTemplate/StibRegistration.html");
            String body = reader.ReadToEnd();

            body = body.Replace("[%stibber.Kamptype%]", GetKamptype(stibber.Kamptype));
            body = body.Replace("[%stibber.VoorNaam%]", stibber.VoorNaam);
            body = body.Replace("[%stibber.Achternaam%]", stibber.Achternaam);
            body = body.Replace("[%stibber.TussenVoegsel%]", stibber.TussenVoegsel);
            body = body.Replace("[%stibber.Roepnaam%]", stibber.Roepnaam);
            body = body.Replace("[%stibber.Geboortedatum%]", stibber.Geboortedatum);
            body = body.Replace("[%stibber.Geslacht%]", GetSex(stibber.Geslacht));
            body = body.Replace("[%stibber.Email%]", stibber.Email);
            body = body.Replace("[%stibber.Adres%]", stibber.Adres);
            body = body.Replace("[%stibber.Postcode%]", stibber.Postcode);
            body = body.Replace("[%stibber.Plaats%]", stibber.Plaats);
            body = body.Replace("[%stibber.Telefoonnr%]", stibber.Telefoonnr);
            body = body.Replace("[%stibber.Mobielnr%]", stibber.Mobielnr);
            body = body.Replace("[%stibber.NaamOuders%]", stibber.NaamOuders);
            body = body.Replace("[%stibber.AdresOuders%]", stibber.AdresOuders);
            body = body.Replace("[%stibber.AdresOuders2%]", stibber.AdresOuders2);
            body = body.Replace("[%stibber.ExtraTel1%]", stibber.ExtraTel1);
            body = body.Replace("[%stibber.ExtraTel2%]", stibber.ExtraTel2);
            body = body.Replace("[%stibber.NaamHuisarts%]", stibber.NaamHuisarts);
            body = body.Replace("[%stibber.AdresHuisarts%]", stibber.AdresHuisarts);
            body = body.Replace("[%stibber.PlaatsHuisarts%]", stibber.PlaatsHuisarts);
            body = body.Replace("[%stibber.TelnrHuisarts%]", stibber.TelnrHuisarts);
            body = body.Replace("[%stibber.NaamZiektekosten%]", stibber.NaamZiektekosten);
            body = body.Replace("[%stibber.InschrijfnrZiektekosten%]", stibber.InschrijfnrZiektekosten);
            body = body.Replace("[%stibber.WaVerzek%]", stibber.WaVerzek);
            body = body.Replace("[%stibber.WaVerzekerInschrijfnr%]", stibber.WaVerzekerInschrijfnr);
            body = body.Replace("[%stibber.AnderVakanties%]", GetYesNo(stibber.AnderVakanties));
            body = body.Replace("[%stibber.HeeftZiektes%]", GetYesNo(stibber.HeeftZiektes));
            body = body.Replace("[%stibber.Ziektes%]", stibber.Ziektes);
            body = body.Replace("[%stibber.ZiektesMedicijnen%]", stibber.ZiektesMedicijnen);
            body = body.Replace("[%stibber.PlastInBed%]", GetYesNo(stibber.PlastInBed));
            body = body.Replace("[%stibber.PlastInBedInfo%]", stibber.PlastInBedInfo);
            body = body.Replace("[%stibber.Vactinaties%]", GetYesNo(stibber.Vactinaties));
            body = body.Replace("[%stibber.Zwemdiploma%]", GetYesNo(stibber.Zwemdiploma));
            body = body.Replace("[%stibber.ZwemdiplomaInfo%]", stibber.ZwemdiplomaInfo);
            body = body.Replace("[%stibber.ExtraDiploma%]", stibber.ExtraDiploma);
            body = body.Replace("[%stibber.AllesEten%]", GetYesNo(stibber.AllesEten));
            body = body.Replace("[%stibber.AllesEtenInfo%]", stibber.AllesEtenInfo);
            body = body.Replace("[%stibber.StibGevonden%]", stibber.StibGevonden);
            body = body.Replace("[%stibber.StibGevondenAnders%]", stibber.StibGevondenAnders);


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

        protected string GetSex(int p)
        {
            if (p == 1)
            {
                return "Jongen";
            }
            else
            {
                return "Meisje";
            }
        }

        protected string GetYesNo(int p)
        {
            if (p == 1)
            {
                return "Ja";
            }
            else
            {
                return "Nee";
            }
        }
    }
}