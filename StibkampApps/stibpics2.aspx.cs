using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;
using System.Xml.XPath;

namespace StibkampApps
{
    public partial class stibpics2 : System.Web.UI.Page
    {
        const int _itemsPerPage = 6;

        private int countStibPics = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //countStibPics = DeterminMaxItems();
            //xmldata.DataBind();
            //lvExample.DataSource = xmldata;
            //lvExample.DataBind();
        }

        //private int DeterminMaxItems()
        //{
        //    if (ViewState["CountStibPics"] == null)
        //    {
        //        ViewState["CountStibPics"] = GetXmlAndCountItems();
        //    }

        //    return (int)ViewState["CountStibPics"];
        //}

        //private static int GetXmlAndCountItems()
        //{
        //    int count = 0;
        //    try
        //    {
        //        XmlDocument doc = new XmlDocument();
        //        doc.Load("D:/projects/StibkampApps/StibkampApps/WriteFileStuff.xml");
        //        XmlNodeList nodelist = doc.SelectNodes("/root/image");

        //        count = nodelist.Count;
        //    }
        //    catch
        //    {}

        //    return count;
            
        //}

        //protected void XmlData_Databinding(object sender, EventArgs e)
        //{
        //   // xmldata.XPath = "/root/image[position()>1 and position()<3]";
        //}

        //protected void xmldata_load(object sender, EventArgs e)
        //{

        //}
    }
}
