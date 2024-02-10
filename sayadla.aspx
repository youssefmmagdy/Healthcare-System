<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sayadla.aspx.cs" Inherits="HealthcareSystem.sayadla" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Healthcare System</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <form id="form2" runat="server">
        <div class="header-container">
            <h1 class="hospital-title">Healthcare System</h1>
        </div>



        <div class="grid-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table-style"></asp:GridView>
            <div class="message-container">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

