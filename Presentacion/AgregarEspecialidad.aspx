<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarEspecialidad.aspx.cs" Inherits="Presentacion.AgregarEspecialidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>    
        if (getParameterByName('d') !== null) {
            document.getElementById("esconder").style.display = "none";

        }


    </script>
    <h3 id="h3Espec">Agregar Especialidad</h3>
    <% if (lblMensaje.Visible == true)
        { %>
    <div class="alert alert-success text-center">

        <asp:Label Visible="false" runat="server" ID="lblMensaje" />
    </div>
    <% } %>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <div class="row alert alert-secondary">
        <div class="col-md-6">
            <div id="esconder" class="card">
                <div class="card-body">
                    <hr />
                    <h5 id="h5Medico" visible="true" class="card-title">Medico: </h5>
                    <p>
                        <strong><span>
                            <asp:Label ID="lblNombre" Visible="true" runat="server" /></span></strong>
                    </p>
                </div>
                <ul class="list-group list-group-flush">
                    <li id="liEspecialidad" class="list-group-item">Especialidades:<br />
                        <span class=" font-weight-bold ">
                            <asp:Repeater runat="server" Visible="true" ID="repetidor">
                                <ItemTemplate>
                                    <asp:Label ID="lblNombreEsp" Visible="true" Text='<%#Eval("nombre")%>' runat="server" /><br />

                                </ItemTemplate>
                            </asp:Repeater>
                        </span>

                    </li>
                </ul>
                <div class="card-body">

                    <a class="btn btn-sm btn-outline-danger" visible="true" href='ListarMedicos.aspx'>Atras</a>
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <form>

                <div class="form-row">

                    <div class="form-group col-md-12">

                        <asp:Button ID="btnAgregarEspecialidad" OnClick="btnAgregarEspecialidad_Click"
                            Visible="true" Text="Agregar Especialidad"
                            CssClass="card-link btn-sm  btn-info" runat="server" />

                        <asp:Label ID="lblEspecialidad" Visible="false" runat="server" />

                        <div class=" form-row">
                            <div class="col-md-11">
                                <asp:DropDownList ID="ddlEspecialidad" Visible="false" CssClass="form-control"
                                    runat="server" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1">
                                <asp:LinkButton runat="server" ID="lbtnNEspecialidad" Visible="false"
                                    CssClass="btn btn-outline-success btn-sm" OnClick="lbtnNEspecialidad_Click">
                                    <i class="fa fa-plus display-5"></i>&nbsp;</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">

                    <div class="form-group col-md-12">
                        <asp:Label ID="lblNEspecialidad" Visible="false" Text="Especialidad" runat="server" />
                        <asp:TextBox ID="txtEspecialidad" Visible="false" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="text-center">
                        <asp:Button ID="btnElEspecialidad" OnClick="btnElEspecialidad_Click"
                            Text="Eliminar" Visible="false" CssClass="card-link btn-sm  btn-success"
                            runat="server" />

                        <asp:Button ID="btnModEspecialidad" OnClick="btnModEspecialidad_Click"
                            Text="Modificar" Visible="false" CssClass="card-link btn-sm  btn-success"
                            runat="server" />
                    </div>
                </div>
                <div class="text-right">

                    <asp:Button Text="Guardar" CssClass="card-link btn-sm  btn-success"
                        ID="btnGuardar" runat="server" Visible="false" OnClick="btnGuardar_Click" />

                    <asp:Button Text="Aceptar" Visible="false" CssClass="card-link btn-sm  btn-info"
                        ID="btnHabilitar" OnClick="btnHabilitar_Click" runat="server" />
                </div>

            </form>
        </div>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
