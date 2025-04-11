<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTask.aspx.cs" Inherits="MyTask.AddTask" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Navbar styling */
        .navbar {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo a {
            color: white;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
        }

        .navbar .logo a:hover {
            text-decoration: underline;
        }

        .navbar .menu a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 18px;
        }

        .navbar .menu a:hover {
            text-decoration: underline;
        }

        /* Footer styling */
        footer {
            background-color: #f8f9fa;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
            color: #6c757d;
        }

        /* Content layout */
        .content {
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        /* Table styling */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .table th {
            background-color: #f4f4f4;
            color: #333;
        }

        .table td {
            vertical-align: middle;
        }

        /* Buttons styling */
        .btn {
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            color: #fff;
            text-align: center;
            display: inline-block;
        }

        .btn-green {
            background-color: #28a745;
        }

        .btn-red {
            background-color: #dc3545;
        }

        .btn-green:hover {
            background-color: #218838;
        }

        .btn-red:hover {
            background-color: #c82333;
        }

        /* Task row colors */
        .overdue {
            background-color: #f8d7da !important; /* Red highlight for overdue tasks */
        }

        .completed {
            background-color: #d4edda !important; /* Green highlight for completed tasks */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <div class="navbar">
            <div class="logo">
                <a href="Tasks.aspx">MyTask</a>
            </div>
            <div class="menu">
                <a href="Home.aspx">Home</a>
                <a href="AddTask.aspx">Add Task</a>
                <a href="Logout.aspx">Logout</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Your Tasks</h2>
            <asp:GridView ID="gvTasks" runat="server" AutoGenerateColumns="False" CssClass="table"
                OnRowCommand="gvTasks_RowCommand" OnRowDataBound="gvTasks_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="DueTime" HeaderText="Due Time" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnComplete" runat="server" CommandName="CompleteTask" CommandArgument='<%# Eval("ID") %>'
                                Text="Complete" CssClass="btn btn-green" />
                            <asp:Button ID="btnRemove" runat="server" CommandName="RemoveTask" CommandArgument='<%# Eval("ID") %>'
                                Text="Remove" CssClass="btn btn-red" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <h2>Add New Task</h2>
            <div>
                <label for="txtTaskTitle">Task Title:</label>
                <asp:TextBox ID="txtTaskTitle" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtTaskDescription">Description:</label>
                <asp:TextBox ID="txtTaskDescription" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtDueTime">Due Time:</label>
                <asp:TextBox ID="txtDueTime" runat="server" Placeholder="yyyy-MM-dd HH:mm"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnAddTask" runat="server" Text="Add Task" OnClick="btnAddTask_Click" />
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <p>© 2025 MyTask. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>
