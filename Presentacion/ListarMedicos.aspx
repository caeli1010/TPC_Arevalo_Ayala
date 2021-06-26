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
                    <asp:Repeater runat="server" ID="repetidor">
                        <ItemTemplate>
                            <tr>
                                <th scope="row">500</th>
                                <td><%#Eval("nombre")%>  <%#Eval("apellido")%></td>
                                <td><%#Eval("horario.dias")%> </td>
                                <td><%#Eval("especialidad")%></td>
                                <td><%#Eval("mail")%></td>
                                <td>555-555-55</td>
                                <td>Activo</td>
                                <td>
                                    <asp:Button Text="Agregar Especialidad"
                                        runat="server"
                                        CssClass="btn btn-success"
                                        ID="btnAgregarEsp"
                                        OnClick="btnAgregarEsp_Click" 
                                        CommandArgument='<%#Eval("idMedico")%>'/>
                                    <asp:Button Text="Deshabilitar"
                                        runat="server"
                                        CssClass="btn btn-outline-warning"
                                        ID="btnDeshabilitar"
                                        OnClick="btnDeshabilitar_Click" 
                                        CommandArgument='<%#Eval("idMedico")%>'/>
                                </td>
                            </tr>

                        </ItemTemplate>
                        </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
