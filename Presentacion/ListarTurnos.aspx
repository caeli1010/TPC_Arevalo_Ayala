<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarTurnos.aspx.cs" Inherits="Presentacion.ListarTurnos" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script>
           $(document).ready(function () {
               $('#turnos').DataTable({
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
                   },
                   dom:'Bfrtilp',
                   buttons: [
                       {
                           extend: 'pdfHtml5',
                           text: ' <div class=" col-md-12"> <i class="fa fa-file-pdf text-white  "> </i></div>',
                           titleAttr: 'Exportar en PDF',
                           className: 'btn btn-outline-info'
                       }
                   ]
               });
           });
     </script>

    <hr/>
    <h3>Listado de Turnos </h3>
    <% if (lblMensaje.Visible == true)
        { %>
    <div class="alert alert-success text-center">

        <asp:Label Visible="false" runat="server" ID="lblMensaje" />
    </div>
    <% } %>
 

    <div class="row alert alert-heading">
        <div class="col-md-12">

            <table class="table" id="turnos">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Fecha</th>
                        <th scope="col">Médico</th>
                        <th scope="col">Paciente</th>
                        <th scope="col">Especialidad</th>
                        <th scope="col">Acciónes</th>
                    </tr>
                </thead>
                <tbody>

                     <asp:Repeater runat="server" ID="rptTurnos">
                        <ItemTemplate>


                            <tr>
                                <td ><%#Eval("fechaHora") %></td>
                                <td><%#Eval("nombre_m") %> <%#Eval("apellido_m") %></td>
                                 <td><%#Eval("nombre_p") %> <%#Eval("apellido_p") %></td>
                                 <td><%#Eval("especialidad") %> </td>
                                <td>
                                    <a href='SolicitudTurno?ipc=<%#Eval("idPaciente") %>&rep=<%#Eval("idTurnos") %>' 
                                        class="btn btn-sm btn-outline-success" title="Reprogramar el turno para este paciente">
                                        <i  class=" fa fa-calendar-check"   ></i>
                                    </a>
                                   <a href='ListarTurno.aspx?itr=<%#Eval("idTurnos") %>&dlttrn=s' class="btn btn-sm btn-outline-danger" title="Cancelar  este turno" >
                                        <i class="fa fa-ban"  ></i>
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
