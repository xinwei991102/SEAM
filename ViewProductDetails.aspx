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
    <asp:TextBox runat="server" ID="txtProdID" ReadOnly="true"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtProdName"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtPrice"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtCategory"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtManufacturer"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtSupplier"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtDesc"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtComment"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtLocation"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtStock"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtReorderLv"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtTargetStock"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtStatus"></asp:TextBox>
    <asp:GridView ID="gvTransactions" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvTransactions_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="No." HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label Text='<%# Container.DataItemIndex+1 %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock In Date" HeaderStyle-Width="40%" ItemStyle-Width="40%">
                <ItemTemplate>
                    <asp:Label Text='<%# ((DateTime)Eval("date")).ToShortDateString() %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock In Amount" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("stockInAmount") %>'/>
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
