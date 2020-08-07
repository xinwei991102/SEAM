<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="SEAMOrderStoreSystem.AddOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="divPopup" runat="server" class="pop-container">

        <div class="screen-cover">
        </div>
        <div class="popup">
            <h2>Your order has been recorded.</h2><br />

            
            <asp:Button ID="btnViewOrder2" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="View Your Order" OnClick="btnViewOrder2_Click" />

            
        </div>
    </div>


    <div class="modal-container row">

        
       

        <hr class="modal-hr">

        <h1 class="whiteText">Add Order</h1>
        <p class="whiteText">Please fill in this form to add an order.</p>
        <hr class="modal-hr">

        <h2 class="whiteText">Order Info</h2>
        <label class="whiteText"><b>Order ID</b></label>
        <asp:TextBox ID="txtOrderID" runat="server" class="modalInput" type="text"  required="true" ReadOnly></asp:TextBox>

        <label class="whiteText"><b>Date</b></label>
        <asp:TextBox ID="txtDate" runat="server" class="modalInput" type="text"  required="true" ReadOnly></asp:TextBox>


        <label class="whiteText"><b>Sales Person</b></label>
        <asp:DropDownList ID="ddlStaff" runat="server"></asp:DropDownList>

        <hr class="modal-hr">

        <h2 class="whiteText">Customer Info</h2>

        <label class="whiteText"><b>Name</b></label>
        <asp:TextBox ID="txtCustName" runat="server" class="modalInput" type="text" placeholder="Enter name" required="true"></asp:TextBox>

        <label class="whiteText"><b>Email</b></label>
        <asp:TextBox ID="txtCustEmail" runat="server" class="modalInput" type="text" placeholder="Enter email" required="true"></asp:TextBox>

        <label class="whiteText"><b>Address</b></label>
        <asp:TextBox ID="txtCustAddress" runat="server" class="modalInput" type="text" placeholder="Enter address" required="true"></asp:TextBox>

        <hr class="modal-hr">

        <h2 class="whiteText">Order Details</h2>

        <div class="row">
            <asp:GridView ID="gvOrderQTY" CssClass="table product-table" runat="server" AutoGenerateColumns="false" Style="margin-bottom: 0px;">
                <Columns>
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Price">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div style="width: 100%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="product-table">
                    <tr>
                        <td>
                            <asp:TextBox ID="txtNo" runat="server" Text="*" ReadOnly />
                        </td>
                        <td>

                            <asp:DropDownList ID="ddlProduct" runat="server" Style="height: 40px" onchange="return SelectProd();"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQTY" runat="server" Text="" type="number" onchange="return CalcTotal();" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtUnitPrice" runat="server" Text="" ReadOnly />
                        </td>
                        <td>
                            <asp:TextBox ID="txtDiscount" runat="server" Text="" type="number" step="0.1" onchange="return CalcTotal();" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotal" runat="server" Text="" ReadOnly />
                        </td>

                    </tr>
                </table>
            </div>
            <asp:Button ID="btnAdd" CssClass="btn btn-secondary" runat="server" UseSubmitBehavior="false" Text="Add" OnClientClick="return AddRow()" Style="float: right" />
            <asp:Label ID="lblTotal" runat="server" style="float:right" Text="0.00"></asp:Label>
            <asp:Label ID="label2" runat="server" style="float:right" Text="Total : "></asp:Label>
            <br />

        </div>









        <div class="row">
            <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        </div>


        <div class="clearfix">

            <asp:Button ID="btnAddOrder" runat="server" Text="Add Order" class="signupbtn modal-button" OnClick="btnAddOrder_Click" />
            <asp:Button ID="btnCancel" type="button" UseSubmitBehavior="false" runat="server" Text="Cancel" class="cancelbtn modal-button" OnClick="btnCancel_Click"/>

        </div>
        <asp:Button ID="btnViewOrder" runat="server" Text="View Order" class="redirectButton" UseSubmitBehavior="false" OnClick="btnViewOrder_Click"/>




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
