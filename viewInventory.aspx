<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewInventory.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Manage Inventory</li>
            </ol>
        </nav>
        <hr />
    </div>
    <h1 class="text-center">Manage Inventory</h1>
    <hr />

    <div class="container">
        <h4 class="mb-2">Search by </h4>
        <div class="row">
            <div class="col-lg-auto border-right">
                <label style="font-weight: 500">Status </label>
                <br />
                <asp:CheckBox ID="chkAvailable" runat="server" Checked="true" />
                <label>Available</label>
                <asp:CheckBox ID="chkDiscontinued" runat="server" Checked="true" />
                <label>Discontinued</label>
            </div>
            <div class="col-lg border-right">
                <label style="font-weight: 500">Location </label>
                <br />
                <asp:TextBox ID="txtLocation" CssClass="form-control" Style="width: 100%;" runat="server" class="modalInput" type="text" placeholder="Enter location"></asp:TextBox>
            </div>
            <div class="col-lg border-right">
                <label style="font-weight: 500">Keyword </label>
                <br />
                <asp:TextBox ID="txtSearch" CssClass="form-control" Style="width: 100%;" runat="server" class="modalInput" type="text" placeholder="Enter keyword"></asp:TextBox>
            </div>
            <div class="col-lg-1 pr-0">
                <br />
                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" Style="width: 100%;" />
            </div>
            <div class="col-lg-1 pl-1">
                <br />
                <a href="ViewInventory.aspx" class="btn btn-secondary" style="width:100%;">Reset</a>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <hr>
                <asp:GridView ID="gvProducts" CssClass="mb-3" Font-Size="small" EnableRowCache="true" OnSelectedIndexChanged="gvProducts_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" CellPadding="2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("id") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("name") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price (RM)">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("price", "{0:0.00}").ToString() %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("category") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Manufacturer">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("manufacturer") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supplier">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("supplier") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("description") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("comment") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Location">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("location") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stock">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("stock") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reorder Level">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("reorderLevel") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Target Stock">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("targetStock") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("status") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="Edit Product" ShowSelectButton="True" ButtonType="Button" />
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
            </div>
        </div>

        <div class="row">
            <div class="col">
                <asp:Button ID="btnAdd" type="button" UseSubmitBehavior="false" runat="server" OnClick="btnAdd_Click" Text="Add Product" class="btn btn-primary" Style="width: 100%;" />
            </div>
        </div>
    </div>
</asp:Content>
