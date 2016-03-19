<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StibkampApps._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stibkamp website</title>
    <link rel="stylesheet" href="/content/css/stibstyle.css" type="text/css" />

    <script type="text/javascript" src="/content/script/cufon-yui.js"></script>

    <script type="text/javascript" src="/content/script/Curlz_MT_400.font.js"></script>

    <script type="text/javascript">
        Cufon.replace('H1');
        Cufon.replace('H2');
    </script>

    <link href="content/css/styles.css" rel="stylesheet" type="text/css" media="screen" />

    <script type="text/javascript" src="content/script/jquery.js"></script>

    <script type="text/javascript" src="content/script/jquery.galleria.js"></script>

</head>
<body>

    <script type="text/javascript">
        jQuery(function($) {

            $(".imgDown").click(function() {
                $(".galleryMover").animate({ "top": "-=63px" }, "slow");
            });

            $(".imgUp").click(function() {
                $(".galleryMover").animate({ "top": "+=63px" }, "slow");
            });
            $('.gallery_demo_unstyled').addClass('gallery_demo'); // adds new class name to maintain degradability

            $('ul.gallery_demo').galleria({
                history: true, // activates the history object for bookmarking, back-button etc.
                clickNext: true, // helper for making the image clickable
                insert: '#main_image', // the containing selector for our main image
                onImage: function(image, caption, thumb) { // let's add some image effects for demonstration purposes

                    // fade in the image & caption
                    if (!($.browser.mozilla && navigator.appVersion.indexOf("Win") != -1)) { // FF/Win fades large images terribly slow
                        image.css('display', 'none').fadeIn(1000);
                    }
                    caption.css('display', 'none').fadeIn(1000);

                    // fetch the thumbnail container
                    var _li = thumb.parents('li');

                    // fade out inactive thumbnail
                    _li.siblings().children('img.selected').fadeTo(500, 0.3);

                    // fade in active thumbnail
                    thumb.fadeTo('fast', 1).addClass('selected');

                    // add a title for the clickable image
                    image.attr('title', 'Next image >>');
                },
                onThumb: function(thumb) { // thumbnail effects goes here

                    // fetch the thumbnail container
                    var _li = thumb.parents('li');

                    // if thumbnail is active, fade all the way.
                    var _fadeTo = _li.is('.active') ? '1' : '0.3';

                    // fade in the thumbnail when finnished loading
                    thumb.css({ display: 'none', opacity: _fadeTo }).fadeIn(1500);

                    // hover effects
                    thumb.hover(
					function() { thumb.fadeTo('fast', 1); },
					function() { _li.not('.active').children('img').fadeTo('fast', 0.3); } // don't fade out if the parent is active
				)
                }
            });
        });
	
    </script>

    <form id="form2" runat="server">
    <table cellpadding="0" cellspacing="0" class="mainTable">
        <tr>
            <td class="firstrow" rowspan="10">
            </td>
            <td class="secondrow" rowspan="10">
            </td>
            <td class="thirdrow">
                <div class="maindiv">
                    <table class="contenwrapper" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <img src="/content/images/helestibheader_01.jpg" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="topmenuWrapper">
                                    <div class="topmenu">
                                        <a href="/home.aspx">Home</a></div>
                                    <div class="topmenu">
                                        <a href="/stibkamp-info.aspx">Stibkamp info</a></div>
                                    <div class="topmenu">
                                        <a href="/mee-op-kamp.aspx">Mee op kamp</a></div>
                                    <div class="topmenu">
                                        <a href="/leider-worden.aspx">Leider worden?</a></div>
                                    <div class="topmenu">
                                        <a href="/mediapage.aspx">mediapage</a></div>
                                    <div class="topmenu">
                                        <a href="/test.aspx">test</a></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="780" background="/content/images/bg01.jpg">
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
                                    <div id="main_image">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="newswrapper">
                        <table cellpadding="0" cellspacing="0" class="newstable">
                            <tr>
                                <td>
                                    <img src="/content/images/capnews.png">
                                </td>
                            </tr>
                            <tr>
                                <td class="newscontent" width="278" height="96" background="/content/images/bgr02.jpg"
                                    style="background-repeat: no-repeat;" valign="top">
                                    <div style="padding-right: 20px; padding-top: 10px;">
                                        <div class="galleryWrapper">
                                            <div class="galleryMover">
                                                <asp:Repeater ID='Repeater2' runat="server" DataSourceID="xmldata">
                                                    <HeaderTemplate>
                                                        <ul id="ulgall" class="gallery_demo_unstyled">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <li>
                                                            <img src='<%#XPath("Image")%>' alt="Flowing Rock" title="Flowing Rock Caption"></li>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </ul>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="newsfooter">
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </td>
            <td class="fifthrow" rowspan="10">
            </td>
            <td class="sixthrow" rowspan="10">
            </td>
        </tr>
        <tr>
            <td colspan="2" width="780" height="93" background="/content/images/footer.jpg" style="padding-left: 50px;">
                <a href="" class="menu">Home</a>
                <img src="/content/images/mw.gif" hspace="15">
                <a href="" class="menu">About</a>
                <img src="/content/images/mw.gif" hspace="15">
                <a href="" class="menu">Music</a>
                <img src="/images/mw.gif" hspace="15">
                <a href="" class="menu">Drinks</a>
                <img src="/images/mw.gif" hspace="15">
                <a href="" class="menu">Gallery</a>
                <img src="/content/images/mw.gif" hspace="15">
                <a href="" class="menu">Contacts</a>
                <div style="padding-left: 100px; padding-top: 10px; font-size: 10px;">
                    YourClub.Com &copy; 2003 • <a href="" style="color: #000000; text-decoration: none;">
                        Privacy Policy</a></div>
            </td>
        </tr>
    </table>

    <script type="text/javascript">        Cufon.now(); </script>

    </form>
    <asp:XmlDataSource ID="xmldata" runat="server" CacheDuration="Infinite" EnableCaching="true"
        XPath="root/image" DataFile="~/WriteFileStuff.xml"></asp:XmlDataSource>
</body>
</html>
