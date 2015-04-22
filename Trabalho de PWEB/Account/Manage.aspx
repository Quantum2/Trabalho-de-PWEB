<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Trabalho_de_PWEB.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

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
                    <dt>Nome: <asp:Label ID="Label1" runat="server" Font-Bold="False" Visible="False"></asp:Label>
                        <dd></dd>
                    </dt>
                </dl>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Morada:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManageAddress" Text="[Change]" Visible="false" ID="HyperLink3" runat="server" />
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
