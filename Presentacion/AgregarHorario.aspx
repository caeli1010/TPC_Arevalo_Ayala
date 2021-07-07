<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarHorario.aspx.cs" Inherits="Presentacion.AgregarHorario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="offset-md-2 col-md-8">
    <hr class="py-1" />
    <h3 class="text-center">Agregar Horarios</h3>
    <div class="row alert alert-secondary">
        <div class="col-md-6">
            <div class="card">
                <img class="card-img-top mx-auto d-block py-3" style="width: 24%;" src="image/perfil.png" alt="Card image cap">
                <div class="card-body">
                    <hr />
                    <h5 class="card-title"> PROFESIONAL:  <asp:Label ID="lblNombre" runat="server" /> </h5>
                    <p class="card-text"<span class=" font-weight-bold ">
                       </span></p>
                </div>
                <%--<ul class="list-group list-group-flush">
                    <li class="list-group-item">DNI: <span class=" font-weight-bold ">
                        <asp:Label ID="lblDni" runat="server" /></span> </li>
                    <li class="list-group-item">MATRICULA: <span class=" font-weight-bold">
                        <asp:Label ID="lblMatricula" type="number" runat="server" /></span> </li>
                    <li class="list-group-item">EMAIL: <span class="font-weight-bold ">
                        <asp:Label ID="lblEmail" runat="server" />
                    </span></li>
                </ul>--%>
                <div class="card-body">

                    <a class="btn btn-sm btn-outline-info" href='ListarMedicos.aspx'>Atras</a>
                </div>
            </div>

        </div>

        <div class=" col-md-6 py-5">

            <form>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblDias" Text="Dias" runat="server" />
                        <asp:DropDownList ID="ddlDias" CssClass="form-control" runat="server">
                            <asp:ListItem Value="1" Text="Lunes" />
                            <asp:ListItem Value="2" Text="Martes" />
                            <asp:ListItem Value="3" Text="Miercoles" />
                            <asp:ListItem Value="4" Text="Jueves" />
                            <asp:ListItem Value="5" Text="Viernes" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblTotalHoras" Text="Total de horas" runat="server" />
                        <asp:TextBox ID="txtTHoras" CssClass="form-control" runat="server"
                            TextMode="Number" MaxLength="2" ValidationGroup="0-12" />
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblDuracion" Text="Duracion de turno" runat="server" />
                        <asp:TextBox ID="txtDuracion" CssClass="form-control" runat="server"
                            TextMode="Number" />
                    </div>
                </div>

                <div class="form-group col-md-12 text-right">

                    <asp:Button Text="Guardar" OnClick="btnAgregar_Click" CssClass="card-link btn-sm btn-outline-success"
                        ID="btnAgregar" runat="server" />
                    <asp:Button ID="btnInsertarHorario" OnClick="btnInsertarHorario_Click"
                        Text="Agregar horarios" CssClass="card-link btn-sm btn-outline-info " runat="server" />
                </div>
            </form>
        </div>
    </div>
    </div>


</asp:Content>
