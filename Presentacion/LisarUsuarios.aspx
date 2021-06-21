<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LisarUsuarios.aspx.cs" Inherits="Presentacion.LisarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr class="py-1" />
    <h1>Listado de Usuarios </h1>
    <div class="row alert alert-heading">
        <div class="col-md-12">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">DNI</th>
                        <th scope="col">USUARIO</th>
                        <th scope="col">PASSWORD</th>
                        <th scope="col">ROL EN EL SISTEMA</th>
                        <th scope="col">ID </th>
                        <th scope="col">ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (Dominio.Usuario item in users)
                        { %>
                    <tr>
                        <th scope="row"><% = item.dni  %></th>
                        <td><% = item.username  %></td>
                        <td><% = item.password  %></td>
                        <td><% = item.idRol  %></td>
                        <td><% = item.idUsuario  %></td>
                        <td>
                            <a href="Usuarios.aspx?dni=<% =item.dni %>&estado=1" class="btn btn-sm btn-success">Habilitar</a>
                            <a href="Usuarios.aspx?dni=<% =item.dni %>&estado=0" class="btn btn-sm btn-danger">Deshabilitar</a>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
