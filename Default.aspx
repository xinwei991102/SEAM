<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SEAMOrderStoreSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style=" background-color:transparent;">
                <li class="breadcrumb-item active" aria-current="page">Home</li>
            </ol>
        </nav>
        <hr />
    </div>
    <h1 class="text-center mb-4">Millos Trading Order and Store System</h1>
    <hr />
    <div class="row text-center">
        <div class="col-md border rounded p-4 mx-2" runat="server" id="OrderLink">
            <h2>Order Sub-system</h2>
            <p>
                Create and manage daily orders.
            </p>
            <p>
                <a class="btn btn-primary" href="ViewAllOrders.aspx">View Orders</a>
            </p>
        </div>
        <div class="col-md border rounded p-4 mx-2" runat="server" id="InventoryLink">
            <h2>Store Sub-system</h2>
            <p>
                Manage inventory products.
            </p>
            <p>
                <a class="btn btn-primary" href="ViewInventory.aspx">View Inventory</a>
            </p>
        </div>
        <div class="col-md border rounded p-4 mx-2" runat="server" id="StaffLink">
            <h2>Staff Sub-system</h2>
            <p>
                Manage staff information.
            </p>
            <p>
                <a class="btn btn-primary" href="ViewAllStaff.aspx">View Staff</a>
            </p>
        </div>
        <div class="col-md border rounded p-4 mx-2" runat="server" id="LoginLink">
            <h2>Log In</h2>
            <p>
                Please log in to use the order and store system.
            </p>
            <p>
                <a class="btn btn-primary" href="Log In.aspx">Log In</a>
            </p>
        </div>
    </div>
</asp:Content>
