<%@ Page Title="Registo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register2.aspx.cs" Inherits="Trabalho_de_PWEB.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="form-horizontal">
        <p>&nbsp;</p>
        <p>Dados dos seus animais:</p>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Tipo" CssClass="col-md-2 control-label">Tipo de animal:</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="Tipo" CssClass="form-control" >
                    <asp:ListItem>Cão</asp:ListItem>
                    <asp:ListItem>Gato</asp:ListItem>
                    <asp:ListItem>Coelho</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Nome" CssClass="col-md-2 control-label">Nome: </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Nome" CssClass="form-control" TextMode="SingleLine"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Nome"
                    CssClass="text-danger" ErrorMessage="O campo do Nome está em falta." />
            </div>
        </div>
       </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Data" CssClass="col-md-2 control-label">Data Nascimento:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Data" CssClass="form-control" TextMode="date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Data"
                    CssClass="text-danger" ErrorMessage="O campo da Data está em falta." />
            </div>
        </div>

    </div>

</asp:Content>