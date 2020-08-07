<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="SEAMOrderStoreSystem.SalesReport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modal-container row">
        <h1 class="whiteText">Monthly Sales Report</h1>
        <p class="whiteText">Please select the month and year of report.</p>
        <hr class="modal-hr">

        <h2 class="whiteText">Report Range</h2>
        <label class="whiteText"><b>Month</b></label>
        <asp:DropDownList class="modalInput" ID="ddlMonth" runat="server">
            <asp:ListItem Text="January" Value="/1/"></asp:ListItem>
            <asp:ListItem Text="February" Value="/2/"></asp:ListItem>
            <asp:ListItem Text="March" Value="/3/"></asp:ListItem>
            <asp:ListItem Text="April" Value="/4/"></asp:ListItem>
            <asp:ListItem Text="May" Value="/5/"></asp:ListItem>
            <asp:ListItem Text="June" Value="/6/"></asp:ListItem>
            <asp:ListItem Text="July" Value="/7/"></asp:ListItem>
            <asp:ListItem Text="August" Value="/8/"></asp:ListItem>
            <asp:ListItem Text="September" Value="/9/"></asp:ListItem>
            <asp:ListItem Text="October" Value="/10/"></asp:ListItem>
            <asp:ListItem Text="November" Value="/11/"></asp:ListItem>
            <asp:ListItem Text="December" Value="/12/"></asp:ListItem>
        </asp:DropDownList>

        <label class="whiteText"><b>Year</b></label>
        <asp:TextBox ID="txtYear" runat="server" class="modalInput" type="number" required="true" step="1"></asp:TextBox>

        <div class="clearfix">

            <asp:Button ID="btnSearch" runat="server" Text="Generate Report" class="signupbtn modal-button" OnClick="btnSearch_Click" />
            <asp:Button ID="btnCancel" type="button" UseSubmitBehavior="false" runat="server" Text="Cancel" class="cancelbtn modal-button" />

        </div>

        <hr class="modal-hr">

        <div class="row">

            <asp:Chart ID="chtProdSales" runat="server" BackColor="157, 60, 199" BackGradientStyle="LeftRight"
                BorderlineWidth="0" Height="340px" Palette="None" PaletteCustomColors="140, 0, 255"
                Width="1100px" BorderlineColor="236, 3, 252">
                <Series>
                    <asp:Series Name="Series1" YValuesPerPoint="6">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

        </div>

    <br />


        <div class="row">
            <asp:GridView ID="gvProdSales" CssClass="table product-table" EnableRowCache="true"  runat="server" AutoGenerateColumns="false" Style="margin-bottom: 0px;">
                <Columns>
                    
                    <asp:TemplateField HeaderText="Product">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("name") %>' runat="server"></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sales">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("total") %>' runat="server"></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
        </div>





    </div>
    <br />


    <asp:Button ID="btnViewOrder" runat="server" Text="View Order" class="redirectButton" UseSubmitBehavior="false" OnClick="btnViewOrder_Click"/>

    <br />
    <br />
</asp:Content>
