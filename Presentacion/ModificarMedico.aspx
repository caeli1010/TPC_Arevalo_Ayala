<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarMedico.aspx.cs" Inherits="Presentacion.ModificarMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <div class="offset-md-2 col-md-8">
        <h4 class="text-center">Modificando datos personales del Médico</h4>
        <div class="row alert alert-secondary">


            <form>

                <div class="col-md-12">
                    <div class=" text-center ">
                        <h3 class=" px-5 text-white">
                            <asp:Label ID="lblApellido" runat="server" />
                        </h3>

                    </div>
                </div>

                <div class="form-row">
                    <div class="offset-md-3 form-group col-md-6">
                        <asp:Label ID="lblEmail" Text="e-mail" runat="server" />
                        <asp:TextBox ID="txtEmail" type="email" CssClass="form-control" ClientIDMode="Static" runat="server" />
                    </div>
                    <div class="offset-md-3 form-group col-md-6">
                        <asp:Label ID="lblCEmail" Text="Confirmar e-mail" runat="server" />
                        <asp:TextBox ID="txtCEmail" type="email" CssClass="form-control" ClientIDMode="Static" runat="server"  />
                    </div>

                    <div class="offset-md-3 form-group col-md-6 ">
                        <asp:Label ID="lblSexo" Text="Sexo" runat="server" />
                        <asp:TextBox ID="txtSexo" type="text" CssClass="form-control" runat="server" />
                    </div>
                </div>
                
                <div class="offset-md-3 form-group col-md-6 ">
                <asp:Button CssClass="btn btn-sm btn-outline-warnign" Text="Modificar" ID="btnModificarMedico" OnClick="btnModificarMedico_Click" runat="server" />
                <a class="btn btn-sm btn-outline-info" href='ListarMedicos.aspx'>Atras</a>
<%--                <asp:Button CssClass="btn btn-sm btn-outline-secondary" Text="Atras" ID="btnAtras" OnClick="btnAtras_Click" runat="server" />--%>
            </div>
            </form>
        </div>
    </div>

</asp:Content>
