<%@ Page Title="Registo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register2.aspx.cs" Inherits="Trabalho_de_PWEB.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="form-horizontal">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage2" />
        </p>
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
            <asp:Label runat="server" AssociatedControlID="Nome_animal" CssClass="col-md-2 control-label">Nome: </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Nome_animal" CssClass="form-control" TextMode="SingleLine"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Nome_animal"
                    CssClass="text-danger" ErrorMessage="O campo do Nome está em falta." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Data_animal" CssClass="col-md-2 control-label">Data Nascimento:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Data_animal" CssClass="form-control" TextMode="date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Data_animal"
                    CssClass="text-danger" ErrorMessage="O campo da Data está em falta." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Raca" CssClass="col-md-2 control-label">Raça:</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="Raca" CssClass="form-control" >
                    <asp:ListItem>Pastor Alemão</asp:ListItem>
                    <asp:ListItem>Caniche</asp:ListItem>
                    <asp:ListItem>Lavrador</asp:ListItem>
                    <asp:ListItem>Pincha</asp:ListItem>
                    <asp:ListItem>Serra da estrela</asp:ListItem>
                    <asp:ListItem>Não sabe</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Raca"
                    CssClass="text-danger" ErrorMessage="O campo da Raca está em falta." />
            </div>
          </div>

       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="sexo" CssClass="col-md-2 control-label">Sexo:</asp:Label>
            <div class="col-md-10">
                <asp:RadioButtonList runat="server" ID="sexo" CssClass="form- control" Width="61px" >
                      <asp:ListItem>Macho</asp:ListItem>
                      <asp:ListItem>Femêa</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="sexo"
                    CssClass="text-danger" ErrorMessage="O campo do Sexo está em falta." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="vacinacao2" CssClass="col-md-2 control-label">Vacinação em dia?</asp:Label>
            <div class="col-md-10">
                <asp:RadioButtonList runat="server" ID="vacinacao2" CssClass="form- control" >
                      <asp:ListItem>Sim</asp:ListItem>
                      <asp:ListItem>Não</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="vacinacao2"
                    CssClass="text-danger" ErrorMessage="O campo da Vacinação está em falta." />
            </div>
        </div>
        <div>  
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" ID="Register3" OnClick="MudarPagina" Text="Próximo" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

     </div>

</asp:Content>