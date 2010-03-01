<%@ Register TagPrefix="cc1" Namespace="WebControlCaptcha" Assembly="WebControlCaptcha" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StibRegWizard.ascx.cs"
    Inherits="StibkampApps.control.StibRegWizard" %>
<asp:Wizard ID="wiz_reg" runat="server" ActiveStepIndex="1" BackColor="#EFF3FB" BorderColor="#B5C7DE"
    BorderWidth="1px" DisplaySideBar="False" FinishCompleteButtonText="Versturen"
    Font-Names="Verdana" Font-Size="0.8em" StartNextButtonText="Beginnen" StepPreviousButtonText="Vorige stap"
    Width="478px" StepNextButtonText="Volgende stap" OnNextButtonClick="wizard_nextClick"
    OnFinishButtonClick="wizard_finishClick" 
    FinishPreviousButtonText="Ik wil nog wat aanpassen">
    <WizardSteps>
        <asp:WizardStep ID="WizardStep1" runat="server" StepType="Start" Title="Start">
            Hallo,<br />
            <br />
            We willen u verzoeken dit formulier zo zorgvuldig als mogelijk in te vullen.<br />
            <br />
            Bedankt!
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep2" runat="server" Title="Persoon Info">
            <table class="style1">
                <tr>
                    <td class="style3" colspan="3">
                        <b>Informatie van het kind dat mee op kamp gaat</b>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Kamptype *
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList ID="rbl_kamptype" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Jongste kamp</asp:ListItem>
                            <asp:ListItem Value="0">Oudste kamp</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rbl_kamptype"
                            ErrorMessage="Je dient een kamptype te kiezen">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Naam *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_naam" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_naam"
                            ErrorMessage="Je moet je naam invullen">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Roepnaam
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_roepnaam" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Tussenvoegsel
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_tussenvoegsel" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Achternaam *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_achternaam" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Vul je achternaam in"
                            ControlToValidate="txt_achternaam">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Geslacht *
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList ID="rbl_geslacht" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Jongen</asp:ListItem>
                            <asp:ListItem Value="0">Meisje</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rbl_geslacht"
                            ErrorMessage="Kies een geslacht">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Geboortedatum *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_geb" CssClass="datepicker" runat="server" Text="01/01/1993"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_geb"
                            ErrorMessage="Vul je geboortedatum in">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Email *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_email"
                            ErrorMessage="Vul je email in">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email"
                            ErrorMessage="Je email is niet geldig" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Straat *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_straat" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_straat"
                            ErrorMessage="Vul je straatnaam in">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Stad *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_stad" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_stad"
                            ErrorMessage="Vul je stad in">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Postcode *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_postcode" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_postcode"
                            ErrorMessage="Vul je postcode in">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        Telefoonnr
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="txt_telnr" runat="server"></asp:TextBox>
                    </td>
                    <td class="style8">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Mobielnr
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_mobnr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Naam Ouders/Verzorger *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_naamOuders" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_naamOuders"
                            ErrorMessage="Vul de naam een ouder of verzorger">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Adres Ouders/Verzorger
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_adresOuders" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Adres bij niet thuis
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_adresOudersNietThuis" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Extra telefoonnummer 1
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_extraTel1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Extra telefoonnummer 2
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_extraTel2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3" colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep3" runat="server" Title="Dokter info">
            <table class="style1">
                <tr>
                    <td class="style6" colspan="3">
                        Dokter informatie van het kind
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Naam huisarts
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_naamHuisarts" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Adres huisarts
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="txt_adresHuisarts" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Plaats
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_plaatsHuisarts" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Telefoonnummer
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_telHuisarts" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Naam ziektekosten verzek.
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_naamVerzekering" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Inschrijfnummer
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_inschrijfnrVerzekering" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        W.A verzek. bij
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_waVerzekering" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Inschrijfnummer
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_waInschrijfnr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind andere vakanties?
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList ID="rbl_andereVakanties" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Ja</asp:ListItem>
                            <asp:ListItem Value="0">Nee</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind ziektes waar we rekening mee moeten houden?
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList name='radio1' CssClass="parentOption" ID="rbl_ziektesKind" runat="server"
                            RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Ja</asp:ListItem>
                            <asp:ListItem Value="0">Nee</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr id="radio1_hide" class="hideoption">
                    <td colspan="3" class="hiddentable">
                        <asp:Image Width="16" ID="img" runat="server" ImageUrl="~/content/images/seperator.gif" />
                        <table width="425px">
                            <tr>
                                <td style="width: 300px;">
                                    Welke?
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ziektesKind" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Slikt uw kind hier medicijnen voor?
                                </td>
                                <td>
                                    <asp:RadioButtonList name='radio2' CssClass="parentOption" ID="RadioButtonList1"
                                        runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">Ja</asp:ListItem>
                                        <asp:ListItem Value="0">Nee</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr id='radio2_hide' class="hideoption">
                                <td class="style3">
                                    Welke medicijnen moet hij of zij daarvoor slikken?
                                </td>
                                <td class="style5">
                                    <asp:TextBox ID="txt_medicijnenKind" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Plast uw kind nog in bed?
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList name='radio3' CssClass="parentOption" ID="rbl_kindPlastInBed"
                            runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Ja</asp:ListItem>
                            <asp:ListItem Value="0">Nee</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr id="radio3_hide" class="hideoption">
                    <td colspan="3" class="hiddentable">
                        <asp:Image Width="16" ID="Image1" runat="server" ImageUrl="~/content/images/seperator.gif" />
                        <table id="Table1" width="425px">
                            <tr>
                                <td style="width: 300px;">
                                    Hoe kunnen wij daarmee rekening houden?
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_bedPlassenInfo" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind reguliere vactinaties gehad?
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList ID="rbl_vactinaties" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Ja</asp:ListItem>
                            <asp:ListItem Value="0">Nee</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind zwemdiploma&#39;s?
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList name="radio4" CssClass="parentOption" ID="rbl_heeftZwemdiploma"
                            runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Ja</asp:ListItem>
                            <asp:ListItem Value="0">Nee</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr id="radio4_hide" class="hideoption">
                    <td colspan="3" class="hiddentable">
                        <asp:Image Width="16" ID="Image2" runat="server" ImageUrl="~/content/images/seperator.gif" />
                        <table id="Table2" width="425px">
                            <tr>
                                <td style="width: 300px;">
                                    Zo ja, welke?
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rbl_typeZwemdiploma" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="A">A</asp:ListItem>
                                        <asp:ListItem Value="B">B</asp:ListItem>
                                        <asp:ListItem Value="C">C</asp:ListItem>
                                        <asp:ListItem Value="D">D</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Ook andere diploma&#39;s namelijk
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_extraDiploma" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Mag uw kind alles eten en drinken?
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList name="radio5" CssClass="parentOptionReverse" ID="rbl_kindeetalles"
                            runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Ja</asp:ListItem>
                            <asp:ListItem Value="0">Nee</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr id="radio5_hide" class="hideoption">
                    <td colspan="3" class="hiddentable">
                        <asp:Image Width="16" ID="Image3" runat="server" ImageUrl="~/content/images/seperator.gif" />
                        <table id="Table3" width="425px">
                            <tr>
                                <td style="width: 300px;">
                                    Zo nee, wat mag uw kind niet en waarom niet?
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_kindeetnietallesinfo" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep4" runat="server" Title="Overig">
            <table class="style1">
                <tr>
                    <td class="style3" colspan="3">
                        Overige informatie
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Hoe heeft u Stibkamp gevonden?
                    </td>
                    <td class="style5">
                        <asp:RadioButtonList ID="rbl_stibgevonden" runat="server" CssClass="parentOption"
                            name="radio6">
                            <asp:ListItem>Op school</asp:ListItem>
                            <asp:ListItem>Via de krant </asp:ListItem>
                            <asp:ListItem>Via de sociale dienst </asp:ListItem>
                            <asp:ListItem>Via de wijkvereniging </asp:ListItem>
                            <asp:ListItem>Via de bibliotheek</asp:ListItem>
                            <asp:ListItem Value="1">Anders..</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr id="radio6_hide" class="hideoption">
                    <td colspan="3" class="hiddentable">
                        <asp:Image Width="16" ID="Image4" runat="server" ImageUrl="~/content/images/seperator.gif" />
                        <table id="Table4" width="425px">
                            <tr>
                                <td style="width: 300px;">
                                    Anders namelijk
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_stibandersgevonden" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep5" runat="server" StepType="Finish" Title="Overzicht">
            <table class="style1">
                <tr>
                    <td class="style6" colspan="2">
                        &nbsp;------------ Kind informatie ------------
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Kamptype
                    </td>
                    <td class="style5">
                        <%= GetKamptype(stibber.Kamptype) %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Naam
                    </td>
                    <td class="style5">
                        <%= stibber.VoorNaam %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Roepnaam
                    </td>
                    <td class="style5">
                        <%= stibber.Roepnaam %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Achternaam
                    </td>
                    <td class="style5">
                        <%= stibber.Achternaam %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        TussenVoegsel
                    </td>
                    <td class="style5">
                        <%= stibber.TussenVoegsel %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Geboortedatum
                    </td>
                    <td class="style5">
                        <%= stibber.Geboortedatum %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Geslacht
                    </td>
                    <td class="style5">
                        <%= GetSex(stibber.Geslacht) %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Email
                    </td>
                    <td class="style5">
                        <%= stibber.Email %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Straat + nummer
                    </td>
                    <td class="style5">
                        <%= stibber.Adres  %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Postcode
                    </td>
                    <td class="style5">
                        <%= stibber.Postcode%>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Plaats
                    </td>
                    <td class="style5">
                        <%= stibber.Plaats  %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Telefoonnummer
                    </td>
                    <td class="style5">
                        <%= stibber.Telefoonnr%>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Mobiele nummer
                    </td>
                    <td class="style5">
                        <%= stibber.Mobielnr %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Naam Ouders/Verzorger
                    </td>
                    <td class="style5">
                        <%= stibber.NaamOuders %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Adres Ouders/Verzorger
                    </td>
                    <td class="style5">
                        <%= stibber.AdresOuders %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Adres bij niet thuis
                    </td>
                    <td class="style5">
                        <%= stibber.AdresOuders2 %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Extra telefoonnummer 1
                    </td>
                    <td class="style5">
                        <%= stibber.ExtraTel1  %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Extra telefoonnummer 2
                    </td>
                    <td class="style5">
                        <%= stibber.ExtraTel2  %>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        ------------ Dokter informatie ------------
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Naam huisarts
                    </td>
                    <td class="style5">
                        <%= stibber.NaamHuisarts %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Adres huisarts
                    </td>
                    <td class="style5">
                        <%= stibber.AdresHuisarts %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Plaats huisarts
                    </td>
                    <td class="style5">
                        <%= stibber.PlaatsHuisarts  %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Telefoonnummer
                    </td>
                    <td class="style5">
                        <%= stibber.TelnrHuisarts  %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Naam ziektekosten verzek.
                    </td>
                    <td class="style5">
                        <%= stibber.NaamZiektekosten %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Inschrijfnummer
                    </td>
                    <td class="style5">
                        <%= stibber.InschrijfnrZiektekosten %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        W.A verzekerd bij
                    </td>
                    <td class="style5">
                        <%= stibber.WaVerzek %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        W.A inschrijfnummer
                    </td>
                    <td class="style5">
                        <%= stibber.WaVerzekerInschrijfnr%>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind andere vakanties?
                    </td>
                    <td class="style5">
                        <%= GetYesNo(stibber.AnderVakanties)%>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind ziektes waar we rekening mee moeten houden?
                    </td>
                    <td class="style5">
                        <%= GetYesNo(stibber.HeeftZiektes)%>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;&nbsp;&nbsp; Welke?
                    </td>
                    <td class="style5">
                        <%= stibber.Ziektes   %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Slikt hij/zij medicijnen hiervoor?
                    </td>
                    <td class="style5">
                        <%= stibber.ZiektesMedicijnen %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Plast uw kind nog in bed?
                    </td>
                    <td class="style5">
                        <%= GetYesNo(stibber.PlastInBed)   %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;&nbsp;&nbsp; Hoe kunnen wij daarmee rekening houden?
                    </td>
                    <td class="style5">
                        <%= stibber.PlastInBedInfo%>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind reguliere vactinaties gehad?
                    </td>
                    <td class="style5">
                        <%= GetYesNo(stibber.Vactinaties) %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Heeft uw kind zwemdiploma&#39;s?
                    </td>
                    <td class="style5">
                        <%= GetYesNo(stibber.Zwemdiploma) %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;&nbsp;&nbsp; Zo ja, welke?
                    </td>
                    <td class="style5">
                        <%= stibber.ZwemdiplomaInfo %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Ook andere diploma&#39;s namelijk
                    </td>
                    <td class="style5">
                        <%= stibber.ExtraDiploma %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Mag uw kind alles eten en drinken?
                    </td>
                    <td class="style5">
                        <%= GetYesNo(stibber.AllesEten) %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;&nbsp;&nbsp; Wat mag uw kind niet en waarom niet?
                    </td>
                    <td class="style5">
                        <%= stibber.AllesEtenInfo%>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        ------------ Overige informatie -----------
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Hoe heeft u STiB gevonden
                    </td>
                    <td class="style5">
                        <%= stibber.StibGevonden %>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;&nbsp;&nbsp; Anders, namelijk
                    </td>
                    <td class="style5">
                        <%= stibber.StibGevondenAnders %>
                    </td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <cc1:CaptchaControl ID="CaptchaControl1" runat="server"></cc1:CaptchaControl>
                        <p>
                        </p>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep6" runat="server" StepType="Complete" Title="Klaar">
            We hebben uw registratiegegevens succesvol verstuurd!
            <br />
            <br />
            We zullen spoeding contact met u opnemen.<br />
            <br />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" ForeColor="White" />
    <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
    <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" Width="90px" />
    <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px"
        Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
</asp:Wizard>
