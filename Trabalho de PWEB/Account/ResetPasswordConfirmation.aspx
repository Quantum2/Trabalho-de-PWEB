<%@ Page Title="Password Changed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="Trabalho_de_PWEB.Account.ResetPasswordConfirmation" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <div>
        <p>A sua palavra-passe foi alterada com sucesso. Clique <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">aqui</asp:HyperLink> para fazer login</p>
    </div>
</asp:Content>
