<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.Master" AutoEventWireup="true"
    CodeBehind="_stibpics.aspx.cs" Inherits="StibkampApps._stibpics" %>

<asp:Content ID="script" ContentPlaceHolderID="scriptplaceholder" runat="server">
    <script type="text/javascript">
        $(function() {
            $('#gallery a').lightBox();
        });
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="NewsContentHolder" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <tr>
        <td width="780" background="content/images/bg01.jpg">
            <div class="content">
                <asp:ListView ID="lvExample" runat="server" DataSourceID="xmldata" ItemPlaceholderID="itemPlaceHolder">
                    <LayoutTemplate>
                        <div id="gallery">
                            <ul>
                                <div id="itemPlaceHolder" runat="server" />
                            </ul>
                        </div>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        No data was returned.
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <li><a href='<%#XPath("Image")%>' title="Stibkamp 2009">
                            <img src='<%#XPath("IconLarge")%>' width="72" height="72" alt="" />
                        </a></li>
                    </ItemTemplate>
                </asp:ListView>
                <asp:DataPager ID="pager" runat="server" PagedControlID="lvExample" PageSize="12">
                    <Fields>
                        <asp:NumericPagerField NextPageText="Volgende" PreviousPageText="Vorige" />
                    </Fields>
                </asp:DataPager>
                <asp:XmlDataSource ID="xmldata" runat="server" DataFile="~/WriteFileStuff.xml" CacheDuration="Infinite"
                    EnableCaching="true" XPath="root/image"></asp:XmlDataSource>
            </div>
        </td>
    </tr>
</asp:Content>
