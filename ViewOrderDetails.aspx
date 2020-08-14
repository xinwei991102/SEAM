<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewOrderDetails.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="divPopup" runat="server">
        <div class="container p-5 mx-auto rounded border text-center"
            style="z-index: 2100; background-color: white; opacity: 1; position: fixed; width: 400px; left: 50%; transform: translate(-50%, 0); top: 30%;">
            <h4>Your order has been edited.</h4>
            <br />
            <asp:Button ID="btnRefresh" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="View Updated Order" OnClick="btnRefresh_Click" />
        </div>
        <div style="background-color: black; position: fixed; top: 0; bottom: 0; left: 0; right: 0; opacity: 0.8; z-index: 2000;">
        </div>
    </div>
    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="ViewAllOrders.aspx">Manage Orders</a></li>
                <li class="breadcrumb-item active" aria-current="page">Order Details</li>
            </ol>
        </nav>
        <hr />
    </div>

    <h1 class="text-center">View Order Details</h1>
    <hr>

    <h4>Order Info</h4>
    <label><b>Order ID: </b></label>
    <asp:TextBox ID="txtOrderID" runat="server" class="modalInput" type="text" required="true" ReadOnly="true" BorderStyle="None"></asp:TextBox>

    <label><b>Date: </b></label>
    <asp:TextBox ID="txtDate" runat="server" class="modalInput" type="text" required="true" ReadOnly="true" BorderStyle="None"></asp:TextBox>

    <label><b>Salesman: </b></label>
    <asp:TextBox ID="txtStaff" runat="server" class="modalInput" type="text" required="true" ReadOnly="true" BorderStyle="None"></asp:TextBox>

    <label><b>Status: </b></label>
    <asp:DropDownList ID="ddlStatus" runat="server">
        <asp:ListItem Text="Pending"></asp:ListItem>
        <asp:ListItem Text="Confirmed"></asp:ListItem>
        <asp:ListItem Text="Canceled"></asp:ListItem>
    </asp:DropDownList>

    <hr class="modal-hr">


    <h4>Customer Info</h4>

    <label><b>Name: </b></label>
    <asp:TextBox ID="txtCustName" runat="server" class="modalInput" type="text" placeholder="Enter name" required="true"></asp:TextBox>

    <label class="ml-3"><b>Email: </b></label>
    <asp:TextBox ID="txtCustEmail" runat="server" class="modalInput" type="text" placeholder="Enter email" required="true"></asp:TextBox>

    <label class="ml-3"><b>Address: </b></label>
    <asp:TextBox ID="txtCustAddress" runat="server" class="modalInput" type="text" placeholder="Enter address" required="true"></asp:TextBox>

    <hr>

    <h4>Order Items</h4>


    <asp:GridView ID="gvOrderQTY" CssClass="table" EnableRowCache="true" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 0px;" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="No." HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("num") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product" HeaderStyle-Width="40%" ItemStyle-Width="40%">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("prod") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                <ItemTemplate>
                    <asp:TextBox ID="txtEditQTY" runat="server" Text='<%# Eval("qty") %>' type="number" step="1" required="true" onchange="return CalcTotal();" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price (RM)" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                <ItemTemplate>
                    <asp:Label Text='<%# decimal.Parse(Eval("price").ToString()).ToString("0.00") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Discount" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                <ItemTemplate>
                    <asp:TextBox ID="txtEditDiscount" runat="server" Text='<%# Eval("discount") %>' type="number" step="0.1" required="true" onchange="return CalcTotal();" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Subtotal (RM)" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                <ItemTemplate>
                    <asp:Label Text='<%# decimal.Parse(Eval("total").ToString()).ToString("0.00") %>' runat="server"></asp:Label>
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
    <table style="width:100%;">
        <tr>
            <td colspan="5" style="text-align: right; width: 85%;">Total (RM) : </td>
            <td style="text-align:left; width: 15%;"><b><asp:Label ID="lblTotal" runat="server"></asp:Label></b></td>
        </tr>
    </table>
    <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>

    <div class="row mt-2">
        <div class="col">
            <asp:Button ID="btnEditOrder" runat="server" Style="width: 100%;" class="btn btn-primary" Text="Save Changes" OnClick="btnEditOrder_Click" />
        </div>
        <div class="col">
            <asp:Button ID="btnCreatePDF" runat="server" Style="width: 100%;" class="btn btn-secondary" Text="Generate Invoice" UseSubmitBehavior="false" OnClick="btnCreatePDF_Click" />
        </div>
        <div class="col">
            <asp:Button ID="btnCreateDO" runat="server" Style="width: 100%;" class="btn btn-secondary" Text="Generate Delivery Order" UseSubmitBehavior="false" OnClick="btnCreateDO_Click" />
        </div>
    </div>

    <script type="text/javascript">
        function CalcTotal() {
            var gridView = document.getElementById("<%=gvOrderQTY.ClientID %>");

            //Reference the TBODY tag.
            var tbody = gridView.getElementsByTagName("tbody")[0];

            //Reference the first row.
            var i;
            var ttotal = 0;
            for (i = 1; i < tbody.rows.length; i++) {
                var row = tbody.getElementsByTagName("tr")[i];
                var qty = row.cells[2].getElementsByTagName("input")[0].value;
                var price = row.cells[3].getElementsByTagName("span")[0].innerHTML;
                var discount = row.cells[4].getElementsByTagName("input")[0].value;
                var total = qty * price * (1 - discount);

                ttotal += total;
                row.cells[5].getElementsByTagName("span")[0].innerHTML = (Math.round(total * 100) / 100).toFixed(2);
            }

            document.getElementById("<%=lblTotal.ClientID%>").innerHTML = "Total : " + (Math.round(ttotal * 100) / 100).toFixed(2);


        }
    </script>
</asp:Content>
