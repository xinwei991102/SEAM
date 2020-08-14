<%@ Page Title="Sales Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="SEAMOrderStoreSystem.SalesReport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <nav aria-label="breadcrumb" style="display: inline-block;">
            <ol class="breadcrumb mb-0 py-0" style="background-color: transparent;">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="ViewAllOrders.aspx">Manage Orders</a></li>
                <li class="breadcrumb-item active" aria-current="page">Sales Report</li>
            </ol>
        </nav>
        <hr />
    </div>
    <h1 class="text-center">Monthly Sales Report</h1>
    <hr />
    <div>
        <h4>Report Range</h4>
        <p>Please select the month and year of report.</p>
        <label><b>Month: </b></label>
        <asp:DropDownList ID="ddlMonth" runat="server">
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

        <label><b>Year: </b></label>
        <asp:TextBox ID="txtYear" runat="server" type="number" required="true" step="1"></asp:TextBox>

        <asp:Button ID="btnSearch" runat="server" Text="Generate Report" class="btn btn-primary" OnClick="btnSearch_Click" />
        <asp:Button ID="btnCancel" type="button" UseSubmitBehavior="false" runat="server" Text="Cancel" class="btn btn-secondary" />

        <hr>

        <div class="container">
            <div class="row">
                <div class="col">
                    <asp:Chart ID="chtProdSales" runat="server"
                        BorderlineWidth="0" Height="300px" Palette="None"
                        Width="500px">
                        <Titles>
                            <asp:Title Text="Quantity Sold per Product"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" YValuesPerPoint="6">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:GridView ID="gvProdSales" CssClass="table" EnableRowCache="true" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Product">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("name") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity Sold">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("total") %>' runat="server"></asp:Label>
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
                </div>
                <div class="col">
                    <asp:Chart ID="chtSalesman" runat="server"
                        BorderlineWidth="0" Height="300px" Palette="None"
                        Width="500px">
                        <Titles>
                            <asp:Title Text="Sales (RM) per Salesman"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" YValuesPerPoint="6">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                    <asp:GridView ID="gvSalesman" CssClass="table" EnableRowCache="true" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Salesman">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("name") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Sales (RM)">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("total", "{0:0.00}").ToString() %>' runat="server"></asp:Label>
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
                </div>
            </div>
        </div>
</asp:Content>
