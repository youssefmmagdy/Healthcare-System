<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckDoctors.aspx.cs" Inherits="HealthcareSystem.CheckDoctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form4" runat="server">
        <div>
            Hospital Name<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="checkid" runat="server" OnClick="checkHospital" Text="check"  class="button"/>
            <br />
        </div>
    </form>
</body>
</html>
