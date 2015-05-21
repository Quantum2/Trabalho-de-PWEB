<%@ Page Title="Registo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register3.aspx.cs" Inherits="Trabalho_de_PWEB.Account.Register" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <h2><%: Title %></h2>
        <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage3" />
        </p>
         <p>Criar nova conta na VirtualVet online, vantagens:
        </p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Marcação de consultas online;
        </p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Consulta dos registos dos animais.
        </p>
        <p>&nbsp;</p>

    <div class="form-horizontal">
        <h4>Criar nova conta!</h4>
        <hr />
        <p>Dados para acesso a sua conta: </p>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="O campo do email está em falta" />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Palavra-passe:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="A Palavra-Passe é obrigatória." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmar Palavra-passe:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="A confirmação da Palavra-passe é obrigatória." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="A Palavra-Passe não está igual a confirmação da Palavra-Passe." />
            </div>
        </div>
        </div>

<div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Próximo" CssClass="btn btn-default" />
            </div>
        </div>

     

</asp:Content>