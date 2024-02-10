<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connector.aspx.cs" Inherits="HealthcareSystem.Connector" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Patient Id<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="inputing" runat="server" OnClick="GetId" Text="search"  class="button"/>
        </div>
    </form>
</body>
</html>
