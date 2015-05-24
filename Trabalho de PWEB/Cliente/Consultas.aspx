<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="Trabalho_de_PWEB.Cliente.Consultas" MasterPageFile="../Site.Master" Title="Área do cliente" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" SelectCommand="SELECT Consulta.local, Consulta.data, Consulta.hora FROM Consulta INNER JOIN Cliente_consulta ON Consulta.cod_consulta = Cliente_consulta.cod_consulta INNER JOIN RelsClientes ON Cliente_consulta.cod_cliente = RelsClientes.cod_cliente WHERE (RelsClientes.user_id = @user_id)">
        <SelectParameters>
            <asp:Parameter Name="user_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <h3>
        <asp:LinkButton ID="existentes" Style="background-color: white; font-size: 22px;" runat="server" OnClick="existentes_Click">Consultas existentes</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="nova" Style="background-color: white; font-size: 22px;" runat="server" OnClick="novas_Click">Marcar nova consulta</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="animais" Style="background-color: white; font-size: 22px;" runat="server" OnClick="animais_Click">Os seus animais</asp:LinkButton>
    </h3>
    <hr />
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">

        <h4>Lista de consultas</h4>
        <p></p>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>

    </asp:PlaceHolder>

    <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible="False"></asp:PlaceHolder>

    <asp:PlaceHolder ID="PlaceHolder3" runat="server" Visible="False"></asp:PlaceHolder>
</asp:Content>
