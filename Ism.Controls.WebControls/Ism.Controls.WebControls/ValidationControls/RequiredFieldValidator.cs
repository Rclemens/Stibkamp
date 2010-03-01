using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Reflection;
using System.Web.Compilation;

namespace Ism.Controls.WebControls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:RequiredFieldValidator runat=\"server\" ErrorMessage=\"RequiredFieldValidator\"></{0}:RequiredFieldValidator>")]
    public class RequiredFieldValidator : System.Web.UI.WebControls.RequiredFieldValidator
    {

        public ValidatorControlType ShowErrorControlType { get; set; }
        public ValidatorValueType DefaultValueType { get; set; }

        protected string defaultStyle = string.Empty;
        protected string errorStyle = string.Empty;

        protected string showErrorControl = string.Empty;

        protected string defaultValue = string.Empty;
        protected string errorValue = string.Empty;
        private string defaultValueOfInput = string.Empty;

        public string DefaultValueOfInput
        {
            get { return defaultValueOfInput; }
            set { defaultValueOfInput = value; }
        }

        public string DefaultStyle
        {
            get { return defaultStyle; }
            set { defaultStyle = value; }
        }

        public string ErrorStyle
        {
            get { return errorStyle; }
            set { errorStyle = value; }
        }

        public string ShowErrorControl
        {
            get { return showErrorControl; }
            set { showErrorControl = value; }
        }

        public string DefaultValue
        {
            get { return defaultValue; }
            set { defaultValue = value; }
        }

        public string ErrorValue
        {
            get { return errorValue; }
            set { errorValue = value; }
        }

        protected override bool EvaluateIsValid()
        {
            bool result = base.EvaluateIsValid();

            Control control = FindControl(showErrorControl);
            string controlClass = result ? defaultStyle : errorStyle;

            if (control != null)
            {

                switch (ShowErrorControlType)
                {
                    case ValidatorControlType.Label:

                        Label label = control as Label;
                        if (label != null)
                        {

                            label.CssClass = controlClass;
                        }
                        break;

                    case ValidatorControlType.TextBox:

                        TextBox textbox = control as TextBox;
                        if (textbox != null)
                        {
                            textbox.CssClass = controlClass;
                        }
                        break;

                    case ValidatorControlType.TableCell:
                        HtmlTableCell tablecell = control as HtmlTableCell;
                        if (tablecell != null)
                        {
                            tablecell.Attributes["class"] = controlClass;
                        }
                        break;
                    case ValidatorControlType.Tr:
                        HtmlTableRow tableRow = control as HtmlTableRow;
                        if (tableRow != null)
                        {
                            tableRow.Attributes["class"] = controlClass;
                        }
                        break;
                    case ValidatorControlType.Div:
                        HtmlGenericControl div = control as HtmlGenericControl;
                        if (div != null)
                        {
                            div.TagName = "div";
                            div.Attributes["class"] = controlClass;
                        }
                        break;
                    case ValidatorControlType.TextArea:
                        HtmlTextArea textArea = control as HtmlTextArea;
                        if (textArea != null)
                        {
                            textArea.Attributes["class"] = controlClass;
                        }
                        break;
                }
            }
            return result;
        }

        private void AddAttribute(string clientId, string attributeName, string attributeValue)
        {

            if (!this.IsPartialRenderingSupported)
            {
                Page.ClientScript.RegisterExpandoAttribute(clientId, attributeName, attributeValue);
            }
            else
            {
                Type scriptManagerType = BuildManager.GetType("System.Web.UI.ScriptManager", false);
                scriptManagerType.InvokeMember("RegisterExpandoAttribute", BindingFlags.InvokeMethod | BindingFlags.Public | BindingFlags.Static, null, null, new object[] { this, clientId, attributeName, attributeValue, false });
            }

        }

        protected override void AddAttributesToRender(HtmlTextWriter writer)
        {
            base.AddAttributesToRender(writer);
            if (RenderUplevel)
            {
                string clientID = this.ClientID;

                if (ShowErrorControlType != ValidatorControlType.None)
                {
                    this.AddAttribute(clientID, "errorcontrol", base.GetControlRenderID(showErrorControl));
                    this.AddAttribute(clientID, "defaultstyle", defaultStyle);
                    this.AddAttribute(clientID, "errorstyle", errorStyle);
                    this.AddAttribute(clientID, "defaultValueOfInput", defaultValueOfInput);
                }

                if (DefaultValueType != ValidatorValueType.None)
                {
                    this.AddAttribute(clientID, "defaultvalue", defaultValue);
                    this.AddAttribute(clientID, "errorvalue", errorValue);

                    switch (DefaultValueType)
                    {
                        case ValidatorValueType.Image:
                            this.AddAttribute(clientID, "defaultvaluecontrol", "img_" + base.ClientID);
                            break;
                        case ValidatorValueType.Text:
                            this.AddAttribute(clientID, "defaultvaluecontrol", "span_" + base.ClientID);
                            break;
                    }
                }
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);

            switch (DefaultValueType)
            {
                case ValidatorValueType.Image:
                    if (!string.IsNullOrEmpty(defaultValue))
                    {
                        System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
                        img.ID = "img_" + base.ClientID;
                        img.ImageUrl = base.IsValid ? defaultValue : errorValue;

                        img.RenderControl(writer);
                    }
                    break;
                case ValidatorValueType.Text:
                    if (!string.IsNullOrEmpty(defaultValue))
                        writer.WriteLine(base.IsValid ? defaultValue : errorValue);
                    break;
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (RenderUplevel && !Page.ClientScript.IsClientScriptBlockRegistered("ValidationScript"))
            {
                string script = @"<script language='javascript'>" +
                     "function RequiredFieldValidatorEvaluateIsValid(val){\n" +
                     "var value = ValidatorGetValue(val.controltovalidate);if(value == ''||value==val.defaultValueOfInput){\n " +
                     "if (val.errorcontrol != null) { document.getElementById(val.errorcontrol).className=val.errorstyle;}\n";
                script += "if (val.defaultvaluecontrol != null) { document.getElementById(val.defaultvaluecontrol).src=val.errorvalue;}";
                script += "return false;}\n";
                script += "else{ if (val.errorcontrol != null) { document.getElementById(val.errorcontrol).className=val.defaultstyle; }";
                script += "if (val.defaultvaluecontrol != null) { document.getElementById(val.defaultvaluecontrol).src=val.defaultvalue;}";
                script += "return true;}}</script>\n";

                if (!this.IsPartialRenderingSupported)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ValidationScript", script);
                }
                else
                {
                    Type scriptManagerType = BuildManager.GetType("System.Web.UI.ScriptManager", false);
                    scriptManagerType.InvokeMember("RegisterClientScriptBlock", BindingFlags.InvokeMethod | BindingFlags.Public | BindingFlags.Static, null, null, new object[] { this, this.GetType(), "ValidationScript", script, false });
                }
            }
        }

        internal bool IsPartialRenderingSupported
        {
            get
            {
                if (!this.PartialRenderingChecked)
                {
                    Type scriptManagerType = BuildManager.GetType("System.Web.UI.ScriptManager", false);
                    if (scriptManagerType != null)
                    {
                        object obj2 = this.Page.Items[scriptManagerType];
                        if (obj2 != null)
                        {
                            PropertyInfo property = scriptManagerType.GetProperty("SupportsPartialRendering");
                            if (property != null)
                            {
                                object obj3 = property.GetValue(obj2, null);
                                this.IsPartialRenderingEnabled = (bool)obj3;
                            }
                        }
                    }
                    this.PartialRenderingChecked = true;
                }
                return this.IsPartialRenderingEnabled;
            }

        }

        private bool PartialRenderingChecked
        {
            get
            {
                object val = ViewState["PartialRenderingChecked"];
                if (val != null)
                    return (bool)val;
                return false;
            }
            set
            {
                ViewState["PartialRenderingChecked"] = value;
            }
        }

        private bool IsPartialRenderingEnabled
        {
            get
            {
                object val = ViewState["IsPartialRenderingEnabled"];
                if (val != null)
                    return (bool)val;
                return false;
            }
            set
            {
                ViewState["IsPartialRenderingEnabled"] = value;
            }
        }
    }
}
