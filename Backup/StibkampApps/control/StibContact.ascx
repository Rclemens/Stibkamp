<%@ Register TagPrefix="cc1" Namespace="WebControlCaptcha" Assembly="WebControlCaptcha" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StibContact.ascx.cs"
    Inherits="StibkampApps.control.StibContact" %>
<asp:Wizard ID="wiz_reg" runat="server" ActiveStepIndex="0" BackColor="#EFF3FB" BorderColor="#B5C7DE"
    BorderWidth="1px" DisplaySideBar="False" FinishCompleteButtonText="Versturen"
    Font-Names="Verdana" Font-Size="0.8em" Width="478px" 
    OnFinishButtonClick="wizard_finishClick" >
    <WizardSteps>
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
                        telefoonnummer&nbsp; *
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txt_telnr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txt_telnr"
                            ErrorMessage="Vul je telefoon nummer in">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Vraag *
                    </td>
                    <td class="style5">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style3" colspan="2">
                        <asp:TextBox ID="txt_vraag" runat="server" Rows="6" TextMode="MultiLine" Width="287px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txt_vraag"
                            ErrorMessage="Vul je vraag in">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <cc1:CaptchaControl ID="CaptchaControl1" runat="server"></cc1:CaptchaControl>
                    </td>
                </tr>
                <tr>
                    <td class="style3" colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep6" runat="server" StepType="Complete" Title="Klaar">
            Je vraag is net verstuurd.
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
