<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="Presentacion.AltaMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <h1 class="text-center">Ingreso Nuevo Médico</h1>
    <div class="row alert alert-secondary">
        <div class="offset-md-1 col-md-10">

            <form>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblTipoDoc" Text="Tipo de documento" runat="server" />
                        <asp:DropDownList ID="ddlTipoDoc" cssClass="form-control" runat="server">
                            <asp:ListItem value="1" Text="DNI" />
                            <asp:ListItem Value="2" Text="LE" />
                            <asp:ListItem Value="3" Text="CI" />
                            <asp:ListItem Value="4" Text="CUIT" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNDoc" Text="Nro de documento" runat="server" />
                        <asp:TextBox ID="txtDoc" type="Text" cssClass="form-control" runat="server" />
                     </div>
                  </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEmail" Text="e-mail" runat="server" />
                        <asp:TextBox ID="txtEmail" CssClass="form-control"
                            ClientIDMode="Static" runat="server" TextMode="Email" />
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblCEmail" Text="Confirmar e-mail" runat="server" />
                        <asp:TextBox ID="txtCEmail" CssClass="form-control"
                            ClientIDMode="Static" runat="server" TextMode="Email" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNombre" Text="Nombres" runat="server" />
                        <asp:TextBox ID="txtNombre" type="text" cssClass="form-control" 
                            runat="server"/>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblApellido" Text="Apellidos" runat="server"/>
                        <asp:TextBox ID="txtApellido" Type="text" cssClass="form-control"
                            runat="server" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblFechaIngreso" Text="Fecha de ingreso" runat="server" />
                       <asp:TextBox ID="txtFechaIngreso" TextMode="Date" cssClass="form-control" 
                           runat="server"/>   
                    </div>
                    <div class="form-group col-md-6">
                         <asp:Label ID="lblFechaNac" Text="Fecha Nacimiento" runat="server" />
                        <asp:TextBox ID="txtFechaNac" CssClass="form-control"
                            runat="server" TextMode="Date" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEspecialidad" Text="Especialidad" runat="server" />
                        <asp:DropDownList ID="ddlEspecialidad" cssClass="form-control" 
                            OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged" runat="server">
                        </asp:DropDownList>      
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblSexo" Text="Sexo" runat="server" />
                       <asp:DropDownList ID="ddlSexo" runat="server" CssClass="dropdown-toggle form-control">
                            <asp:ListItem Value="F" Text="Femenino" />
                            <asp:ListItem Value="M" Text="Masculino" />
                            <asp:ListItem Value="O" Text="Otro" />
                        </asp:DropDownList>  
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblMatricula" Text="Matricula" runat="server" />
                        <asp:TextBox ID="txtMatricula"  cssClass="form-control" runat="server"/>
                     </div>
                 </div>
                    <asp:Button Text="Guardar" ID="btnGrabarMedico" OnClick="btnGrabarMedico_Click" runat="server" />
                     <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>
                </form>
        </div>
    </div>

</asp:Content>
