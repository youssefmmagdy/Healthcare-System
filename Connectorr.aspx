<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connectorr.aspx.cs" Inherits="HealthcareSystem.Connectorr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="label" runat="server" Text="Patient ID: "></asp:Label> <br />
            <asp:TextBox ID="patient_input" runat="server"></asp:TextBox> <br />
            <asp:Button ID="enter" onClick="connectorr" runat="server" Text="view" class="button"></asp:Button> <br />
        </div>
    </form>
</body>
</html>
