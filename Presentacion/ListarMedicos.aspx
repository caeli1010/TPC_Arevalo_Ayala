﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarMedicos.aspx.cs" Inherits="Presentacion.ListarMedicos" %>

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
                        <th scope="col">Email</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Acciónes</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="repetidor">
                        <ItemTemplate>
                            <tr>
                                <th scope="row"><%#Eval("matricula")%></th>
                                <td><%#Eval("nombre")%> <%#Eval("apellido")%></td> 
                                <td><%#Eval("mail")%></td>
                                <td>555-555-55</td>
                                <td>Activo</td>
                                <td>
                                    <a class="btn btn-sm btn-outline-info" href='AgregarEspecialidad.aspx?idM=<%#Eval("idMedico")%>'>Ver Especialidad</a>
                                    <a class="btn btn-sm btn-outline-success " href='BajaMedico.aspx?idM=<%#Eval("idMedico")%>'>Deshabilitar</a>
                                    <a class="btn btn-sm btn-outline-danger" href='ModificarMedico.aspx?idM=<%#Eval("idMedico")%>'>Modificar</a>
                                   <%-- <asp:Button Text="Deshabilitar"
                                        runat="server"
                                        CssClass="btn btn-outline-warning"
                                        ID="btnDeshabilitar"
                                        OnClick="btnDeshabilitar_Click" 
                                        CommandArgument='<%#Eval("idMedico")%>'/>--%>
                                </td>
                            </tr>

                        </ItemTemplate>
                        </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
