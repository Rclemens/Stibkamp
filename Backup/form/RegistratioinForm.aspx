<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistratioinForm.aspx.cs"
    Inherits="form._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="content/css/ui-lightness/jquery-ui-1.7.2.custom.css"
        rel="Stylesheet" />
    <link type="text/css" href="content/css/jquery.tooltip.css" rel="Stylesheet" />
    <%--<link type="text/css" href="content/css/screen.css" rel="Stylesheet" />--%>

    <script language="javascript" type="text/javascript" src="content/script/jquery-1.3.2.min.js"></script>

    <script language="javascript" type="text/javascript" src="content/script/jquery-ui-1.7.2.custom.min.js"></script>

    <script language="javascript" type="text/javascript" src="content/script/jquery.tooltip.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>

        <script type="text/javascript" language="javascript" >
            $(function() {
                $(".datepicker").datepicker();
                $('#yahoo a').tooltip({
                    track: true,
                    delay: 0,
                    showURL: false,
                    showBody: " - ",
                    fade: 250
                });

                $('.tooltip').tooltip({
                    track: true,
                    delay: 0,
                    showURL: false,
                    showBody: " - ",
                    fade: 250
                });
            });

            function RequiredTextValidator(sender, args) {
                alert(args.IsValid);
                alert(sender);
                if (document.getElementById("<%= tb_voornaam.ClientID %>").value.length > 0) {
                    args.IsValid = true;
                }
                else {
                    args.IsValid = false;
                }
            }

            function Test() {
                Page_ClientValidate('bla');
                alert('test');
            }
            
        </script>

    </div>
    
    <!-- End demo-description -->
    <asp:Label ID="lblOutput" runat="server"></asp:Label>
    <asp:Wizard ID="Wizard2" runat="server" ActiveStepIndex="0" OnFinishButtonClick="Wizard2_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Persoonlijke informatie" StepType="Start">
                <table border="1">
                    <tr>
                        <td>
                            Kamptype
                        </td>
                        <td>
                            <asp:DropDownList ID="db_kamptype" runat="server">
                                <asp:ListItem>Jongste Kamp</asp:ListItem>
                                <asp:ListItem>Oudste Kamp</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Voornaam
                        </td>
                        <td>
                            <asp:TextBox ID="tb_voornaam" runat="server"></asp:TextBox>
                           <asp:CustomValidator 
                               ID="CustomValidator1"
                               ClientValidationFunction="RequiredTextValidator"
                               runat="server" Text="test"/>
                        </td>
                    </tr>
                    <tr runat="server" class="emailRow">
                        <td>
                            Tussenvoegsel
                        </td>
                        <td class="field">
                            <asp:TextBox ID="tb_tussenvoegsel" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Achternaam
                        </td>
                        <td>
                            <asp:TextBox ID="tb_achternaam" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Roepnaam
                        </td>
                        <td>
                            <asp:TextBox ID="tb_roepnaam" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Geboortedatum *
                        </td>
                        <td>
                            <asp:Calendar ID="calendar" runat="server" BackColor="White" BorderColor="#999999"
                                CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                ForeColor="Black" Height="180px" Width="200px">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="Gray" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Geslacht
                        </td>
                        <td>
                            <asp:DropDownList ID="db_geslacht" runat="server">
                                <asp:ListItem Selected="True">0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email *
                        </td>
                        <td>
                            <asp:TextBox ID="tb_email" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Adres *
                        </td>
                        <td>
                            <asp:TextBox ID="tb_adres" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Postcode *
                        </td>
                        <td>
                            <asp:TextBox ID="tb_postcode" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Plaats *
                        </td>
                        <td>
                            <asp:TextBox ID="tb_plaats" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Telefoonnr
                        </td>
                        <td>
                            <asp:TextBox ID="tb_telefoon" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobielnr
                        </td>
                        <td>
                            <asp:TextBox ID="tb_mobiel" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Naam Ouders/Verzorger
                        </td>
                        <td>
                            <asp:TextBox ID="tb_naamOuders" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Adres Ouders/Verzorger
                        </td>
                        <td>
                            <asp:TextBox ID="tb_adresOuders" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Adres bij niet thuis
                        </td>
                        <td>
                            <asp:TextBox ID="tb_adresOuders2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Extra telefoonnummer 1
                        </td>
                        <td>
                            <asp:TextBox ID="tb_extraTel1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Extra telefoonnummer 2
                        </td>
                        <td>
                            <asp:TextBox ID="tb_extraTel2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Medicatie info">
                <table border="1">
                    <tr>
                        <td>
                            Naam huisarts
                        </td>
                        <td>
                            <asp:TextBox ID="tb_naamHuisarts" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Adres huisarts
                        </td>
                        <td>
                            <asp:TextBox ID="tb_adresHuisarts" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Plaats
                        </td>
                        <td>
                            <asp:TextBox ID="tb_plaatsHuisarts" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Telefoonnummer
                        </td>
                        <td>
                            <asp:TextBox ID="tb_telnrHuisarts" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Naam ziektekosten verzek.
                        </td>
                        <td>
                            <asp:TextBox ID="tb_ziektekosten" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Inschrijfnummer
                        </td>
                        <td>
                            <asp:TextBox ID="tb_verzekInschrijfnr" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            W.A verzek. bij
                        </td>
                        <td>
                            <asp:TextBox ID="tb_waVerzek" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Inschrijfnummer
                        </td>
                        <td>
                            <asp:TextBox ID="tb_waInschrijfnr" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Heeft uw kind andere vakanties?
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rl_andereVakanties" runat="server">
                                <asp:ListItem Text="Ja" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Nee" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Heeft uw kind ziektes waar we rekening mee moeten houden?
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rl_ziektes" runat="server">
                                <asp:ListItem Text="Ja" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Nee" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Zo ja, zijn er medicijnen die hij of zij daarvoor moet slikken?
                        </td>
                        <td>
                            <asp:TextBox ID="tb_extraMedicijnen" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Plast uw kind nog in bed?
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rl_plastInBed" runat="server">
                                <asp:ListItem Text="Ja" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Nee" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Zo ja, hoe kunnen wij daarmee rekening houden?
                        </td>
                        <td>
                            <asp:TextBox ID="tb_rekeningMetPlassen" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Heeft uw kind reguliere vactinaties gehad?
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rl_vactinaties" runat="server">
                                <asp:ListItem Text="Ja" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Nee" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Heeft uw kind zwemdiploma&#39;s?
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rl_zwemdiploma" runat="server">
                                <asp:ListItem Text="Ja" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Nee" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Zo ja, welke? A B C D
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rl_zwemdiplomaLijst" runat="server">
                                <asp:ListItem Text="A" Value="A" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="B" Value="B"></asp:ListItem>
                                <asp:ListItem Text="C" Value="C"></asp:ListItem>
                                <asp:ListItem Text="D" Value="D"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Ook andere diploma's namelijk
                        </td>
                        <td>
                            <asp:TextBox Rows="6" ID="tb_andereDiploma" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mag uw kind alles eten en drinken?
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rl_allesEten" runat="server">
                                <asp:ListItem Text="Ja" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Nee" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Zo nee, wat mag uw kind niet en waarom niet?
                        </td>
                        <td>
                            <asp:TextBox ID="tb_watNietEten" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" Title="Overige info">
                <table border="1">
                    <tr>
                        <td>
                            Hoe heeft u Stibkamp gevonden?
                        </td>
                        <td>
                            <asp:DropDownList ID="dd_hoeGevonden" runat="server">
                                <asp:ListItem Selected="True">Op school</asp:ListItem>
                                <asp:ListItem>Via de krant</asp:ListItem>
                                <asp:ListItem>Sociale dienst</asp:ListItem>
                                <asp:ListItem>De wijkverenging</asp:ListItem>
                                <asp:ListItem>Bibliotheek</asp:ListItem>
                                <asp:ListItem Value="Anders">Anders, namelijk</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Anders,
                        </td>
                        <td>
                            <asp:TextBox ID="tb_stibAndersGevonden" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
        <StartNavigationTemplate>
            <asp:LinkButton ID="lnkbtn2" runat="server" Text="Next2"></asp:LinkButton>
        </StartNavigationTemplate>
    </asp:Wizard>
    </div>
    </form>
</body>
</html>
