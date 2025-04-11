<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyTask.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .form-box {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .form-box h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .input-field {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>

    <div class="form-container">
        <div class="form-box">
            <h2>Login</h2>
            <asp:Label ID="lblLoginMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="txtLoginUsername" runat="server" Placeholder="Enter Username" CssClass="input-field"></asp:TextBox><br />
            <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" Placeholder="Enter Password" CssClass="input-field"></asp:TextBox><br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" /><br />
            <asp:HyperLink ID="lnkRegister" NavigateUrl="Register.aspx" runat="server">Create An Account</asp:HyperLink>
        </div>
    </div>
</asp:Content>
