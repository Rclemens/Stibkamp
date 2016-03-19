<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stibpics2.aspx.cs" Inherits="StibkampApps.stibpics2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="content/css/styles.css" rel="stylesheet" type="text/css" media="screen" />

    <script type="text/javascript" src="content/scripts/jquery.js"></script>

    <script type="text/javascript" src="content/scripts/jquery.galleria.js"></script>

    <script type="text/javascript">

        jQuery(function($) {

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

</head>
<body>
    <form id="form1" runat="server">
    <h1>
        Galleria Demo 01</h1>
    <div class="demo">
        <div id="main_image">
        </div>
        <%--<asp:Repeater ID='Repeater1' runat="server">
            <HeaderTemplate>
                <ul class="gallery_demo_unstyled">
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <img src='<%#XPath("Image")%>' alt="Flowing Rock" title="Flowing Rock Caption"></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>--%>
        <asp:ListView ID="lvExample" runat="server" DataSourceID="xmldata" ItemPlaceholderID="itemPlaceHolder">
            <LayoutTemplate>
                <ul class="gallery_demo_unstyled">
                    <div id="itemPlaceHolder" runat="server" />
                </ul>
            </LayoutTemplate>
            <EmptyDataTemplate>
                No data was returned.
            </EmptyDataTemplate>
            <ItemTemplate>
                <li>
                    <img src='<%#XPath("Image")%>' alt="Flowing Rock" title="Flowing Rock Caption"></li>
            </ItemTemplate>
            <ItemSeparatorTemplate>
                <hr>
            </ItemSeparatorTemplate>
        </asp:ListView>
<%--        <p class="nav">
            <a href="#" onclick="$.galleria.prev(); return false;">&laquo; previous</a> | <a
                href="#" onclick="$.galleria.next(); return false;">next &raquo;</a></p>--%>
        
        <asp:DataPager ID="pager" runat="server" PagedControlID="lvExample" PageSize="3">
            <Fields>
                <asp:NumericPagerField NextPageText=">" PreviousPageText="<" RenderNonBreakingSpacesBetweenControls="true" />
            </Fields>
        </asp:DataPager>
    </div>
    </form>
    <asp:XmlDataSource ID="xmldata" runat="server" DataFile="~/WriteFileStuff.xml" CacheDuration="Infinite"
        EnableCaching="true" XPath="root/image"></asp:XmlDataSource>
</body>
</html>
