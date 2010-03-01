<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.Master" AutoEventWireup="true"
    CodeBehind="_contact.aspx.cs" Inherits="StibkampApps._contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scriptplaceholder" runat="server">
    <style type="text/css">
        .style1
        {
            width: 469px;
        }
        .style3
        {
        }
        .style5
        {
        }
        .hiddentable
        {
            position: relative;
        }
        .hiddentable img, .hiddentable table
        {
            float: left;
        }
        .hiddentable img
        {
            padding-right: 5px;
        }
        .hiddentable table
        {
            border: solid 3px #5294b4;
        }
        .hiddentable table table
        {
            border-width: 0px;
        }
        .style6
        {
            font-weight: bold;
        }
        .style7
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="NewsContentHolder" runat="server">
    <div class="newswrapper" id="newswrapper">
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
                </td>
            </tr>
            <tr>
                <td class="newsfooter">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <tr>
        <td width="780" background="content/images/bg01.jpg">
            <div class="content">
                <h1>
                    Contact:</h1>
                <Stibapps:contactcontrol ID="contactcontrol" runat="server" />
            </div>
        </td>
    </tr>
</asp:Content>
