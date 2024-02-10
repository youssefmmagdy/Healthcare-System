<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Phar.aspx.cs" Inherits="HealthcareSystem.Phar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header-container">
            <h1 class="hospital-title">Healthcare System</h1>
        </div>
        <div class="button-container">
            <asp:Button ID="btnPharma" runat="server" Text="View My Profile" OnClick="btnPharma_Click" CssClass="button"/>
            <asp:Button ID="editprofile" runat="server" Text="Edit My Profile" OnClick="editClick" CssClass="button"/>
            <asp:Button ID="btnBigL" runat="server" Text="PresSheet" OnClick="btnBigL_Click" CssClass="button" />
        </div>
    </form>
</body>
</html>
