<%@ Page Title="Registo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Trabalho_de_PWEB.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
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
        <p>Dados pessoais para conta:</p>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Nome" CssClass="col-md-2 control-label">Nome (Completo):</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Nome" CssClass="form-control" TextMode="SingleLine"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Nome"
                    CssClass="text-danger" ErrorMessage="O campo do Nome está em falta." />
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

         
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Morada" CssClass="col-md-2 control-label">Morada:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Morada" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Data"
                    CssClass="text-danger" ErrorMessage="O campo da Morada está em falta." />
            </div>
        </div>

     
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="cod_postal" CssClass="col-md-2 control-label">Código-Postal:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="cod_postal" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="cod_postal"
                    CssClass="text-danger" ErrorMessage="O campo da Data está em falta." />
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="localidade" CssClass="col-md-2 control-label">Localidade:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="localidade" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="localidade"
                    CssClass="text-danger" ErrorMessage="O campo da Localidade está em falta." />
            </div>
        </div>
      
      <div>  
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" ID="Register2" OnClick="MudarPagina" Text="Próximo" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

    </div>
</asp:Content>
