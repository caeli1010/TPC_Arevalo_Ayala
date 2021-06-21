<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarMedicos.aspx.cs" Inherits="Presentacion.ListarMedicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <hr class="py-1" />
    <h1>Listado de Medicos </h1>
    <div class="row alert alert-heading">
        <div class="col-md-12">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Matricula</th>
                        <th scope="col">Nombre y Apellido</th>
                        <th scope="col">Dias de Atención</th>
                        <th scope="col">Especialidad</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Acciónes</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">500</th>
                        <td>Miranda Maximiliano</td>
                        <td>L y M </td>
                        <td>Urologo</td>
                        <td>MirMaxi@gmail.com</td>
                        <td>555-555-55</td>
                        <td>Activo</td>
                        <td>
                            <button type="button" data-toggle="modal" data-target="#exampleModal" class="btn btn-sm btn-success">Agregar Especialidad</button>
                            <a href="#" class="btn btn-sm btn-danger">Deshabilitar</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
