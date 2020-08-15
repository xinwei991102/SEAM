<%@ Page Title="Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAllStaff.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewAllStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Manage Staff</li>
            </ol>
        </nav>
        <hr />
    </div>
    <h1 class="text-center">Manage Staff</h1>
    <hr />

    <div class="container">
        <h4 class="mb-2">Search by </h4>
        <div class="row">
            <div class="col-lg border-right">
                <label style="font-weight: 500">Role </label>
                <br />
                <asp:CheckBox ID="chkManager" runat="server" Checked="true" />
                <label class="mr-2">Manager</label>
                <asp:CheckBox ID="chkGeneral" runat="server" Checked="true" />
                <label class="mr-2">General Staff</label>
                <asp:CheckBox ID="chkInventory" runat="server" Checked="true" />
                <label>Inventory Clerk</label>
                <asp:CheckBox ID="chkSalesman" runat="server" Checked="true" />
                <label>Salesman</label>
            </div>
            <div class="col-lg border-right">
                <label style="font-weight: 500">Name </label>
                <br />
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" type="text" placeholder="Enter name"></asp:TextBox>
            </div>
            <div class="col-lg-1 pr-0">
                <br />
                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" Style="width: 100%;" />
            </div>
            <div class="col-lg-1 pl-1">
                <br />
                <a href="ViewAllStaff.aspx" class="btn btn-secondary" style="width:100%;">Reset</a>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <hr>
                <asp:GridView ID="gvStaff" CssClass="table" EnableRowCache="true" OnSelectedIndexChanged="gvStaff_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <asp:Label Text='<%# Container.DataItemIndex+1 %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("email") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("name") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("role") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="Edit Staff" ShowSelectButton="True" ButtonType="Button" />
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
                <asp:Button ID="btnAdd" type="button" UseSubmitBehavior="false" runat="server" OnClick="btnAdd_Click" Text="Add Staff" class="btn btn-primary" Style="width: 100%;" />
            </div>
        </div>
    </div>
</asp:Content>
