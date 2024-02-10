<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="HealthcareSystem.Doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button class="button" ID="button1" OnClick="view_profile" runat="server" Text="View my profile" /> <br />  <br />
            <asp:Button class="button" ID="button2" OnClick="view_patients_medical" runat="server" Text="View patients' Medical History Information" /> <br />  <br />
            <asp:Button class="button" ID="button3" OnClick="request_lab" runat="server" Text="Request Lab Tests for a Patient" /> <br />  <br />
            <asp:Button class="button" ID="button4" OnClick="write_prescription" runat="server" Text="Write Prescription for a Patient" /> <br />  <br />
            <asp:Button class="button" ID="button5" OnClick="add_mobilenum" runat="server" Text="Add my mobile number(s)" /> <br />  <br />
        </div>
    </form>
</body>
</html>
