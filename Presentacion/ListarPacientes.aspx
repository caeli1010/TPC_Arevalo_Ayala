<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="Presentacion.ListarPacientes" %>
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
                    <% foreach (Dominio.Paciente item in pacientes)
                        { %>
                    <tr>
                        <th scope="row"><% = item.dni  %></th>
                        <td><% = item.nombre  %> <% = item.apellido  %></td>
                        <td><% = item.obraSocial.nombre  %></td>
                        <td> s/n </td>
                        <td><% = item.mail  %></td>
                        <td>
                            <a href="SolicitudTurno.aspx?ipc=<% = item.idPaciente  %>" class="btn btn-sm btn-outline-success">Solicitar Turno</a>
                                             
                            <asp:Button 
                                Text="Eliminar"
                                ID="eliminiar"
                                 CssClass="btn btn-sm btn-outline-danger"
                                CommandArgument="<% = item.idPaciente  %>"
                                OnClick="eliminiar_Click"
                                OnClientClick="return bajar(this);" runat="server" />
                            
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>

        </div>
    </div>

</asp:Content>
