<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PresSheet.aspx.cs" Inherits="HealthcareSystem.PresSheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form4" runat="server">
        <div class="header-container">
            <h1 class="hospital-title">Healthcare System</h1>
        </div>
        <div class="button-container">
            <asp:Button ID="btnPharma" runat="server" Text="View prescription" OnClick="BtnListPrescriptions_Click" CssClass="button" />
            <asp:Button ID="btnBigL" runat="server" Text="Pharmacists" OnClick="BtnListPharmacist" CssClass="button" />
            <asp:Button ID="Button1" runat="server" Text="check Prescription" OnClick="BtncheckPres" CssClass="button"/>


        </div>
    </form>
</body>
</html>
