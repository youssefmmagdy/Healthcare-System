<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient_Sign_Up.aspx.cs" Inherits="HealthcareSystem.Patient_Sign_Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            patient_id<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            patient_name<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            ehr<br />
            <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
            <br />
            <br />
            contact<br />
            <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
            <br />
            <br />
            allergies<br />
            <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
            <br />
            <br />
            diseases<br />
            <asp:TextBox ID="TextBox6" runat="server" ></asp:TextBox>
            <br />
            <br />
            vaccines<br />
            <asp:TextBox ID="TextBox7" runat="server" ></asp:TextBox>
            <br />
            <br />
            drugs<br />
            <asp:TextBox ID="TextBox8" runat="server" ></asp:TextBox>
            <br />
            <br />
            exam_result<br />
            <asp:TextBox ID="TextBox9" runat="server" ></asp:TextBox>
            <br />
            <br />
            password<br />
            <asp:TextBox ID="TextBox10" runat="server" ></asp:TextBox>
            <br />
            <br />
            ins_company<br />
            <asp:TextBox ID="TextBox11" runat="server" ></asp:TextBox>
            <br />
            <br />
            nurse_id1<br />
            <asp:TextBox ID="TextBox12" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
