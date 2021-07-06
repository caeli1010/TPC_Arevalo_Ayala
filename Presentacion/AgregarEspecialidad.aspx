<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarEspecialidad.aspx.cs" Inherits="Presentacion.AgregarEspecialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <hr class="py-1" />
    <h1>Agregar Especialidad</h1>
    <div class="row alert alert-secondary">
        <div class="col-md-6">
            <div class="card" >
                <img class="card-img-top mx-auto d-block py-3" style="width: 24%;" src="https://www.adl-logistica.org/wp-content/uploads/2019/07/imagen-perfil-sin-foto.png" alt="Card image cap">
                <div class="card-body">
                    <hr />
                    <h4 class="card-title">Identidad del Medico</h4>
                    <p class="card-text">NOMBRE y APELLIDO :<span class=" font-weight-bold "> <asp:Label ID="lblNombre" runat="server" /></span></p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">DNI: <span class=" font-weight-bold ">
                        <asp:Label  ID="lblDni" runat="server" /></span> </li>
                    <li class="list-group-item">MATRICULA: <span class=" font-weight-bold">
                        <asp:Label ID="lblMatricula" type="number" runat="server" /></span> </li>
                    <li class="list-group-item">EMAIL: <span class="font-weight-bold ">
                        <asp:Label ID="lblEmail" runat="server" /> </span>  </li>
                </ul>
                <div class="card-body">
             
                    <a href="#" class="card-link badge btn-sm badge-info">Enviar mensaje</a>
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <form>
                <div class="form-row">
                     <div class="form-group col-md-12">
                        <asp:Label ID="lblVerEspec" Text="Ver Especialidad" runat="server" />
                            <asp:DropDownList ID="ddlVerEspecialidad" CssClass="btn btn-otline-dark dropdown-toggle" runat="server">          
                            </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-12">
                        <asp:Button ID="btnAgregarEspecialidad" OnClick="btnAgregarEspecialidad_Click" 
                            Text="Agregar Especialidad" CssClass="card-link btn-sm  btn-danger" runat="server" />
                        <asp:Label ID="lblEspecialidad" visible="false" Text="Especialidad" runat="server" />
                            <asp:DropDownList ID="ddlEspecialidad" Visible="false" CssClass="btn btn-otline-dark dropdown-toggle" runat="server" 
                                 OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">          
                            </asp:DropDownList>
                    </div>
                </div>

                  <asp:Button Text="Agregar" CssClass="card-link btn-sm  btn-danger" 
                      ID="btnAgregar"  runat="server" Visible="false" OnClick="btnAgregar_Click" />
                <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>
            </form>
        </div>
    </div>



</asp:Content>
