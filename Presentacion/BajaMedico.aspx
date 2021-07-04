<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BajaMedico.aspx.cs" Inherits="Presentacion.BajaMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <hr class="py-1" />
    <h1 class="text-center">Ingreso Nuevo Médico</h1>
    <div class="row alert alert-secondary">
        <div class="offset-md-1 col-md-10">

            <form>

                 <div class="form-row">
                     <div class="form-group col-md-6">
                        <asp:Label ID="lblApellido" Text="Apellidos" runat="server"/>
                        <asp:DropDownList ID="ddlApellido" OnselectedIndexChanged="ddlApellido_SelectedIndexChanged" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNombre" Text="Nombres" runat="server" />
                        <asp:DropDownList ID="ddlNombre" OnSelectedIndexChanged="ddlNombre_SelectedIndexChanged" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblTipoDoc" Text="Tipo de documento" runat="server" />
                        <asp:DropDownList ID="ddlTipoDoc" runat="server">
                            <asp:ListItem value="1" Text="DNI" />
                            <asp:ListItem Value="2" Text="LE" />
                            <asp:ListItem Value="3" Text="CI" />
                            <asp:ListItem Value="4" Text="CUIT" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNDoc" Text="Nro de documento" runat="server" />
                        <asp:TextBox ID="txtDoc" type="Text" cssClass="form-control" runat="server" required="true" />
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
                        <asp:TextBox ID="txtFechaNac" type="date" cssClass="form-control"  runat="server" required="true"/>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEspecialidad" Text="Especialidad" runat="server" />
                        <asp:DropDownList ID="ddlEspecialidad" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged" runat="server">
                        </asp:DropDownList>      
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblSexo" Text="Sexo" runat="server" />
                       <asp:DropDownList ID="ddlSexo" runat="server">
                            <asp:ListItem Value="F" Text="Femenino" />
                            <asp:ListItem Value="M" Text="Masculino" />
                            <asp:ListItem Value="O" Text="Otro" />
                        </asp:DropDownList>  
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblMatricula" Text="Matricula" runat="server" />
                        <asp:TextBox ID="txtMatricula" Type="text" cssClass="form-control" runat="server" required="true"/>
                     </div>
                 </div>
                    <asp:Button Text="Guardar" ID="btnGrabarMedico" OnClientClick="return validad()" OnClick="btnGrabarMedico_Click" runat="server" />
            </form>
        </div>
    </div>
</asp:Content>
