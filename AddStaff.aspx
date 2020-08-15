<%@ Page Title="Add Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="SEAMOrderStoreSystem.AddStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divPopup" runat="server" visible="false">
        <div class="container p-5 mx-auto rounded border text-center"
            style="z-index: 2100; background-color: white; opacity: 1; position: fixed; width: 400px; left: 50%; transform: translate(-50%, 0); top: 30%;">
            <h4>The staff has been added.</h4>
            <br />
            <asp:Button ID="btnViewStaff" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="View The Staff" OnClick="btnViewStaff_Click" />
        </div>
        <div style="background-color: black; position: fixed; top: 0; bottom: 0; left: 0; right: 0; opacity: 0.8; z-index: 2000;">
        </div>
    </div>

    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="ViewAllStaff.aspx">Manage Staff</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add Staff</li>
            </ol>
        </nav>
        <hr />
    </div>

    <h1 class="text-center">Add Staff</h1>
    <hr>

    <label><b>Role:</b></label>
    <asp:DropDownList ID="ddlRole" runat="server" Width="100%" Height="30px" Required="true" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
        <asp:ListItem Text="General Staff" Value="General Staff"></asp:ListItem>
        <asp:ListItem Text="Inventory Clerk" Value="Inventory Clerk"></asp:ListItem>
        <asp:ListItem Text="Salesman" Value="Salesman"></asp:ListItem>
    </asp:DropDownList>

    <label class="mt-3"><b>Email:</b></label>
    <asp:TextBox runat="server" ID="txtEmail" Width="100%" Required="true"></asp:TextBox>

    <label class="mt-3"><b>Name:</b></label>
    <asp:TextBox runat="server" ID="txtName" Width="100%" Required="true"></asp:TextBox>

    <div id="divPassword" runat="server">
        <label class="mt-3"><b>Password:</b></label>
        <asp:TextBox TextMode="Password" runat="server" ID="txtPassword" Width="100%" Required="true"></asp:TextBox>
    </div>

    <div class="row mt-3">
        <div class="col">
            <asp:Button ID="btnAddStaff" runat="server" Style="width: 100%;" class="btn btn-primary" Text="Save This Staff" OnClick="btnAddStaff_Click" />
        </div>
        <div class="col">
            <asp:Button ID="btnReset" type="button" UseSubmitBehavior="false" runat="server" Text="Clear Fields" Style="width: 100%;" class="btn btn-danger" OnClick="btnReset_Click" />
        </div>
        <div class="col">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel Add Staff" Style="width: 100%;" class="btn btn-secondary" UseSubmitBehavior="false" OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>
