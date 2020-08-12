<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewOrderDetails.aspx.cs" Inherits="SEAMOrderStoreSystem.ViewOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divPopup" runat="server" class="pop-container">

        <div class="screen-cover">
        </div>
        <div class="popup">
            <h2>Your order has been edited.</h2>
            <br />


            <asp:Button ID="btnRefresh" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" Text="View Your Order" OnClick="btnRefresh_Click" />


        </div>
    </div>

    <h1 class="whiteText">View Order</h1>
    <p class="whiteText">Order details of your order.</p>
    <hr class="modal-hr">

    <h2 class="whiteText">Order Info</h2>
    <label class="whiteText"><b>Order ID</b></label>
    <asp:TextBox ID="txtOrderID" runat="server" class="modalInput" type="text" required="true" ReadOnly></asp:TextBox>

    <label class="whiteText"><b>Date</b></label>
    <asp:TextBox ID="txtDate" runat="server" class="modalInput" type="text" required="true" ReadOnly></asp:TextBox>


    <label class="whiteText"><b>Staff</b></label>
    <asp:TextBox ID="txtStaff" runat="server" class="modalInput" type="text" required="true" ReadOnly></asp:TextBox>

    <label class="whiteText"><b>Status</b></label>
    <asp:DropDownList ID="ddlStatus" runat="server">
        <asp:ListItem Text="Pending"></asp:ListItem>
        <asp:ListItem Text="Confirmed"></asp:ListItem>
        <asp:ListItem Text="Canceled"></asp:ListItem>
    </asp:DropDownList>

    <hr class="modal-hr">


    <h2 class="whiteText">Customer Info</h2>

    <label class="whiteText"><b>Name</b></label>
    <asp:TextBox ID="txtCustName" runat="server" class="modalInput" type="text" placeholder="Enter name" required="true"></asp:TextBox>

    <label class="whiteText"><b>Email</b></label>
    <asp:TextBox ID="txtCustEmail" runat="server" class="modalInput" type="text" placeholder="Enter email" required="true"></asp:TextBox>

    <label class="whiteText"><b>Address</b></label>
    <asp:TextBox ID="txtCustAddress" runat="server" class="modalInput" type="text" placeholder="Enter address" required="true"></asp:TextBox>

    <hr>

    <h2 class="whiteText">Order Details</h2>


    <asp:GridView ID="gvOrderQTY" CssClass="table product-table" EnableRowCache="true" runat="server" AutoGenerateColumns="false" Style="margin-bottom: 0px;">
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("num") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("prod") %>' runat="server"></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">

                <ItemTemplate>
                    <asp:TextBox ID="txtEditQTY" runat="server" Text='<%# Eval("qty") %>' type="number" step="1" required onchange="return CalcTotal();" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price">
                <ItemTemplate>
                    <asp:Label Text='<%# decimal.Parse(Eval("price").ToString()).ToString("0.00") %>' runat="server"></asp:Label>



                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Discount">

                <ItemTemplate>
                    <asp:TextBox ID="txtEditDiscount" runat="server" Text='<%# Eval("discount") %>' type="number" step="0.1" required onchange="return CalcTotal();" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <asp:Label Text='<%# decimal.Parse(Eval("total").ToString()).ToString("0.00") %>' runat="server"></asp:Label>


                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblTotal" runat="server" Style="float: right"></asp:Label>

    <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>

    <div class="clearfix">

        <asp:Button ID="btnEditOrder" runat="server" Text="Edit Order" class="signupbtn modal-button" OnClick="btnEditOrder_Click" />
        <asp:Button ID="btnCancel" type="button" UseSubmitBehavior="false" runat="server" Text="Cancel" class="cancelbtn modal-button" OnClick="btnCancel_Click" />

    </div>
    <asp:Button ID="btnViewOrder" runat="server" Text="View Order" class="redirectButton" UseSubmitBehavior="false" OnClick="btnViewOrder_Click" />
    <asp:Button ID="btnCreatePDF" runat="server" Text="Generate PDF" class="redirectButton" UseSubmitBehavior="false" OnClick="btnCreatePDF_Click" />



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
