<%@ Page Title="Home - MyTask" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MyTask.Home" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Home - MyTask
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .main-content {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px;
        }

        .main-content img {
            max-width: 400px;
            height: auto;
            margin-right: 50px;
        }

        .content-text {
            max-width: 500px;
            text-align: left;
        }

        .content-text h2 {
            font-size: 28px;
            color: #007bff;
            margin-bottom: 20px;
        }

        .content-text p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .btn-container a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-right: 10px;
        }

        .btn-container a:first-child {
            background-color: #007bff;
            color: white;
        }

        .btn-container a:last-child {
            background-color: #6c757d;
            color: white;
        }

        .btn-container a:hover {
            opacity: 0.8;
        }
    </style>

    <div class="main-content">
        <img src="images/task.png" alt="Task Management Image" />
        <div class="content-text">
            <asp:PlaceHolder ID="LoggedInContent" runat="server" Visible="false">
                <h2>Welcome back, <asp:Literal ID="litUsername" runat="server"></asp:Literal>!</h2>
                <p>You are now logged in. You can start managing your tasks here:</p>
                <div class="btn-container">
                    <a href="AddTask.aspx">Add New Task</a>
                    <a href="Tasks.aspx">View My Tasks</a>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="LoggedOutContent" runat="server" Visible="false">
                <h2>Welcome to MyTask!</h2>
                <p>
                    This website allows you to manage and organize your tasks efficiently.
                    Please login or register to start managing your tasks.
                </p>
                <div class="btn-container">
                    <a href="Login.aspx" class="btn btn-login">Login</a>
                    <a href="Register.aspx" class="btn btn-register">Register</a>
                </div>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
