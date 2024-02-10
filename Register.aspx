<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HealthcareSystem.Register" %>

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
        Patient<br />
        <asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" class="button" />
        <br />
        <br />
        Nurse<br />
        <asp:Button ID="Button2" runat="server" Text="Sign Up" OnClick="Button2_Click" class="button" />
        <p>
            Doctor</p>
        <p>
            <asp:Button ID="Button3" runat="server" Text="Sign Up" OnClick="Button3_Click" class="button" />
        </p>
        <p>
            Pharmacist</p>
            <asp:Button ID="Button4" runat="server" Text="Sign Up" OnClick="Button4_Click" class="button" />
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
