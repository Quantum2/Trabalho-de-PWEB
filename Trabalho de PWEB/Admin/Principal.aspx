<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Trabalho_de_PWEB.Admin.Principal" MasterPageFile="../Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBContext %>" DeleteCommand="DELETE FROM Consulta WHERE (cod_consulta = @original_cod_consulta) AND (local = @original_local) AND (data = @original_data) AND (hora = @original_hora) OR (cod_consulta = @original_cod_consulta) AND (local IS NULL) AND (data = @original_data) AND (hora = @original_hora) AND (@original_local IS NULL) OR (cod_consulta = @original_cod_consulta) AND (local = @original_local) AND (data IS NULL) AND (hora = @original_hora) AND (@original_data IS NULL) OR (cod_consulta = @original_cod_consulta) AND (local IS NULL) AND (data IS NULL) AND (hora = @original_hora) AND (@original_local IS NULL) AND (@original_data IS NULL) OR (cod_consulta = @original_cod_consulta) AND (local = @original_local) AND (data = @original_data) AND (hora IS NULL) AND (@original_hora IS NULL) OR (cod_consulta = @original_cod_consulta) AND (local IS NULL) AND (data = @original_data) AND (hora IS NULL) AND (@original_local IS NULL) AND (@original_hora IS NULL) OR (cod_consulta = @original_cod_consulta) AND (local = @original_local) AND (data IS NULL) AND (hora IS NULL) AND (@original_data IS NULL) AND (@original_hora IS NULL) OR (cod_consulta = @original_cod_consulta) AND (local IS NULL) AND (data IS NULL) AND (hora IS NULL) AND (@original_local IS NULL) AND (@original_data IS NULL) AND (@original_hora IS NULL)" InsertCommand="INSERT INTO [Consulta] ([local], [data], [hora]) VALUES (@local, @data, @hora)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Consulta]" UpdateCommand="UPDATE [Consulta] SET [local] = @local, [data] = @data, [hora] = @hora WHERE [cod_consulta] = @original_cod_consulta AND (([local] = @original_local) OR ([local] IS NULL AND @original_local IS NULL)) AND (([data] = @original_data) OR ([data] IS NULL AND @original_data IS NULL)) AND (([hora] = @original_hora) OR ([hora] IS NULL AND @original_hora IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_cod_consulta" Type="Int32" />
            <asp:Parameter Name="original_local" Type="String" />
            <asp:Parameter DbType="Date" Name="original_data" />
            <asp:Parameter DbType="Time" Name="original_hora" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="local" Type="String" />
            <asp:Parameter DbType="Date" Name="data" />
            <asp:Parameter DbType="Time" Name="hora" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="local" Type="String" />
            <asp:Parameter DbType="Date" Name="data" />
            <asp:Parameter DbType="Time" Name="hora" />
            <asp:Parameter Name="original_cod_consulta" Type="Int32" />
            <asp:Parameter Name="original_local" Type="String" />
            <asp:Parameter DbType="Date" Name="original_data" />
            <asp:Parameter DbType="Time" Name="original_hora" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" SelectCommand="SELECT [cod_cliente], [nome] FROM [Cliente] ORDER BY [nome]"></asp:SqlDataSource>
    <div>
        <h4>
            <asp:LinkButton Style="background-color: white;" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Adicionar consultas</asp:LinkButton>&nbsp;
        <asp:LinkButton Style="background-color: white;" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Modificar animais</asp:LinkButton>&nbsp;
        <asp:LinkButton Style="background-color: white;" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Modificar utilizadores</asp:LinkButton>&nbsp;
        </h4>
    </div>
    <hr />

    <asp:Panel ID="consultas" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Local da consulta:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <p></p>
        <asp:Label ID="Label2" runat="server" Text="Data da consulta:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
        &nbsp;<p></p>
        <asp:Label ID="Label7" runat="server" Text="Cliente:"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="cod_cliente">
        </asp:DropDownList>
        <p></p>
        <asp:Label ID="Label3" runat="server" Text="Hora da consulta:"></asp:Label>

        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
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
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
        </asp:DropDownList>

        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="H"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="M"></asp:Label>
        <p></p>
        <asp:Button ID="Button1" runat="server" Text="Adicionar !" OnClick="Button1_Click" />
        <hr />
        <asp:Label ID="Label6" runat="server" Text="Consultas existentes " Font-Bold="True" Font-Italic="True" Font-Underline="True"></asp:Label>
        <p></p>
        <asp:GridView ID="GridView1" runat="server" Style="background-color: white;" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="cod_consulta">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="cod_consulta" HeaderText="cod_consulta" ReadOnly="True" InsertVisible="False" SortExpression="cod_consulta"></asp:BoundField>
                <asp:BoundField DataField="local" HeaderText="local" SortExpression="local"></asp:BoundField>
                <asp:BoundField DataField="data" HeaderText="data" SortExpression="data"></asp:BoundField>
                <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora"></asp:BoundField>

            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="animais" runat="server"></asp:Panel>
    <asp:Panel ID="clientes" runat="server"></asp:Panel>
</asp:Content>
