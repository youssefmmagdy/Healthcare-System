<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="HealthcareSystem.Patient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Button ID="viewid" runat="server" OnClick="viewprofile" Text="View Profile" class="button" />
        </p>
        <p>
            <br />
            <asp:Button ID="checkhospitalid" runat="server" OnClick="checkHospitalAndDoctors" class="button" Text="Check Hospitals and their Doctors" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="checkid" runat="server" OnClick="checkDoctors" class="button" Text="Check Doctors" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="appid" runat="server" OnClick="makeAppointment" class="button" Text="Make an Appointment" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="editid" runat="server" OnClick="editProfile" class="button" Text="Edit Profile" />
        </p>
    </form>
</body>
</html>
