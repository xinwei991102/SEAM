<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SEAMOrderStoreSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Millos Trading's</h1>
        <h1>Ordering and Store System</h1>
        <p class="lead">123, Hill Street, 31000 Perak, Malaysia.</p>
        <p class="lead">Tel: 605-5342353 Fax:605-5342352</p>
        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Order System</h2>
            <p>
                Create and manage daily order.
            </p>
            <p>
                <a class="btn btn-default" href="ViewAllOrders.aspx">View Order</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Store System</h2>
            <p>
                Add and manage inventory products.
            </p>
            <p>
                <a class="btn btn-default" href="">View Store</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Staff System</h2>
            <p>
                view and manage employees of the company.
            </p>
            <p>
                <a class="btn btn-default" href="">View Staff</a>
            </p>
        </div>
    </div>

    

</asp:Content>
