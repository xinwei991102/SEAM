<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAllOrders.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewAllOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modal-container row">
        <h1 class="whiteText">All Orders</h1>
        <p class="whiteText">Please select an order to view.</p>
        <hr class="modal-hr">

        <h2 class="whiteText">Options</h2>
        <label class="whiteText"><b>Status</b></label><br />
        <label class=" myCheckbox">
            <asp:CheckBox ID="chkPending" runat="server" Checked />Pending
        </label>
        <label class=" myCheckbox">
            <asp:CheckBox ID="chkConfirmed" runat="server" Checked />Confirmed
        </label>
        <label class=" myCheckbox ">
            <asp:CheckBox ID="chkCanceled" runat="server" Checked />Canceled
        </label>
        <br />
        <label class="whiteText"><b>Date</b></label>
        <asp:TextBox ID="txtDate" runat="server" class="modalInput" type="text" placeholder="Enter date (dd/mm/yyyy)"></asp:TextBox>


        <label class="whiteText"><b>Staff</b></label>
        <asp:TextBox ID="txtStaff" runat="server" class="modalInput" type="text" placeholder="Enter staff name"></asp:TextBox>

        <label class="whiteText"><b>Customer</b></label>
        <asp:TextBox ID="txtCustName" runat="server" class="modalInput" type="text" placeholder="Enter customer name"></asp:TextBox>

        <div class="clearfix">

            <asp:Button ID="btnSearch" runat="server" Text="Search Order" class="signupbtn modal-button" OnClick="btnSearch_Click" />
            <asp:Button ID="btnAdd" type="button" UseSubmitBehavior="false" runat="server" OnClick="btnAdd_Click" Text="Add Order" class="cancelbtn modal-button" Style="background-color: dodgerblue" />

        </div>

        <hr class="modal-hr">

        <asp:GridView ID="gvOrder" CssClass="table " EnableRowCache="true" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvOrder_SelectedIndexChanged" runat="server" AutoGenerateColumns="false" Style="margin-bottom: 0px; text-align: right;">
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
                <asp:TemplateField HeaderText="Amount">

                    <ItemTemplate>
                        <asp:Label Text='<%# decimal.Parse(Eval("total").ToString()).ToString("0.00") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">

                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("order.status") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Staff">

                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("order.staffName") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>





    </div>

    <asp:Button ID="btnViewSalesReport" runat="server" Text="View Sales Report" class="redirectButton" UseSubmitBehavior="false"  OnClick="btnViewSalesReport_Click"/>


    <br />
    <br />
</asp:Content>
