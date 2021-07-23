<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionUsuario.aspx.cs" Inherits="Presentacion.GestionUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblUser" Text="UserName"  Visible="false" runat="server" />
                        <asp:TextBox ID="txtUser" CssClass="form-control" runat="server"
                            Visible="false"/>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblPassw" Text="PassWord"  Visible="false" runat="server" />
                        <asp:TextBox ID="txtPassw" CssClass="form-control" runat="server"
                           Visible="false" TextMode="Password"/>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblDNI" Text="DNI" Visible="false" runat="server" />
                        <asp:TextBox ID="txtDNI" CssClass="form-control" runat="server"
                           Visible="false"/>
                    </div>
                </div>

                <div class="form-group col-md-12 text-right">

                    <asp:Button Text="Guardar" OnClick="btnGuardar_Click" CssClass="card-link btn-sm btn-outline-success"
                        Visible="false" ID="btnGuardar" runat="server" />
                    <asp:Button Text="Modificar" OnClick="btnModificar_Click" CssClass="card-link btn-sm btn-outline-info"
                        Visible="false" ID="btnModificar" runat="server" />
                </div>

            </form>

</asp:Content>
