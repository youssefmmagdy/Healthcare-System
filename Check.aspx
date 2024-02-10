<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Check.aspx.cs" Inherits="HealthcareSystem.Check" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="txtDoctorID">Doctor ID:</label>
            <asp:TextBox ID="txtDoctorID" runat="server"></asp:TextBox><br />
            
            <label for="txtPatientID">Patient ID:</label>
            <asp:TextBox ID="txtPatientID" runat="server"></asp:TextBox><br />
            
            <label for="txtDate">Date:</label>
            <asp:TextBox ID="txtDate" runat="server" placeholder="yyyy-mm-dd"></asp:TextBox><br />

            
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="button"/>
            
            <hr />
            

        </div>

          <div class="grid-container">
      <asp:GridView ID="GridView2" runat="server" CssClass="table-style"></asp:GridView>
      <div class="message-container">
          <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
      </div>
  </div>
    </form>
</body>
</html>
