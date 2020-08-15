<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProductDetails.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divPopup" runat="server" visible="false">
        <div class="container p-5 mx-auto rounded border text-center"
            style="z-index: 2100; background-color: white; opacity: 1; position: fixed; width: 400px; left: 50%; transform: translate(-50%, 0); top: 30%;">
            <h4>Your changes has been saved.</h4>
            <br />
            <asp:Button ID="btnViewProd" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="View The Product" OnClick="btnViewProd_Click"/>
        </div>
        <div style="background-color: black; position: fixed; top: 0; bottom: 0; left: 0; right: 0; opacity: 0.8; z-index: 2000;">
        </div>
    </div>

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

    <div class="container">
        <div class="row mb-3">
            <div class="col">
                <label><b>Product ID:</b></label>
                <asp:TextBox runat="server" ID="txtProdID" ReadOnly="true" BorderStyle="None" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Status:</b></label>
                <asp:DropDownList ID="ddlStatus" runat="server" Width="100%" Height="30px">
                    <asp:ListItem Text="Available"></asp:ListItem>
                    <asp:ListItem Text="Discontinued"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col">
                <label><b>Product Name:</b></label>
                <asp:TextBox runat="server" ID="txtProdName" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Product Price:</b></label>
                <asp:TextBox runat="server" ID="txtPrice" TextMode="Number" Width="100%" Step="0.01"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label><b>Category:</b></label>
                <asp:TextBox runat="server" ID="txtCategory" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Manufacturer:</b></label>
                <asp:TextBox runat="server" ID="txtManufacturer" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Supplier:</b></label>
                <asp:TextBox runat="server" ID="txtSupplier" Width="100%"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label><b>Description:</b></label>
                <asp:TextBox runat="server" ID="txtDesc" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Comment:</b></label>
                <asp:TextBox runat="server" ID="txtComment" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Location:</b></label>
                <asp:TextBox runat="server" ID="txtLocation" Width="100%"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label><b>Stock:</b></label>
                <asp:TextBox runat="server" ID="txtStock" TextMode="Number" ReadOnly="true" BorderStyle="None" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Reorder Level:</b></label>
                <asp:TextBox runat="server" ID="txtReorderLv" TextMode="Number" Width="100%"></asp:TextBox>
            </div>
            <div class="col">
                <label><b>Target Stock:</b></label>
                <asp:TextBox runat="server" ID="txtTargetStock" TextMode="Number" Width="100%"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:Button ID="btnEditProduct" runat="server" Style="width: 100%;" class="btn btn-primary" Text="Save Changes" OnClick="btnEditProduct_Click" />
            </div>
            <div class="col">
                <asp:HyperLink runat="server" ID="linkRefresh" CssClass="btn btn-secondary" Style="width: 100%;">Reset</asp:HyperLink>
            </div>
        </div>
    </div>
    <hr />

    <h4>Stock In</h4>
    <label>Stock In Amount:</label>
    <asp:TextBox runat="server" ID="txtStockIn" TextMode="Number"></asp:TextBox>
    <asp:Button runat="server" ID="btnStockIn" Text="Confirm" OnClick="btnStockIn_Click" class="btn btn-primary" />
    <hr />
    <h4>Transaction History</h4>
    <asp:GridView ID="gvTransactions" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="No." HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label Text='<%# Container.DataItemIndex+1 %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock In Date" HeaderStyle-Width="40%" ItemStyle-Width="40%">
                <ItemTemplate>
                    <asp:Label Text='<%# ((DateTime)Eval("stockInDate")).ToShortDateString() %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock In Amount" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("stockInAmount") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount After Restock" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("amountAfterRestock") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
