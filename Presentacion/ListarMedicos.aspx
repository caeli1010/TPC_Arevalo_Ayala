<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarMedicos.aspx.cs" Inherits="Presentacion.ListarMedicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <script>
           $(document).ready(function () {
               $('#medicos').DataTable({
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

    <div class ="row justify-content-center">
    <h4 class="text-center">Listado de Medicos </h4>
    </div>
    <div class="row alert alert-heading">
        <div class="col-md-12">
            <table class="table" id="medicos">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Matricula</th>
                        <th scope="col">Nombre y Apellido</th>
                        <th scope="col">Email</th>
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
                                <td>Activo</td>
                                <td>
                                    <a class="btn btn-sm btn-outline-info" href='AgregarEspecialidad.aspx?idM=<%#Eval("idMedico")%>'><i title="Ver especialidades" class="display-5 fa fa-eye"></i></a>
                                    <a class="btn btn-sm btn-outline-danger " href='BajaMedico.aspx?idM=<%#Eval("idMedico")%>'><i title="Eliminar" class="fa fa-trash display-5"></i></a>
                                    <a class="btn btn-sm btn-outline-secondary" href='ModificarMedico.aspx?idM=<%#Eval("idMedico")%>'><i title="Modificar datos" class="fa fa-user-edit display-5"></i></a>
                                    <a class="btn btn-sm btn-outline-success" href='AgregarHorario.aspx?aCc=a&idM=<%#Eval("idMedico")%>'><i title="Agregar horarios" class="fa fa-user-clock display-5"></i></a>
                                    <a class="btn btn-sm btn-outline-success" href='AgregarHorario.aspx?aCc=m&idM=<%#Eval("idMedico")%>'><i title="Modificar horarios" class="fa fa-user-clock display-5"></i></a>
                                    <a class="btn btn-sm btn-outline-success" href='AgregarHorario.aspx?aCc=b&idM=<%#Eval("idMedico")%>'><i title="Eliminar horarios" class="fa fa-user-clock display-5"></i></a>
                                  
                                </td>
                            </tr>

                        </ItemTemplate>
                        </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
