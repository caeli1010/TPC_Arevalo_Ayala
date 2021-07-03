﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="Presentacion.AltaMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <h1 class="text-center">Ingreso Nuevo Médico</h1>
    <div class="row alert alert-secondary">
        <div class="offset-md-1 col-md-10">

            <form>

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
                        <asp:TextBox ID="txtDoc" type="text" cssClass="form-control" runat="server" required="true" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="nDoc" runat="server"  />
                        </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEmail" Text="e-mail" runat="server" />
                        <asp:TextBox ID="txtEmail" type="email" cssClass="form-control" runat="server" required="true"/>
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtEmail" runat="server" />
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblCEmail" Text="Confirmar e-mail" runat="server" />
                        <asp:TextBox ID="txtCEmail" type="email" cssClass="form-control" runat="server" required="true"/>
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtCEmail" runat="server"  />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNombre" Text="Nombres" runat="server" />
                        <asp:TextBox ID="txtNombre" type="text" cssClass="form-control"  runat="server" required="true"/>
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtNombre" runat="server"  />
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblApellido" Text="Apellidos" runat="server"/>
                        <asp:TextBox ID="txtApellido" Type="text" cssClass="form-control" runat="server" required="true"/>
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtApellido" runat="server"  />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblSexo" Text="Sexo" runat="server" />
                        <asp:DropDownList ID="ddlSexo" runat="server">
                            <asp:ListItem Value="F" Text="Femenino" />
                            <asp:ListItem Value="M" Text="Masculino" />
                            <asp:ListItem Value="O" Text="Otro" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6">
                         <asp:Label ID="lblFechaNac" Text="Fecha Nacimiento" runat="server" />
                        <asp:TextBox ID="txtFechaNac" type="date" cssClass="form-control"  runat="server" required="true"/>
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtFechaNac" runat="server"  />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="espec">Especialidad</label>
                        <asp:Label ID="lblEspecialidad" Text="Especialidad" runat="server" />
                        <asp:DropDownList ID="ddlEspecialidad" runat="server">
                        </asp:DropDownList>
                           
                    </div>
                    <div class="form-group col-md-6">
                         <asp:Label ID="lblMatricula" Text="Matricula" runat="server" />
                        <asp:TextBox ID="txtMatricula" Type="text" cssClass="form-control" runat="server" required="true"/>
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtMatricula" runat="server"  />
                    </div>
                </div>
                     <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblFechaIngreso" Text="Fecha de ingreso" runat="server">
                         <asp:TextBox ID="txtFechaIngreso" Type="date" cssClass="form-control" runat="server" required="true"/>
                        </div>
                        </div>
                    <asp:Button Text="Guardar" ID="btnGrabarMedico" OnClick="btnGrabarMedico_Click" runat="server" />
            </form>
        </div>
    </div>

</asp:Content>
