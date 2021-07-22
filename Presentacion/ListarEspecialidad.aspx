<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarEspecialidad.aspx.cs" Inherits="Presentacion.ListarEspecialidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {
            $('#especialidades').DataTable({
                "responsive": true,
                "language": {
                    "lengthMenu": "Mostrar _MENU_ Registros por páginas",
                    "zeroRecords": "No se encontraron registros - sorry",
                    "info": "Mostrando Página_PAGE_ de _PAGES_, ",
                    "infoEmpty": "No encontre registros",
                    "search": "Buscar:",
                    "zeroRecords": "No encontramos registros",
                    "paginate": {
                        "first": "Primera",
                        "last": "Ultima",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    },
                    "aria": {
                        "sortAscending": ":activar para ordenar la columna ascendenteg",
                        "sortDescending": ":activar para ordenar la columna ascendente"
                    }
                }
            });
        });
    </script>
    <div class="row justify-content-center">
        <h3 class="text-center">Especialidades</h3>
    </div>
    <div class="row alert alert-heading">

        <div class="col-md-12">

            <table class="table" id="especialidades">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col" class="text-center">Nro</th>
                        <th scope="col" class="text-center">Especialidad</th>
                        <th scope="col" class="text-center">Medicos</th>
                        <th scope="col" class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="repetidorPadre"
                        OnItemDataBound="repetidorPadre_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td class="text-center"><%#Eval("idEspecialidad")%></td>
                                <asp:HiddenField ID="hdfidEspecialidad"
                                    Value='<%#Eval("idEspecialidad")%>' runat="server" />
                                <td class="text-left"><%#Eval("nombre")%></td>

                                <td class="text-center">
                                    <asp:Repeater runat="server" ID="repetidorHijo">
                                        <ItemTemplate>
                                            <a href='AgregarEspecialidad.aspx?idM=<%#Eval("idMedico")%>' 
                                                class="text-body">
                                                <strong><%#Eval("apellido") %></strong>,
                                                <%#Eval("nombre") %>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                                <td class="text-center">
                                    <a href='AgregarEspecialidad.aspx?d=m&idE=<%#Eval("idEspecialidad")%>' class="btn btn-sm btn-outline-info">
                                        <i title="Modificar especialidad" class="fa fa-edit display-5"></i>
                                    </a>
                                    <a href="AgregarEspecialidad.aspx?d=a" class="btn btn-sm btn-outline-success">
                                        <i title="Agregar especialidad" class="fa fa-plus display-6"></i>
                                    </a>
                                    <a href='AgregarEspecialidad.aspx?d=e&idE=<%#Eval("idEspecialidad")%>' class="btn btn-sm btn-outline-danger">
                                        <i title="Eliminar especialidad" class="fa fa-trash display-5"></i>
                                    </a>
                                </td>
                            </tr>

                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
