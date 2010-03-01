using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace form.controls
{
    public partial class ValidationControl : System.Web.UI.UserControl
    {
        public String ControlToValidate { get; set; }
        
        public String NormalStyle { get; set; }
        public String ErroStyle { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox control = (TextBox)ControlToValidate;

            //this.validator.ControlToValidate = ControlToValidate;

            if (this.validator.IsValid)
            {
                
                //(ControlToValidate as TextBox).CssClass = NormalStyle;
            }
            else
            {
                //(ControlToValidate as TextBox).CssClass = ErroStyle;

            }
        }
    }
}