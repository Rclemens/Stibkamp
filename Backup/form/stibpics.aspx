<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stibpics.aspx.cs" Inherits="hyvesApi.stibpics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="content/css/styles.css" rel="stylesheet" type="text/css" media="screen" />

    <script type="text/javascript" src="content/script/jquery.js"></script>

    <script type="text/javascript" src="content/script/jquery.galleria.js"></script>

</head>
<body>

    <script type="text/javascript">
        jQuery(function($) {

            $(".imgDown").click(function() {
                alert("test");
                //$(".galleryMover").animate({ "top": "-=63px" }, "slow");
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

    <form id="form1" runat="server">
    <div>
        <h1>
            Galleria Demo 01</h1>
        <div class="demo">
            <table class="galltable">
                <tr>
                    <td>
                        <div class="imgUp">
                            UP</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="galleryWrapper">
                            <div class="galleryMover">
                                <asp:Repeater ID='Repeater2' runat="server" DataSourceID="xmldata">
                                    <HeaderTemplate>
                                        <ul id="ulgall" class="gallery_demo_unstyled">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <img src='<%#XPath("ImageFullscreen")%>' alt="Flowing Rock" title="Flowing Rock Caption"></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="imgDown">
                            UP</div>
                    </td>
                </tr>
            </table>
            <div id="main_image">
            </div>
            <p class="nav">
                <a href="#" onclick="$.galleria.prev(); return false;">&laquo; previous</a> | <a
                    href="#" onclick="$.galleria.next(); return false;">next &raquo;</a></p>
        </div>
    </div>
    </form>
    <asp:XmlDataSource ID="xmldata" runat="server" DataFile="~/WriteFileStuff.xml" CacheDuration="Infinite"
        EnableCaching="true" XPath="root/image"></asp:XmlDataSource>
</body>
</html>
