<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor_Sign_Up.aspx.cs" Inherits="HealthcareSystem.Doctor_Sign_Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            doctor_id<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            working_hours<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            working_days<br />
            <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
            <br />
            <br />
            doctor_name<br />
            <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
            <br />
            <br />
            specialization<br />
            <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
            <br />
            <br />
            hospital_name<br />
            <asp:TextBox ID="TextBox6" runat="server" ></asp:TextBox>
            <br />
            <br />
            password<br />
            <asp:TextBox ID="TextBox7" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Button class="button" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
