<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="Presentacion.ListarPacientes" EnableEventValidation="False" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        function bajar(ev) {

            var objeto = { estado: false, element: null };
            if (objeto.estado) { return true; };

            swal({
                title: "Quieres eliminar el registro?",
                text: "Se realizará una  baja lógica, si deseas recuperar el paciente comunicate con el administrador del sistema",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        swal("¡El paciente ha sido eliminado!", {
                            icon: "success",
                            function() {
                                objeto.estado = true;
                                objeto.element = ev;
                                objeto.element.click();
                            }
                        });
                    } else {
                        swal("No se realizaron cambios!");
                    }
                });
            return false;

        }

    </script>
       <script>
           $(document).ready(function () {
               $('#pacientes').DataTable({

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

    <hr class="py-1" />
    <h1>Listado de Pacientes </h1>
    <% if (lblMensaje.Visible == true)
        { %>
    <div class="alert alert-success text-center">

        <asp:Label Visible="false" runat="server" ID="lblMensaje" />
    </div>
    <% } %>
    <% //lblMensaje.Visible = false; %>

    <div class="row alert alert-heading">
        <div class="col-md-12">

            <table class="table" id="pacientes">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">DNI</th>
                        <th scope="col">Nombre y Apellido</th>
                        <%--<th scope="col">Obra Social</th>--%>
                        <th scope="col">Nro Carnet</th>
                        <th scope="col">Email</th>
                        <th scope="col">Acciónes</th>
                    </tr>
                </thead>
                <tbody>

                    <asp:Repeater runat="server" ID="repetidor">
                        <ItemTemplate>

                            <tr>
                                <td scope="row"><%#Eval("dni")%></td>
                                <td><%#Eval("nombre")%> <%#Eval("apellido")%></td>
                                <%--<td><%#Eval("obraSocial")%></td>--%>
                                <td><%#Eval("nroCarnet")%></td>
                                <td><%#Eval("mail")%></td>
                                <td>
                                    <a href="SolicitudTurno.aspx?ipc=<%#Eval("idPaciente")%>" class="btn btn-sm btn-outline-success">
                                        <i title="Agregar un turno" class=" fa fa-calendar-check"></i>
                                    </a>

                                    <asp:Button
                                        Text="Eliminar"
                                        ID="eliminiar"
                                        CssClass="btn btn-sm btn-outline-danger"
                                        CommandArgument='<%#Eval("idPaciente")%>'
                                        OnClick="eliminiar_Click"
                                        runat="server" Enabled="True" />

                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                </tbody>
                <tfoot>
                    <tr>
                        <th scope="col">DNI</th>
                        <th scope="col">Nombre y Apellido</th>
                        <%--<th scope="col">Obra Social</th>--%>
                        <th scope="col">Nro Carnet</th>
                        <th scope="col">Email</th>
                        <th scope="col">Acciónes</th>
                    </tr>
                </tfoot>
            </table>

        </div>
    </div>


</asp:Content>
