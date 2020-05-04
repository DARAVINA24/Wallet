<%@ Page Title="HASH" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Generar.aspx.cs" Inherits="Wallet2.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Generar Hash.</h4>
                    <hr />
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                   
                   
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                             <asp:Label runat="server" CssClass="col-md-2 control-label">Direccion de Wallet</asp:Label>
                            <asp:TextBox ID="txthash" runat="server" Visible="False" Width="1002px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Generar" Text="Genera tu Hash" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
              
            </section>
        </div>

        <div class="col-md-4">
           
        </div>
    </div>

    <style type="text/css">

        input[type="text"], input[type="password"] {
    max-width: 433px;
    border-radius: 2px;
}


    </style>
</asp:Content>
