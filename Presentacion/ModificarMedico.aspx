<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarMedico.aspx.cs" Inherits="Presentacion.ModificarMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<hr class="py-1" />
    <h1 class="text-center">Modificar Médico</h1>
    <div class="row alert alert-secondary">
        <div class="offset-md-1 col-md-10">

            <form>

             <div class="form-row">
                     <div class="form-group col-md-6">
                        <asp:Label ID="lblApellido" Text="Apellidos" runat="server"/>
                         <asp:TextBox ID="txtApellido" Type="text" cssClass="form-control"  ReadOnly="true"  ClientIDMode="Static" runat="server" /> 
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNombre" Text="Nombres" runat="server" />
                         <asp:TextBox ID="txtNombre" Type="text" cssClass="form-control"  ReadOnly="true" ClientIDMode="Static" runat="server" /> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblTipoDoc" Text="Tipo de documento" runat="server" />
                         <asp:TextBox ID="txtTipoDoc" Type="text" cssClass="form-control"  ReadOnly="true"  ClientIDMode="Static" runat="server" /> 
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNDoc" Text="Nro de documento" runat="server" />
                        <asp:TextBox ID="txtDoc" type="Text" cssClass="form-control" ReadOnly="true" runat="server" required="true" />
                     </div>
                  </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEmail" Text="e-mail" runat="server" />
                        <asp:TextBox ID="txtEmail" type="email" cssClass="form-control" ClientIDMode="Static" runat="server" required="true"/>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblCEmail" Text="Confirmar e-mail" runat="server" />
                        <asp:TextBox ID="txtCEmail" type="email" cssClass="form-control" ClientIdMode="Static" runat="server" required="true"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblFechaIngreso" Text="Fecha de ingreso" runat="server" />
                       <asp:TextBox ID="txtFechaIngreso" Type="date" cssClass="form-control" runat="server" required="true"/>   
                    </div>
                    <div class="form-group col-md-6">
                         <asp:Label ID="lblFechaNac" Text="Fecha Nacimiento" runat="server" />
                        <asp:TextBox ID="txtFechaNac" type="date" cssClass="form-control" runat="server" required="true"/>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEspecialidad" Text="Especialidad" runat="server" />
                        <asp:TextBox ID="txtEspecialidad" type="text" cssClass="form-control"  ReadOnly="true"  runat="server" required="true"/>     
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblSexo" Text="Sexo" runat="server" />
                        <asp:TextBox ID="txtSexo" type="text" cssClass="form-control" runat="server" required="true"/> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblMatricula" Text="Matricula" runat="server" />
                        <asp:TextBox ID="txtMatricula" Type="text" cssClass="form-control" ReadOnly="true" runat="server" required="true"/>
                     </div>
                 </div>
                    <asp:Button Text="Modificar" ID="btnModificarMedico" OnClick="btnModificarMedico_Click" runat="server" />
                  <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>    
                <asp:Button Text="Atras" ID="btnAtras" OnClick="btnAtras_Click" runat="server" />
            </form>
        </div>
    </div>

</asp:Content>
