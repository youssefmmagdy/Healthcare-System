<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connector_tmp.aspx.cs" Inherits="HealthcareSystem.Connector_tmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            Patient_ID:<br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            Labtest_ID:<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />

            <asp:Button ID="enter" onClick="connectorrr" Text="Request Labtest" runat="server" class="button"></asp:Button> <br />
        </div>
    </form>
</body>
</html>
