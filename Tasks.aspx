<%@ Page Title="View Tasks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="MyTask.Tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .content-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        select, .gridview {
            width: 100%;
            margin-bottom: 20px;
        }

        select {
            padding: 8px;
            font-size: 16px;
        }

        .gridview {
            border-collapse: collapse;
        }

        .gridview th, .gridview td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        .gridview th {
            background-color: #007bff;
            color: white;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>

    <div class="content-container">
        <h2>Your Tasks</h2>

        <!-- Filter Dropdown -->
        <label for="ddlTaskStatus">Select Task Status:</label>
        <asp:DropDownList ID="ddlTaskStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTaskStatus_SelectedIndexChanged">
            <asp:ListItem Value="All" Text="All" />
            <asp:ListItem Value="Completed" Text="Completed" />
            <asp:ListItem Value="Pending" Text="Pending" />
        </asp:DropDownList>

        <!-- Tasks GridView -->
        <asp:GridView ID="gvTasks" runat="server" CssClass="gridview" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="DueTime" HeaderText="DueTime" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
