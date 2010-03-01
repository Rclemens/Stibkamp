using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Xml.XPath;
using System.Xml.Serialization;
using System.Xml;

namespace form.Helpers
{
    public sealed class XmlConfigurator : IConfigurationSectionHandler 
    { 
        #region Private member variables 
        #endregion 
 
        #region Constructors, destructors and initializers 
 
        public XmlConfigurator() 
        { 
        } 
 
        #endregion 
 
        #region Private methods 
        #endregion 
 
        #region Protected methods 
        #endregion 
 
        #region Public methods 
 
        public object Create(object parent, object configContext, System.Xml.XmlNode section) 
        { 
            Object settings = null; 
 
            if (section == null) { return settings; } 
 
            XPathNavigator navigator = section.CreateNavigator(); 
            String typeName = (string)navigator.Evaluate("string(@type)"); 
            Type sectionType = Type.GetType(typeName); 
 
            XmlSerializer xs = new XmlSerializer(sectionType); 
            XmlNodeReader reader = new XmlNodeReader(section); 
 
            try 
            { 
                settings = xs.Deserialize(reader); 
            } 
            catch (Exception ex) 
            { 
                System.Diagnostics.Debug.WriteLine(ex.Message); 
            } 
            finally 
            { 
                xs = null; 
            } 
 
            return settings; 
 
        } 
 
 
        #endregion 
 
        #region Public properties 
        #endregion 
 
        #region Private Enums 
        #endregion 
 
        #region Public Enums 
        #endregion 
    } 
}
