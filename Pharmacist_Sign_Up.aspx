<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pharmacist_Sign_Up.aspx.cs" Inherits="HealthcareSystem.Pharmacist_Sign_Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ph_id<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            pharmacy_name<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            startDate<br />
            <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
            <br />
            <br />
            password<br />
            <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
            <br />
            <br />
            pharmacist_name<br />
            <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
