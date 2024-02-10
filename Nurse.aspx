<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nurse.aspx.cs" Inherits="HealthcareSystem.Nurse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Patients List<br />
        <asp:Button ID="Patient_List" runat="server" OnClick ="PatientList" Text="P.L"  class="button"/>
        <br />
        Patient Profile<br />
        <asp:Button ID="Patient_Profile" runat="server" OnClick ="PatientProfile" Text="P.P"  class="button"/>
        <br />
        Doctors Info<br />
        <asp:Button ID="Doctors_Info" runat="server" OnClick ="DoctorsInfo" Text="D.I"  class="button"/>
        <br />
        Emergency Medical Service providers manage which Call Centers<br />
        <asp:Button ID="EMS_CC" runat="server" class="button" OnClick ="EmergencyMedical_Service_providers_manage_which_Call_Centers" Text="E.M.S_C.C" />
        <br />
        Treatment Covered by Insurance<br />
        <asp:Button ID="Treatment_Covered_by_Insurance" class="button" runat="server" OnClick ="TreatmentCovered_by_Insurance" Text="T.I" />
        <br />
        <br />
    </form>
</body>
</html>
