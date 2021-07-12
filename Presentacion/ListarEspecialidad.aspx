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
    <div class="Especialidades">

        <div class="col-md-12">

            <form>

                <div class="form-row">
                    <div class="row alert alert-heading">
                        <div class="form-group col-md-12">
                            <table class="table table-responsive table-bordered" id="especialidades">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Nro</th>
                                        <th scope="col">Especialidad</th>
                                        <th scope="col">Medicos</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="repetidorPadre"
                                        OnItemDataBound="repetidorPadre_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("idEspecialidad")%></td>
                                                <asp:HiddenField ID="hdfidEspecialidad"
                                                    Value='<%#Eval("idEspecialidad")%>' runat="server" />
                                                <td><%#Eval("nombre")%></td>

                                                <td>
                                                    <asp:Repeater runat="server" ID="repetidorHijo">
                                                        <ItemTemplate>
                                                            <a href='AgregarEspecialidad.aspx?idM=<%#Eval("idMedico")%>'>
                                                            <strong><%#Eval("apellido") %></strong>
                                                            <%#Eval("nombre") %>
                                                            </a>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-outline-info">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                </td>
                                            </tr>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</asp:Content>
