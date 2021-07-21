<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarHorario.aspx.cs" Inherits="Presentacion.AgregarHorario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script runat=server>
            protected String GetStatus(string idDia) {
                var dia = String.Empty;
                switch (idDia)
                {
                    case "1":
                        dia = "Lun";
                        break;
                    case "2":
                        dia = "Mar";
                        break;
                    case "3":
                        dia = "Mie";
                        break;
                    case "4":
                        dia = "Jue";
                        break;
                    case "5":
                        dia = "Vie";
                        break;
                    case "6":
                        dia = "Sab";
                        break;
                    default:
                        break;
                }

                return dia;
            } 
    </script>

    <div class="offset-md-2 col-md-10">
    <h3 class="text-center">Horarios</h3>
         <% if (lblMensaje.Visible == true)
        { %>
    <div class="alert alert-success text-center">

        <asp:Label Visible="false" runat="server" ID="lblMensaje" />
    </div>
    <% } %>
    <div class="row alert alert-secondary">
        <div class="col-md-6">
            <div class="card">
                <img class="card-img-top mx-auto d-block py-3" style="width: 24%;" src="image/perfil.png" alt="Card image cap">
                <div class="card-body">
                    <hr />
                    <h5 class="card-title"> PROFESIONAL:  <asp:Label ID="lblNombre" runat="server" /> </h5>
                    <div class="col-md-12">

                    <table class="table">
                         <thead class="thead-dark">
                              <tr>
                                <th>Dias</th>&nbsp;
                                <th>Desde</th>&nbsp;
                                <th>Hasta</th>&nbsp;
                                <th>Acciones</th>&nbsp;
                              </tr>
                             </thead>
                         <tbody>
                          <asp:Repeater runat="server" ID="horariosRep">
                              <ItemTemplate>   
                                <tr>
                                    
                                    <td><%#GetStatus(Eval("idDias").ToString()) %> </td>&nbsp;
                                    <td><%#Eval("horaEntrada")%></td>&nbsp;
                                    <td><%#(((byte)Eval("horaEntrada"))+((short)Eval("hora")))%></td>&nbsp;
                                    <td>
                                        <asp:LinkButton runat="server" ID="lbtnModificar" Visible="true"
                                    CssClass="btn btn-sm btn-outline-secondary" OnClick="lbtnModificar_Click"
                                            CommandArgument='<%#Eval("id")%>'>
                                    <i title="Modificar datos" class="fa fa-edit display-5"></i>&nbsp;</asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="lbtnEliminar" Visible="true"
                                    CssClass="btn btn-sm btn-outline-danger" OnClick="lbtnEliminar_Click" 
                                            CommandArgument='<%#Eval("id")%>'>
                                    <i title="Eliminar" class="fa fa-trash display-5"></i>&nbsp;</asp:LinkButton>
                                    </td>
                                 </tr>
                              </ItemTemplate>
                          </asp:Repeater>
                       </tbody>
                    </table>
                    </div>
                    <asp:LinkButton runat="server" ID="lbtnAgregar" Visible="true"
                                    CssClass="btn btn-outline-info btn-xs" OnClick="lbtnAgregar_Click">
                                    <i class="fa fa-plus-circle display-4"></i>&nbsp;</asp:LinkButton>
                    <p class="card-text"<span class=" font-weight-bold ">
                       </span></p>
                </div>
                <div class="card-body">

                    <a class="btn btn-sm btn-outline-info" href='ListarMedicos.aspx'>Atras</a>
                </div>
            </div>

        </div>

        <div class=" col-md-6 py-5">

            <form>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblDias" Visible="false" runat="server" />
                        <asp:DropDownList ID="ddlDias" CssClass="form-control"  Visible="false" runat="server">
                            <asp:ListItem Value="1" Text="Lunes" />
                            <asp:ListItem Value="2" Text="Martes" />
                            <asp:ListItem Value="3" Text="Miercoles" />
                            <asp:ListItem Value="4" Text="Jueves" />
                            <asp:ListItem Value="5" Text="Viernes" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblTotalHoras" Text="Total de horas"  Visible="false" runat="server" />
                        <asp:TextBox ID="txtTHoras" CssClass="form-control" runat="server"
                             Visible="false" TextMode="Number" MaxLength="2" ValidationGroup="0-12" />
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblDuracion" Text="Duracion de turno"  Visible="false" runat="server" />
                        <asp:TextBox ID="txtDuracion" CssClass="form-control" runat="server"
                           Visible="false" TextMode="Number" />
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblIngreso" Text="Hora de ingreso"  Visible="false" runat="server" />
                        <asp:TextBox ID="txtIngreso" CssClass="form-control" runat="server"
                           Visible="false" TextMode="Number" />
                    </div>
                </div>

                <div class="form-group col-md-12 text-right">

                    <asp:Button Text="Guardar" OnClick="btnAgregar_Click" CssClass="card-link btn-sm btn-outline-success"
                        Visible="false" ID="btnAgregar" runat="server" />
                </div>
            </form>
        </div>
    </div>
    </div>


</asp:Content>
