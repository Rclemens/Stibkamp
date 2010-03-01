<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stibpics.aspx.cs" Inherits="StibkampApps.stibpics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="content/css/styles.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="content/script/jquery.js"></script>
    <script type="text/javascript" src="content/script/jquery.galleria.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <Stibapps:pics ID="pics" runat="server" Xmllocation="~/WriteFileStuff.xml" />
    </div>
    </form>
</body>
</html>
