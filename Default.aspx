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
    <h1 class="text-center mb-4">Alimama Sdn Bhd Order and Store System</h1>

    <div class="row text-center">
        <div class="col-md border rounded p-4 mx-2">
            <h2>Order Sub-system</h2>
            <p>
                Create and manage daily orders.
           
            </p>
            <p>
                <a class="btn btn-primary" href="ViewAllOrders.aspx">View Orders</a>
            </p>
        </div>
        <div class="col-md border rounded p-4 mx-2">
            <h2>Store Sub-system</h2>
            <p>
                Manage inventory products.
           
            </p>
            <p>
                <a class="btn btn-primary" href="ViewInventory.aspx">View Inventory</a>
            </p>
        </div>
        <div class="col-md border rounded p-4 mx-2">
            <h2>Staff Sub-system</h2>
            <p>
                Manage staff information.
           
            </p>
            <p>
                <a class="btn btn-primary" href="ViewAllStaff.aspx">View Staff</a>
            </p>
        </div>
    </div>



</asp:Content>
