using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StibkampApps.control
{
    public partial class StibPicsControl : System.Web.UI.UserControl
    {
        private string _xmllocation = string.Empty;

        public string Xmllocation
        {
            get { return _xmllocation; }
            set { _xmllocation = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            xmldata.DataFile = _xmllocation;
        }
    }
}