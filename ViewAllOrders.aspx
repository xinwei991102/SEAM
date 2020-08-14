<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAllOrders.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewAllOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Manage Orders</li>
            </ol>
        </nav>
        <hr />
    </div>
    <h1 class="text-center">Manage Orders</h1>
    <hr />

    <div class="container">
        <h4 class="mb-2">Search by </h4>
        <div class="row">
            <div class="col-lg border-right">
                <label style="font-weight: 500">Status </label>
                <br />
                <asp:CheckBox ID="chkPending" runat="server" Checked="true" />
                <label class="mr-2">Pending</label>
                <asp:CheckBox ID="chkConfirmed" runat="server" Checked="true" />
                <label class="mr-2">Confirmed</label>
                <asp:CheckBox ID="chkCanceled" runat="server" Checked="true" />
                <label>Canceled</label>
            </div>
            <div class="col-lg border-right">
                <label style="font-weight: 500">Date </label>
                <br />
                <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" class="modalInput" type="text" placeholder="Enter date (dd/mm/yyyy)"></asp:TextBox>
            </div>
            <div class="col-lg border-right">
                <label style="font-weight: 500">Salesman </label>
                <br />
                <asp:TextBox ID="txtStaff" CssClass="form-control" runat="server" class="modalInput" type="text" placeholder="Enter salesman name"></asp:TextBox>
            </div>
            <div class="col-lg border-right">
                <label style="font-weight: 500">Customer </label>
                <br />
                <asp:TextBox ID="txtCustName" CssClass="form-control" runat="server" class="modalInput" type="text" placeholder="Enter customer name"></asp:TextBox>
            </div>
            <div class="col-lg-1 pr-0">
                <br />
                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" Style="width: 100%;" />
            </div>
            <div class="col-lg-1 pl-1">
                <br />
                <a href="ViewAllOrders.aspx" class="btn btn-secondary" style="width:100%;">Reset</a>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <hr>
                <asp:GridView ID="gvOrder" CssClass="table" EnableRowCache="true" OnSelectedIndexChanged="gvOrder_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("order.id") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label Text='<%# ((DateTime)Eval("order.date")).ToShortDateString() %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Customer">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("order.custName") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total (RM)">
                            <ItemTemplate>
                                <asp:Label Text='<%# decimal.Parse(Eval("total").ToString()).ToString("0.00") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("order.status") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salesman">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("order.salesmanName") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="Edit Order" ShowSelectButton="True" ButtonType="Button" />
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
                <asp:Button ID="btnAdd" type="button" UseSubmitBehavior="false" runat="server" OnClick="btnAdd_Click" Text="Create Order" class="btn btn-primary" Style="width: 100%;" />
            </div>
            <div class="col">
                <asp:Button ID="btnViewSalesReport" runat="server" Text="View Sales Report" UseSubmitBehavior="false" OnClick="btnViewSalesReport_Click" class="btn btn-secondary" Style="width: 100%;" />
            </div>
        </div>
    </div>
</asp:Content>
