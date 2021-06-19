<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministradorUsuario.aspx.cs" Inherits="Presentacion.AdministradorUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <%--<h1>Usuarios</h1>
            <% foreach(Dominio.Usuario item in users){ %>
        <p>
                <a class="nav-link btn btn-outline-success" href="Usuarios.aspx?dni=<% =item.dni %>">
                    <% = item.username  %> - 
                    <% = item.password  %> -
                    <% = item.dni  %> -
                    <% = item.imagen  %>-
                    <% = item.idRol  %>-
                    <% = item.idUsuario  %>-
                </a>
        </p>
            <%} %>--%>
          <h1>Usuarios</h1>
            <% foreach(Dominio.Medico item in doc){ %>
        <p>
                <a class="nav-link btn btn-outline-success" href="Usuarios.aspx?dni=<% =item.dni %>">
                    <% = item.nombre  %> - 
                    <% = item.apellido  %> -
                    <% = item.genero  %> -
                    <% = item.fechaNac  %>-
                    <% = item.fechaIngreso  %>-
                    <% = item.dni  %>-
                </a>
        </p>
            <%} %>
    </div>


</asp:Content>
