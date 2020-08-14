<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProductDetails.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="ViewInventory.aspx">Manage Inventory</a></li>
                <li class="breadcrumb-item active" aria-current="page">Product Details</li>
            </ol>
        </nav>
        <hr />
    </div>

    <h1 class="text-center">Product Details</h1>
    <hr>
    <asp:TextBox runat="server" ID="txtTest"></asp:TextBox>
</asp:Content>
