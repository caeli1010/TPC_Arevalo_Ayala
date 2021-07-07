<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Presentacion.AltaPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr class="py-1" />
     <h1>Ingreso Nuevo Paciente</h1>
    <div class="row alert alert-info">
    <div class="offset-md-2 col-md-10">

    <form>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="tipodoc">Tipo Doc</label>
                <asp:DropDownList CssClass="form-control"   ID="ddlTipoDoc" runat="server">
                    <asp:ListItem Value="1" Text="DNI" />
                    <asp:ListItem Value="2" Text="LE" />
                    <asp:ListItem Value="3" Text="CI" />
                    <asp:ListItem Value="4" Text="CUIT" />
                </asp:DropDownList>
                
            </div>
            <div class="form-group col-md-6">
                <asp:Label Text="Nro Documento" runat="server" />
                <asp:TextBox runat="server"  ID="txtDni" CssClass="form-control"  />       
            </div> 
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label Text="Email"  runat="server" />
                <asp:TextBox runat="server"  type="email" ID="txtEmail" CssClass="form-control"  />
            </div>
             <div class="form-group col-md-6">
                 <asp:Label Text="Confirmar Email"  runat="server" />
                <asp:TextBox runat="server"  ID="txtConfEmail" CssClass="form-control"  TextMode="Email" />
            </div>
        </div>


        <div class="form-row">
            <div class="form-group col-md-6">
                 <asp:Label Text="Nombre"  runat="server" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"  />
               
               
            </div> 
            <div class="form-group col-md-6">
                  <asp:Label Text="Apellido"  runat="server" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
               
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label Text="Sexo" runat="server" />
                  <asp:DropDownList CssClass="form-control"  ID="ddlSexo" runat="server">
                    <asp:ListItem Value="F" Text="Femenino" />
                    <asp:ListItem Value="M" Text="Masculino" />
                    <asp:ListItem Value="O" Text="Otro" />
                </asp:DropDownList>
               
            </div>
            <div class="form-group col-md-6">
                 <asp:Label Text="Fecha de Nacimiento"  runat="server" />

                <asp:TextBox runat="server"
                ID="txtFechaNac" CssClass="form-control"  TextMode="Date" />
               
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label Text="Obra social" runat="server" />
                 <asp:DropDownList CssClass="form-control"   ID="ddlObraSocial" runat="server">
                    <asp:ListItem Value="1" Text="OSde" />
                    <asp:ListItem Value="2" Text="Swits medical" />
                    <asp:ListItem Value="3" Text="Galeno" />
                    <asp:ListItem Value="4" Text="Cemic" />
                </asp:DropDownList>

            </div>
            <div class="form-group col-md-6">
                   <asp:Label Text=" Nro Credencial "  runat="server" />
                <asp:TextBox runat="server" ID="txtNroCred" CssClass="form-control"  />
               
                </div>
        </div> 

        <div class="form-group">
            <div class="form-check">
                <asp:Label Text="Solicitar Turno" runat="server" />
                <asp:CheckBox Text="text" runat="server" />
             
            </div>
        </div>
        <asp:Button Text="Guardar Paciente" runat="server" ID="btnGuardar"  OnClick="btnGuardar_Click"/>
       
    </form>
    </div>
    </div>
</asp:Content>
