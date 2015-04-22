<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="Trabalho_de_PWEB.Cliente.Consultas" MasterPageFile="../Site.Master" Title="Área do cliente" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" SelectCommand="SELECT Consulta.data, Consulta.hora, Consulta.local FROM Consulta INNER JOIN Cliente_consulta ON Consulta.cod_consulta = Cliente_consulta.cod_consulta INNER JOIN RelsClientes ON Cliente_consulta.cod_cliente = RelsClientes.cod_cliente WHERE (RelsClientes.user_id = @userid_var)">
        <SelectParameters>
            <asp:Parameter Name="userid_var" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <h3>
        <asp:LinkButton ID="existentes" runat="server" OnClick="existentes_Click">Consultas existentes</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="nova" runat="server" OnClick="novas_Click">Marcar nova consulta</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="animais" runat="server">Os seus animais</asp:LinkButton>
    </h3>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        <hr />
        <h4>Lista de consultas</h4>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible="False"></asp:PlaceHolder>
    <asp:PlaceHolder ID="PlaceHolder3" runat="server" Visible="False"></asp:PlaceHolder>
</asp:Content>
