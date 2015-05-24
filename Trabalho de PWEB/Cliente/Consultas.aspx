<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="Trabalho_de_PWEB.Cliente.Consultas" MasterPageFile="../Site.Master" Title="Área do cliente" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" SelectCommand="SELECT Consulta.local, Consulta.data, Consulta.hora FROM Consulta INNER JOIN Cliente_consulta ON Consulta.cod_consulta = Cliente_consulta.cod_consulta INNER JOIN RelsClientes ON Cliente_consulta.cod_cliente = RelsClientes.cod_cliente WHERE (RelsClientes.user_id = @user_id)">
        <SelectParameters>
            <asp:Parameter Name="user_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" SelectCommand="SELECT * FROM [RelsClientes] WHERE ([user_id] = @user_id)">
        <SelectParameters>
            <asp:Parameter Name="user_id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <h3>
        <asp:LinkButton ID="existentes" Style="background-color: white; font-size: 22px;" runat="server" OnClick="existentes_Click">Consultas existentes</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="nova" Style="background-color: white; font-size: 22px;" runat="server" OnClick="novas_Click">Marcar nova consulta</asp:LinkButton>&nbsp;
        <asp:LinkButton ID="animais" Style="background-color: white; font-size: 22px;" runat="server" OnClick="animais_Click">Os seus animais</asp:LinkButton>
    </h3>
    <hr />
    <asp:Panel ID="Panel1" runat="server">

        <div>
        <h4>Lista de consultas</h4>
        <p></p>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        </div>
        

    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <asp:Label ID="Label1" runat="server" Text="Local:" Font-Bold="True"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <p></p>
        <asp:Label ID="Label2" runat="server" Text="Data:" Font-Bold="True"></asp:Label><asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
        <p></p>
        <asp:Label ID="Label3" runat="server" Text="Hora:" Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="H"></asp:Label>&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label5" runat="server" Text="M"></asp:Label><p></p>
        <asp:Button ID="Button1" runat="server" Text="Confirmar" OnClick="Button1_Click1" />
    </asp:Panel>

    <asp:Panel ID="Panel3" runat="server" Visible="False">
        <h4>Lista de animais em consultas<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" SelectCommand="SELECT Animal.nome, Animal.raca, Animal.idade FROM Animal INNER JOIN Cliente_Animal ON Animal.cod_animal = Cliente_Animal.cod_animal INNER JOIN RelsClientes ON Cliente_Animal.cod_cliente = RelsClientes.cod_cliente WHERE (RelsClientes.user_id = @user_id)">
            <SelectParameters>
                <asp:Parameter Name="user_id" />
            </SelectParameters>
            </asp:SqlDataSource>
        </h4><p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="raca" HeaderText="raca" SortExpression="raca" />
                    <asp:BoundField DataField="idade" HeaderText="idade" SortExpression="idade" />
                </Columns>
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
        </p><p></p>
        <h4>Adicionar animal</h4>
        <hr />
        <asp:Label ID="Label6" runat="server" Text="Nome:" Font-Bold="True"></asp:Label>

        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><p></p>
        <asp:Label ID="Label7" runat="server" Text="Raça:" Font-Bold="True"></asp:Label>

        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><p></p>

        <asp:Label ID="Label8" runat="server" Text="Idade:" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" TextMode="Number"></asp:TextBox><p></p>
        <asp:Button ID="Button2" runat="server" Text="Adicionar" OnClick="Button2_Click" />
    </asp:Panel>
</asp:Content>
