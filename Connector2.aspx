<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connector2.aspx.cs" Inherits="HealthcareSystem.Connector2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Treatment Id<br />
        <asp:TextBox ID="Treatment_id" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Check" OnClick="GetId"  class="button"/>
    </form>
</body>
</html>
