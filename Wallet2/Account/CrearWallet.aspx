<%@ Page Title="CrearWallet" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearWallet.aspx.cs" Inherits="Wallet2.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Registrar Wallet.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="palabras" CssClass="col-md-2 control-label">Escriba sus 12 palabras</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="palabras" CssClass="form-control" MaxLength="12" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="palabras"
                    CssClass="text-danger" ErrorMessage="Las 12 palabras son requeridas." />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Correo Electronico</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                    CssClass="text-danger" ErrorMessage="El correo es requerido." />
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Crear_Click" Text="Crear" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
