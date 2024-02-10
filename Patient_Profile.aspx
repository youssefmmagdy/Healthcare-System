<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient_Profile.aspx.cs" Inherits="HealthcareSystem.Patient_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="label" runat="server" Text="Patient ID:"></asp:Label>
            <br />
            <asp:TextBox ID="t1" runat="server"></asp:TextBox>
            <br />
            
            <div>
            <asp:Button ID="button" runat="server" Text="View Profile" OnClick="buttonMethod"  class="button"/>
        </div>
        </div>
    </form>
</body>
</html>
