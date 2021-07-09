<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarEspecialidad.aspx.cs" Inherits="Presentacion.AgregarEspecialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <hr class="py-1" />
    <h3>Agregar Especialidad</h3>
    <div class="row alert alert-secondary">
        <div class="col-md-6">
            <div class="card" >
                <%--<img class="card-img-top mx-auto d-block py-3" style="width: 24%;" src="https://www.adl-logistica.org/wp-content/uploads/2019/07/imagen-perfil-sin-foto.png" alt="Card image cap">--%>
                <div class="card-body">
                    <hr />
                    <h5 class="card-title">Medico</h5><p><strong><span><asp:Label ID="lblNombre" runat="server" /></span></strong></p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Especialidades:<br /> <span class=" font-weight-bold ">
                        <asp:Repeater runat="server" ID="repetidor">
                            <ItemTemplate>  
                        <asp:Label Text='<%#Eval("nombre")%>' runat="server" /><br />

                            </ItemTemplate>
                        </asp:Repeater>
                        </span> </li>
                </ul>
                <div class="card-body">
             
                <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <form>

                <div class="form-row">

                    <div class="form-group col-md-12">
                        <asp:Button ID="btnAgregarEspecialidad" OnClick="btnAgregarEspecialidad_Click" 
                            Text="Agregar Especialidad" CssClass="card-link btn-sm  btn-danger" runat="server" />
                        <asp:Label ID="lblEspecialidad" visible="false" Text="Especialidad" runat="server" />
                            <asp:DropDownList ID="ddlEspecialidad" Visible="false" CssClass="form-control" runat="server" 
                                 OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">          
                            </asp:DropDownList>
                    </div>
                </div>

                <div class="form-row">

                    <div class="form-group col-md-12">
                        <asp:Button ID="btnNEspecialidad" OnClick="btnNEspecialidad_Click"
                            Text="Nueva Especialidad" Visible="false" CssClass="card-link btn-sm  btn-danger" runat="server" />
                        <asp:Label ID="lblNEspecialidad" visible="false" Text="Nueva Especialidad" runat="server" />
                        <asp:TextBox ID="txtNEspecialidad" CssClass="form-control" runat="server" />  
                    </div>
                </div>

                  <asp:Button Text="Guardar" CssClass="card-link btn-sm  btn-danger" 
                      ID="btnGuardar"  runat="server" Visible="false" OnClick="btnGuardar_Click1" />

                <asp:Button Text="Habilitar" Visible="false" CssClass="card-link btn-sm  btn-danger" 
                    ID="btnHabilitar" Onclick="btnHabilitar_Click" runat="server" />

            </form>
        </div>
    </div>



</asp:Content>
