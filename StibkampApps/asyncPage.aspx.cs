using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace StibkampApps
{
    public partial class asyncPage : System.Web.UI.Page, ICallbackEventHandler
    {
        private DataSet lookupData = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Get our callback event reference
            string js = Page.ClientScript.GetCallbackEventReference(this,
            "arg", "OnServerCallComplete", "ctx", "OnServerCallError", true);
            // Create a simplified wrapper method
            StringBuilder newFunction = new StringBuilder();
            newFunction.Append("function StartAsyncCall(arg, ctx) ");
            newFunction.Append("{ ");
            newFunction.Append(js);
            newFunction.Append(" } ");
            // Now register it
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
            "NewAsyncMethod",
            newFunction.ToString(), true);

        }

        private DataSet GetLookupValuesFromDatabase()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataColumn idCol = new DataColumn("ID", typeof(int));
            DataColumn nameCol = new DataColumn("Name", typeof(string));
            dt.Columns.Add(idCol);
            dt.Columns.Add(nameCol);
            dt.AcceptChanges();
            DataRow newRow = null;
            newRow = dt.NewRow();
            newRow[idCol] = 1;
            newRow[nameCol] = "Joe Bloggs ID#1";
            dt.Rows.Add(newRow);
            newRow = dt.NewRow();
            newRow[idCol] = 2;
            newRow[nameCol] = "Mr A. Nonymous ID#2";
            dt.Rows.Add(newRow);
            newRow = dt.NewRow();
            newRow[idCol] = 3;
            newRow[nameCol] = "Mrs N. Extdoorneighbour ID#3";
            dt.Rows.Add(newRow);
            newRow = dt.NewRow();
            newRow[idCol] = 4;
            newRow[nameCol] = "Mr. Pea Body ID#4";
            dt.Rows.Add(newRow);
            ds.Tables.Add(dt);
            ds.AcceptChanges();
            return ds;
        }

        #region ICallbackEventHandler Members

        public string GetCallbackResult()
        {
            StringBuilder ids = new StringBuilder();
            StringBuilder names = new StringBuilder();
            int rowCnt = 0;
            int numRows = lookupData.Tables[0].Rows.Count;
            foreach (DataRow row in lookupData.Tables[0].Rows)
            {
                rowCnt++;
                ids.Append(row["ID"].ToString());
                if (rowCnt < numRows) // Only append a separator if its NOT the last element
                    ids.Append("|"); // Include a data element separator character
                names.Append(row["Name"].ToString());
                if (rowCnt < numRows) // Only append a separator if its NOT the last element
                    names.Append("|"); // Include a data element separator character
            }
            // Make one big string, separating the sets of data with a tilde ‘~’
            string returnData = string.Format("{0}~{1}", ids.ToString(),
            names.ToString());
            return returnData;
        }

        public void RaiseCallbackEvent(string eventArgument)
        {
            System.Threading.Thread.Sleep(20000); // Simulate a delay
            lookupData = GetLookupValuesFromDatabase();
        }

        #endregion

    }
}
