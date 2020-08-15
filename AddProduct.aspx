<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="SEAMOrderStoreSystem.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divPopup" runat="server" visible="false">
        <div class="container p-5 mx-auto rounded border text-center"
            style="z-index: 2100; background-color: white; opacity: 1; position: fixed; width: 400px; left: 50%; transform: translate(-50%, 0); top: 30%;">
            <h4>The product has been added.</h4>
            <br />
            <asp:Button ID="btnViewProd" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="View The Product" OnClick="btnViewProd_Click" />
        </div>
        <div style="background-color: black; position: fixed; top: 0; bottom: 0; left: 0; right: 0; opacity: 0.8; z-index: 2000;">
        </div>
    </div>

    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="ViewInventory.aspx">Manage Inventory</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add Product</li>
            </ol>
        </nav>
        <hr />
    </div>

    <h1 class="text-center">Add Product</h1>
    <hr>

    <div class="container">
        <div class="row mb-3">
            <div class="col">
                <label><b>Product ID:</b></label>
                <asp:TextBox runat="server" ID="txtProdID" ReadOnly="true" BorderStyle="None" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Status:</b></label>
                <asp:DropDownList ID="ddlStatus" runat="server" Width="100%" Height="30px" Required="true">
                    <asp:ListItem Text="Available"></asp:ListItem>
                    <asp:ListItem Text="Discontinued"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col">
                <label><b>Product Name:</b></label>
                <asp:TextBox runat="server" ID="txtProdName" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Product Price:</b></label>
                <asp:TextBox runat="server" ID="txtPrice" TextMode="Number" Width="100%" Step="0.01" Required="true"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label><b>Category:</b></label>
                <asp:TextBox runat="server" ID="txtCategory" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Manufacturer:</b></label>
                <asp:TextBox runat="server" ID="txtManufacturer" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Supplier:</b></label>
                <asp:TextBox runat="server" ID="txtSupplier" Width="100%" Required="true"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label><b>Description:</b></label>
                <asp:TextBox runat="server" ID="txtDesc" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Comment:</b></label>
                <asp:TextBox runat="server" ID="txtComment" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Location:</b></label>
                <asp:TextBox runat="server" ID="txtLocation" Width="100%" Required="true"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label><b>Stock:</b></label>
                <asp:TextBox runat="server" ID="txtStock" TextMode="Number" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Reorder Level:</b></label>
                <asp:TextBox runat="server" ID="txtReorderLv" TextMode="Number" Width="100%" Required="true"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Target Stock:</b></label>
                <asp:TextBox runat="server" ID="txtTargetStock" TextMode="Number" Width="100%" Required="true"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:Button ID="btnAddProduct" runat="server" Style="width: 100%;" class="btn btn-primary" Text="Save This Product" OnClick="btnAddProduct_Click" />
            </div>
            <div class="col">
                <asp:Button ID="btnReset" type="button" UseSubmitBehavior="false" runat="server" Text="Clear Fields" style="width: 100%;" class="btn btn-danger" OnClick="btnReset_Click" />
            </div>
            <div class="col">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Add Product" style="width: 100%;" class="btn btn-secondary" UseSubmitBehavior="false" OnClick="btnCancel_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
