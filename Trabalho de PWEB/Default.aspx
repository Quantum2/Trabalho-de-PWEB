<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Trabalho_de_PWEB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Mobilvet</h1>
        <p class="lead">A MovilVet é uma clínica veterinária que está sempre ao seu dispor para os mais variados serviços</p>
        <p><a href="About.aspx" class="btn btn-primary btn-lg">Ver mais...</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Marcar consultas</h2>
            <p>
                Marcar consultas para os seus animais</p>
            <p>
                <a class="btn btn-default" href="Cliente/Consultas.aspx">Seguir »</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Incompleto</h2>
            <p>
                More...</p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Incompleto</h2>
            <p>
                More...</p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
