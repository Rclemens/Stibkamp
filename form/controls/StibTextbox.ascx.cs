using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace form.controls
{
    public partial class StibTextbox : System.Web.UI.UserControl
    {
        public string RegularExpression { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.rv_val.IsValid)
            {
                this.tb_text.BorderColor = Color.Red;
            }
            else
            {
                this.tb_text.BorderColor = Color.Black;
            }

        }
    }
}