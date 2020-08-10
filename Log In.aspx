<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Log In.aspx.cs" Inherits="SEAMOrderStoreSystem.Log_In" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>havent done real log in, now cincai type anything also can log in</p>
<asp:Login ID = "Login1" runat = "server" OnAuthenticate="Login1_Authenticate"></asp:Login>
</asp:Content>
