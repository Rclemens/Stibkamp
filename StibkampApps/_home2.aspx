<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.Master" AutoEventWireup="true"
    CodeBehind="_home2.aspx.cs" Inherits="StibkampApps._home2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NewsContentHolder" runat="server">
    <div class="newswrapper">
        <table cellpadding="0" cellspacing="0" class="newstable">
            <tr>
                <td>
                    <img src="content/images/capnews.png">
                </td>
            </tr>
            <tr>
                <td class="newscontent" width="278" height="96" background="content/images/bgr02.jpg"
                    style="background-repeat: no-repeat;" valign="top">
                    <img class="newsImgLeft" src="content/images/memini.jpg" />
                    <div style="padding-right: 20px; padding-top: 10px;">
                        Stibkamp was weer geweldig! Volgend jaar wil ik jullie gasten er weer bij hebben
                        hoor..
                    </div>
                </td>
            </tr>
            <tr>
                <td class="newscontent" width="278" height="90" background="content/images/bgr02.jpg"
                    style="background-repeat: no-repeat;" valign="top" style="padding-right: 25px;">
                    <img class="newsImgRight" src="content/images/pic014.jpg" />
                    <div style="padding-left: 20px; padding-top: 10px;">
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diem nonummy nibh
                        euismod tincidunt ut lacreet dolore magna aliguam erat
                    </div>
                </td>
            </tr>
            <tr>
                <td class="newscontent" width="278" height="90" background="content/images/bgr02.jpg"
                    style="background-repeat: no-repeat;" valign="top">
                    <img class="newsImgLeft" src="content/images/pic012.jpg" />
                    <div style="padding-right: 20px; padding-top: 10px;">
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diem nonummy nibh
                        euismod tincidunt ut lacreet dolore magna aliguam erat
                    </div>
                </td>
            </tr>
            <tr>
                <td class="newscontent" width="278" height="108" background="content/images/bgr02.jpg"
                    style="background-repeat: no-repeat;" valign="top" style="padding-right: 25px;">
                    <img class="newsImgRight" src="content/images/pic013.jpg" />
                    <div style="padding-left: 20px; padding-top: 10px;">
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diem nonummy nibh
                        euismod tincidunt ut lacreet dolore magna aliguam erat
                    </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <tr>
        <td width="780" background="content/images/bg01.jpg">
            <div class="content">
                <h1>
                    Jongste Kamp</h1>
                <p>
                    <img src="/content/images/Picture_035.jpg" width="133" height="100" alt="Picture_035.jpg"
                        align="left" /></p>
                <p>
                    Het jongste-kamp is een super-gezellige week! We doen allemaal spelletjes, sporten,
                    maken muziek en gaan naar het zwembad. Ook hebben we een disco en natuurlijk aan
                    het eind van de week een geweldige bonte-avond.<br />
                    <br />
                    We gaan natuurlijk niet alles verklappen maar hieronder vertellen we in het kort
                    wat we zoal doen op kamp. Heb je na het lezen zin om mee te gaan? <a href="/jongste-kamp.aspx"
                        title="Jongste Kamp">Lees meer...</a></p>
                <p>
                    &nbsp;</p>
            </div>
        </td>
    </tr>
    <tr>
        <td class="tussenlijn">
        </td>
    </tr>
    <tr>
        <td width="780" height="100%" background="content/images/bg02.jpg" valign="top">
            <div class="content">
                <h1>
                    Oudste Kamp</h1>
                <p>
                    <img src="content/images/image048_139x116.jpg" width="139" height="116" alt="image048.jpg"
                        style="float: right;" /></p>
                <p>
                    Deze Stibkamp week heeft plaatsgevonden in kamphuis de Blauwe Kei.</p>
                <p>
                    De blauwe kei is net buiten de stad Mierlo gevestigd nabij de bossen en een prima
                    speelveld als achtertuin waar een groot gedeelte van de activiteiten heeft plaatsgevonden.</p>
                <p>
                    Ook dit jaar was het kamp in twee groepen verdeeld, waar de laatste jaren het jongste
                    kamp als eerst aan de beurt was, mocht het oudste kamp de aftrap doen. <a href="/oudste-kamp.aspx"
                        title="Oudste Kamp">Lees meer</a></p>
                <p>
                    &nbsp;</p>
            </div>
        </td>
    </tr>
</asp:Content>
