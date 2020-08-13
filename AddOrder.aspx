<%@ Page Title="Add Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="SEAMOrderStoreSystem.AddOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divPopup" runat="server">
        <div class="container p-5 mx-auto rounded border text-center"
            style="z-index: 2100; background-color: white; opacity: 1; position: fixed; width: 400px; left: 50%; transform: translate(-50%, 0); top: 30%;">
            <h4>Your order has been recorded.</h4>
            <br />
            <asp:Button ID="btnRefresh" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="View Your Order" OnClick="btnViewOrder2_Click" />
        </div>
        <div style="background-color: black; position: fixed; top: 0; bottom: 0; left: 0; right: 0; opacity: 0.8; z-index: 2000;">
        </div>
    </div>

    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="ViewAllOrders.aspx">Manage Orders</a></li>
                <li class="breadcrumb-item active" aria-current="page">Create Order</li>
            </ol>
        </nav>
        <hr />
    </div>

    <h1 class="text-center">Create Order</h1>
    <hr>
    <div>

        <h4>Order Info</h4>
        <label><b>Order ID: </b></label>
        <asp:TextBox ID="txtOrderID" runat="server" class="modalInput" type="text" required="true" ReadOnly="true" BorderStyle="None"></asp:TextBox>

        <label><b>Date: </b></label>
        <asp:TextBox ID="txtDate" runat="server" class="modalInput" type="text" required="true" ReadOnly="true" BorderStyle="None"></asp:TextBox>

        <label><b>Salesman: </b></label>
        <asp:DropDownList ID="ddlStaff" runat="server"></asp:DropDownList>

        <hr>

        <h4>Customer Info</h4>

        <label><b>Name: </b></label>
        <asp:TextBox ID="txtCustName" runat="server" class="modalInput" type="text" placeholder="Enter name" required="true"></asp:TextBox>

        <label><b>Email: </b></label>
        <asp:TextBox ID="txtCustEmail" runat="server" class="modalInput" type="text" placeholder="Enter email" required="true"></asp:TextBox>

        <label><b>Address: </b></label>
        <asp:TextBox ID="txtCustAddress" runat="server" class="modalInput" type="text" placeholder="Enter address" required="true"></asp:TextBox>

        <hr>

        <h4>Order Items</h4>

        <div>
            <asp:GridView ID="gvOrderQTY" CssClass="table" runat="server" AutoGenerateColumns="False" Style="margin-bottom: 0px; width: 97%;" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="No." HeaderStyle-Width="10%" ItemStyle-Width="10%">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product" HeaderStyle-Width="40%" ItemStyle-Width="40%">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" HeaderStyle-Width="12.5%" ItemStyle-Width="12.5%">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Price" HeaderStyle-Width="12.5%" ItemStyle-Width="12.5%">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount" HeaderStyle-Width="12.5%" ItemStyle-Width="12.5%">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subtotal" HeaderStyle-Width="12.5%" ItemStyle-Width="12.5%">
                        <ItemTemplate>
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
            <div style="width: 100%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="product-table" style="table-layout: fixed">
                    <tr>
                        <td style="width: 10%;">
                            <asp:TextBox ID="txtNo" runat="server" Text="*" ReadOnly Style="height: 40px; width: 100%;" />
                        </td>
                        <td style="width: 40%;">
                            <asp:DropDownList ID="ddlProduct" runat="server" onchange="return SelectProd();" Style="height: 40px; width: 100%;"></asp:DropDownList>
                        </td>
                        <td style="width: 12.5%;">
                            <asp:TextBox ID="txtQTY" runat="server" Text="" type="number" onchange="return CalcTotal();" Style="height: 40px; width: 100%;" />
                        </td>
                        <td style="width: 12.5%;">
                            <asp:TextBox ID="txtUnitPrice" runat="server" Text="" ReadOnly Style="height: 40px; width: 100%;" />
                        </td>
                        <td style="width: 12.5%;">
                            <asp:TextBox ID="txtDiscount" runat="server" Text="" type="number" step="0.1" onchange="return CalcTotal();" Style="height: 40px; width: 100%;" />
                        </td>
                        <td style="width: 12.5%;">
                            <asp:TextBox ID="txtTotal" runat="server" Text="" ReadOnly Style="height: 40px; width: 100%;" />
                        </td>
                        <td style="width: 3%;">
                            <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="+" OnClientClick="return AddRow()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: right;">Total :
                        </td>
                        <td style="text-align: left;">
                            <b>
                                <asp:Label class="ml-2" ID="lblTotal" runat="server" Text="0.00"></asp:Label></b>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div>
            <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        </div>


        <div class="row mt-2">
            <div class="col">
                <asp:Button ID="btnAddOrder" runat="server" Text="Save This Order" style="width: 100%;" class="btn btn-primary" OnClick="btnAddOrder_Click" />
            </div>
            <div class="col">
                <asp:Button ID="btnCancel" type="button" UseSubmitBehavior="false" runat="server" Text="Clear Fields" style="width: 100%;" class="btn btn-danger" OnClick="btnCancel_Click" />
            </div>
            <div class="col">
                <asp:Button ID="btnViewOrder" runat="server" Text="Cancel Create Order" style="width: 100%;" class="btn btn-secondary" UseSubmitBehavior="false" OnClick="btnViewOrder_Click" />
            </div>
        </div>

    </div>

    <script type="text/javascript"> 

        function CalcTotal() {
            var txtUnitPrice = document.getElementById("<%=txtUnitPrice.ClientID %>");
            var txtQTY = document.getElementById("<%=txtQTY.ClientID %>");
            var txtDiscount = document.getElementById("<%=txtDiscount.ClientID %>");
            if (txtQTY.value == "" || txtDiscount.value == "") {
                return;
            }
            var total = txtUnitPrice.value * txtQTY.value * (1 - txtDiscount.value);
            var txtTotal = document.getElementById("<%=txtTotal.ClientID %>");
            txtTotal.value = (Math.round(total * 100) / 100).toFixed(2);
        }

        function SelectProd() {
            var ddlProduct = document.getElementById("<%=ddlProduct.ClientID %>");
            var txtUnitPrice = document.getElementById("<%=txtUnitPrice.ClientID %>");
            var txtQTY = document.getElementById("<%=txtQTY.ClientID %>");
            var txtDiscount = document.getElementById("<%=txtDiscount.ClientID %>");

            txtUnitPrice.value = ddlProduct.options[ddlProduct.selectedIndex].value;
            txtQTY.value = "1";
            txtDiscount.value = "0";
            CalcTotal();
        }

        function AddRow() {
            var lblError = document.getElementById("<%=lblError.ClientID %>");
            var ddlProduct = document.getElementById("<%=ddlProduct.ClientID %>");
            if (ddlProduct.value == "Select") {
                lblError.innerText = "*Product not selected";
                return;
            }
            var txtQTY = document.getElementById("<%=txtQTY.ClientID %>");
            if (txtQTY.value == "") {
                lblError.innerText = "*Product quantity not complete";
                return;
            }
            var txtUnitPrice = document.getElementById("<%=txtUnitPrice.ClientID %>");
            var txtDiscount = document.getElementById("<%=txtDiscount.ClientID %>");
            if (txtDiscount.value == "") {
                lblError.innerText = "*Product discount not complete";
                return;
            }
            var txtTotal = document.getElementById("<%=txtTotal.ClientID %>");

            var lblTotal = document.getElementById("<%= lblTotal.ClientID%>");
            var preTotal = parseFloat(lblTotal.innerText || lblTotal.textContent);
            var smallTotal = parseFloat(txtTotal.value);
            var newTotal = preTotal + smallTotal;
            lblTotal.textContent = (Math.round(newTotal * 100) / 100).toFixed(2);


            //Reference the GridView.
            var gridView = document.getElementById("<%=gvOrderQTY.ClientID %>");

            //Reference the TBODY tag.
            var tbody = gridView.getElementsByTagName("tbody")[0];

            //Reference the first row.
            var row = tbody.getElementsByTagName("tr")[1];

            //Check if row is dummy, if yes then remove.
            if (row.getElementsByTagName("td")[0].innerHTML.replace(/\s/g, '') == "") {
                tbody.removeChild(row);
            }

            //Clone the reference first row.
            row = row.cloneNode(true);

            //Add value to row 


            SetValueDDL(row, 1, "product", ddlProduct);



            SetValue(row, 2, "quantity", txtQTY);


            SetValue(row, 3, "unitPrice", txtUnitPrice);

            SetValue(row, 4, "discount", txtDiscount);

            SetValue(row, 5, "total", txtTotal);



            row.cells[0].innerHTML = tbody.getElementsByTagName("tr").length;
            //Add the row to the GridView.
            tbody.appendChild(row);
            return false;
        };

        function SetValue(row, index, name, textbox) {
            //Reference the Cell and set the value.
            row.cells[index].innerHTML = textbox.value;

            //Create and add a Hidden Field to send value to server.
            var input = document.createElement("input");
            input.type = "hidden";
            input.name = name;
            input.value = textbox.value;
            row.cells[index].appendChild(input);

            //Clear the TextBox.
            textbox.value = "";
        }

        function SetValueDDL(row, index, name, textbox) {
            //Reference the Cell and set the value.
            row.cells[index].innerHTML = textbox.options[textbox.selectedIndex].text;

            //Create and add a Hidden Field to send value to server.
            var input = document.createElement("input");
            input.type = "hidden";
            input.name = name;
            input.value = textbox.options[textbox.selectedIndex].text;
            row.cells[index].appendChild(input);



            //Clear the TextBox.
            textbox.selectedIndex = 0;
        }
    </script>
</asp:Content>
