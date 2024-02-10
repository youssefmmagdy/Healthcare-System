<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_mobilenum.aspx.cs" Inherits="HealthcareSystem.add_mobilenum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            Mobile_Number:<br />
            <asp:TextBox ID="num" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="enter" onClick="enterr" Text="Add" runat="server" CssClass="button"></asp:Button> <br />
        </div>
    </form>
</body>
</html>
