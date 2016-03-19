<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StibTextbox.ascx.cs" Inherits="form.controls.StibTextbox" %>
<script language="javascript">
    alert();
</script>
<asp:TextBox ID="tb_text" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rv_val" runat="server" ControlToValidate="tb_text"></asp:RequiredFieldValidator>
