<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Log In.aspx.cs" Inherits="SEAMOrderStoreSystem.Log_In" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:Login ID = "Login1" runat = "server" OnAuthenticate="Login1_Authenticate" UserNameLabelText="E-mail:">
    </asp:Login>
</asp:Content>
