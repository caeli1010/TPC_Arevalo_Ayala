<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>TURNOS WEB</h1>

        <% foreach (Dominio.Usuario item in users)
            { %>
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
        <%} %>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>TURNOS</h2>
            <p>
                Aquí podrá ver el listado completo de los turnos pendientes.
            </p>
            <p>
                <a class="btn btn-default" href="~/Turnos">Ir &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>PACIENTES</h2>
            <p>
                Aquí podrá ver el listado completo de los pacientes inscriptos.
            </p>
            <p>
                <a class="btn btn-default" href="~/Pacientes">Ir &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>MEDICOS</h2>
            <p>
                Aquí podrá ver el listado completo de los medicos bajo convenio
            </p>
            <p>
                <a class="btn btn-default" href="~/Medicos">Ver Más &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
