<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Trabalho_de_PWEB.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBContext %>" DeleteCommand="DELETE FROM [Cliente] WHERE [cod_cliente] = @cod_cliente" InsertCommand="INSERT INTO [Cliente] ([nome], [morada], [data_nascimento]) VALUES (@nome, @morada, @data_nascimento)" SelectCommand="SELECT * FROM [Cliente]" UpdateCommand="UPDATE [Cliente] SET [nome] = @nome, [morada] = @morada, [data_nascimento] = @data_nascimento WHERE [cod_cliente] = @cod_cliente">
        <DeleteParameters>
            <asp:Parameter Name="cod_cliente" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="morada" Type="String" />
            <asp:Parameter DbType="Date" Name="data_nascimento" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="morada" Type="String" />
            <asp:Parameter DbType="Date" Name="data_nascimento" />
            <asp:Parameter Name="cod_cliente" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>
    </h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Mudar as definiçoes de conta</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Nome:<asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                    </dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="HyperLink1" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="HyperLink2" runat="server" />
                    </dd>
                </dl>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Morada:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="HyperLink3" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="HyperLink4" runat="server" />
                    </dd>
                </dl>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                </dl>
                <hr />
                <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="False">
                <dl class="dl-horizontal">
                    <dt>Administração:</dt>
                    <dd>
                        <asp:HyperLink Text="[Principal]" Visible="false" ID="AdminMain" runat="server" NavigateUrl="~/Admin/Principal.aspx"/>
                    </dd>
                </dl>
                </asp:PlaceHolder>
            </div>
        </div>
    </div>

</asp:Content>
