<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="MyTask.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .welcome-container {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px;
        }

        .welcome-container img {
            max-width: 400px;
            height: auto;
            margin-right: 50px;
        }

        .welcome-content {
            max-width: 500px;
            text-align: left;
        }

        .welcome-content h2 {
            font-size: 28px;
            color: #007bff;
            margin-bottom: 20px;
        }

        .welcome-content p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .welcome-content .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-right: 10px;
        }

        .btn-login {
            background-color: #007bff;
            color: white;
        }

        .btn-register {
            background-color: #6c757d;
            color: white;
        }

        .btn-login:hover, .btn-register:hover {
            opacity: 0.8;
        }
    </style>

    <div class="welcome-container">
        <img src="images/task.png" alt="Task Management Illustration" />
        <div class="welcome-content">
            <h2>Welcome to MyTask!</h2>
            <p>
                This website allows you to manage and organize your tasks efficiently.
                Please login or register to start managing your tasks.
            </p>
            <a href="Login.aspx" class="btn btn-login">Login</a>
            <a href="Register.aspx" class="btn btn-register">Register</a>
        </div>
    </div>
</asp:Content>
