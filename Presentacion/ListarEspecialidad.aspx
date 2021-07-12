<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarEspecialidad.aspx.cs" Inherits="Presentacion.ListarEspecialidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <h3>Especialidades</h3>
    <div class="Especialidades">

        <div class="col-md-12">

            <form>

                <div class="form-row">
                    <div class="row alert alert-heading">
                        <div class="form-group col-md-12">
                            <table class="table table-responsive table-bordered">
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
            <div class="form-row">

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <hr />
                            <asp:Button ID="btnModificar" Text="Modificar Especialidad"
                                OnClick="btnModificar_Click" runat="server" />
                        </div>
                        <div class="card-body">
                            <hr />
                            <asp:Button ID="btn" Text="Modificar Especialidad"
                                OnClick="btnModificar_Click" runat="server" />
                        </div>
                        <div class="card-body">
                            <hr />
                            <asp:Button ID="Button2" Text="Modificar Especialidad"
                                OnClick="btnModificar_Click" runat="server" />
                        </div>
                        <div class="card-body">

                            <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>
