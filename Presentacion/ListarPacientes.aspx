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
                        <td>angelsimon@gmail.com</td>
                        <td>555-555-55</td>
                        <td>Activo</td>
                        <td>
                            <a href="SolicitudTurno.aspx?dni=500&estado=1&email=MirMaxi@gmail.com&obsoc=OSDE&carnet=1522255&paciente=Angel Simon" class="btn btn-sm btn-success">Solicitar Turno</a>
                            <a href="#" class="btn btn-sm btn-danger">Deshabilitar</a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">501</th>
                        <td>Lara Brian  </td>
                        <td>OSDE</td>
                        <td>44558</td>
                        <td>brian.lara@gmail.com</td>
                        <td>555-555-55</td>
                        <td>Activo</td>
                        <td>
                            <a href="SolicitudTurno.aspx?dni=501&estado=1&email=brian.lara@gmail.com&obsoc=CEMIC&carnet=44558&paciente=Lara Brian" class="btn btn-sm btn-success">Solicitar Turno</a>
                            <a href="#" class="btn btn-sm btn-danger">Deshabilitar</a>
                        </td>
                    </tr>
                   
                </tbody>
            </table>

        </div>
    </div>

</asp:Content>
