<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="Presentacion.ListarPacientes" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        function bajar(ev){

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
                        });
                    } else {
                        swal("No se realizaron cambios!");
                    }
                });
            return false;

        }

    </script>
    <hr class="py-1" />
    <h1>Listado de Pacientes </h1>
    <div class="alert alert-success">

    <asp:Label Visible="false" runat="server" ID="lblMensaje" />
    </div>
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
                        <th scope="col">Acciónes</th>
                    </tr>
                </thead>
                <tbody>

                    <asp:Repeater runat="server" ID="repetidor">
                        <ItemTemplate> 
                   
                    <tr>
                        <th scope="row"><%#Eval("dni")%></th>
                        <td><%#Eval("nombre")%> <%#Eval("apellido")%></td>
                        <td><%#Eval("obraSocial")%></td>
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
            </table>

        </div>
    </div>

</asp:Content>
