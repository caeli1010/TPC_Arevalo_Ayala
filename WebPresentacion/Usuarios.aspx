<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="WebPresentacion.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <hr class="py-3" />

    <h5 class="justify-content-center display-5">Categorias </h5>
    <ul class="nav justify-content-center">

        <% foreach (Dominio.Usuario item in lista)
          {%>

            <li class="nav-item">
            <a class="nav-link btn btn-outline-success" href="Usuarios.aspx?dni=<% =item.dni %>"><% = item.nombre %></a>
            </li>

          <%} %>
    </ul>
    <hr class="py-1" />

</asp:Content>
