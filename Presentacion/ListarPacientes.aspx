<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="Presentacion.ListarPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr class="py-1" />
    <h1>Listado de Pacientes </h1>
    <div class="row alert alert-heading">
        <div class="col-md-12">

            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">DNI</th>
                        <th scope="col">Nombre y Apellido</th>
                        <th scope="col">Obra Social</th>
                        <th scope="col"> Nro Carnet</th>
                        <th scope="col">Email</th>
                        <th scope="col">Acciónes</th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (Dominio.Paciente item in pacientes)
                        { %>
                    <tr>
                        <th scope="row"><% = item.dni  %></th>
                        <td><% = item.nombre  %> <% = item.apellido  %></td>
                        <td><% = item.obraSocial.nombre  %></td>
                        <td> s/n </td>
                        <td><% = item.mail  %></td>
                        <td>
                            <a href="SolicitudTurno.aspx?ipc=<% = item.idPaciente  %>" class="btn btn-sm btn-success">Solicitar Turno</a>
                            <a href="ModificarPaciente.aspx?ipc=<% = item.idPaciente  %>" class="btn btn-sm btn-warning text-white">Modificar Datos</a>
                            
                        </td>
                    </tr>
                    <%} %>
                </tbody>
                   
                </tbody>
            </table>

        </div>
    </div>

</asp:Content>
