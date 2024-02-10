<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pharma.aspx.cs" Inherits="HealthcareSystem.Pharma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharma Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Pharmacist Profile</h1>
            <hr />

            
            <br />

            <div>
                <label>Pharmacy Name:</label>
                <asp:TextBox ID="t1" runat="server"></asp:TextBox>
            </div>
            <br />

            <div>
                <label>Start Date:</label>
                <asp:TextBox ID="t2" runat="server"></asp:TextBox>
            </div>
            <br />

            <div>
                <label>Pharmacist Name:</label>
                <asp:TextBox ID="t3" runat="server"></asp:TextBox>
            </div>
            <br />

            <div>
                <label>Password:</label>
                <asp:TextBox ID="t4" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <br />

            
            <br />

            <div>
                <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="btnSaveChanges_Click" />
            </div>

            <div>
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

