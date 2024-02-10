<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="write_prescription.aspx.cs" Inherits="HealthcareSystem.write_prescription" %>

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
            Date:<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />

            <asp:Button ID="enter" onClick="writesPreesc" Text="Write Prescription" CssClass="button" runat="server"></asp:Button> <br />
        </div>
    </form>
</body>
</html>
