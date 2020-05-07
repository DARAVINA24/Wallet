<%@ Page Title="Consulta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="Wallet2.Account.Consulta" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

        <p class="text-danger">
        <asp:Literal runat="server" ID="Literal1" />
    </p>


    <div class="form-horizontal">
        <h4>Consulta Saldo.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="dir1" CssClass="col-md-2 control-label">Escriba Direccion 1</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="dir1" CssClass="form-control" MaxLength="100" />
                 <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" MaxLength="100" Visible="False" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="dir1"
                    CssClass="text-danger" ErrorMessage="La direccion 1 es requerida." />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="saldo" CssClass="col-md-2 control-label">Su saldo es:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="saldo" CssClass="form-control" Enabled="True" />
              
            </div>
        </div>

        

                <asp:Button runat="server" id="consulta" Text="Consultar Saldo" CssClass="btn btn-default" />
           

   

    </div>

    <script type="text/javascript">


        function ConsultarSaldo(Id_Wallet) {
            var url = "http://localhost:34003/api/consulta/" + Id_Wallet;
            $.getJSON(url).done(function (data) {

                $("input#MainContent_saldo").val(data.saldo);
            }).fail(function (error) {
                $("input#MainContent_saldo").val("");

            });
        };

        $("input#MainContent_consulta").on("click", function () {
            ConsultarSaldo($("input#MainContent_dir1").val());

        });


        // function ConsultarSaldo() {
        //     var item = "";
        //     $.getJSON("http://localhost:34003/api/consulta/", function (data) {

        //        $("input#MainContent_saldo").val(data);
        //    }).fail(function (error) {
        //        $("input#MainContent_saldo").val("80000");

        //    });
        //};

        //$("input#MainContent_consulta").on("click", function () {
        //    ConsultarSaldo($("input#MainContent_dir1").val());

        //});


    </script>

</asp:Content>
