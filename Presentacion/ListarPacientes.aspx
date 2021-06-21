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
                        <th scope="col">Telefono</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Acciónes</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">500</th>
                        <td>Angel Simon </td>
                        <td>OSDE</td>
                        <td>1522255</td>
                        <td>MirMaxi@gmail.com</td>
                        <td>555-555-55</td>
                        <td>Activo</td>
                        <td>
                            <a href="#" class="btn btn-sm btn-success">Habilitar</a>
                            <a href="#" class="btn btn-sm btn-danger">Deshabilitar</a>
                        </td>
                    </tr>
                   
                </tbody>
            </table>

        </div>
    </div>

</asp:Content>
