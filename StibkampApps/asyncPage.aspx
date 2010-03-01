<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asyncPage.aspx.cs" Inherits="StibkampApps.asyncPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asynchronous Drop Down List Example</title>

    <script type="text/javascript">
        function LoadListItems() {
            StartAsyncCall(null, null);
        }

        function OnServerCallComplete(arg, ctx) {
            var idsAndNames = arg.split("~");
            var ids = idsAndNames[0].split("|");
            var names = idsAndNames[1].split("|");
            var htmlCode;
            var ddl = document.getElementById("ddlList");

            for (var i = 0; i < ids.length; i++) {
                htmlCode = document.createElement('option');
                // Add the new <OPTION> node to our <SELECT> drop list
                ddl.options.add(htmlCode);
                // Set the <OPTION> display text and value;
                htmlCode.text = names[i];
                htmlCode.value = ids[i];
            }
            // Enable our drop down list as it
            // should have some values now.
            ddl.disabled = false;
        }

        function OnServerCallError(err, ctx) {
            alert("There was an error processing the request! Error was [" + err + "]");
        }
        function OnDropListSelectChanged() {
            var ddl = document.getElementById("ddlList");
            // Display selected value
            var msg = document.getElementById("msg");
            msg.firstChild.nodeValue = ddl.value;
        }
    </script>

</head>
<body onload="LoadListItems();">
    <form id="form1" runat="server">
    <div>
        <select id="ddlList" disabled="false" onchange="OnDropListSelectChanged();">
            <option>(Loading values from the Server)</option>
        </select>
    </div>
    <hr />
    <div>
        <label>
            Value Selected:&nbsp;</label><span id="msg">{none}</span>
    </div>
    </form>
</body>
</html>
