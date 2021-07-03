<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BajaMedico.aspx.cs" Inherits="Presentacion.BajaMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <hr class="py-1" />
    <h1 class="text-center">Ingreso Nuevo Médico</h1>
    <div class="row alert alert-secondary">
        <div class="offset-md-1 col-md-10">

            <form>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblTipoDoc" Text="Tipo de documento" runat="server" />
                        <select id="tipodoc" class="form-control">
                            <option selected>Seleccione ...</option>
                            <option value="1">DNI</option>
                            <option value="2">LE</option>
                            <option value="3">CI</option>
                            <option value="4">CUIT</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNDoc" Text="Nro de documento" runat="server" />
                        <asp:TextBox ID="txtDoc" cssClass="form-control" MaxLength="13" runat="server" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="nDoc" runat="server" MaximumValue="13" MinimumValue="0" />
                        </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEmail" Text="e-mail" runat="server" />
                        <asp:TextBox ID="txtEmail"  cssClass="form-control" runat="server" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtEmail" runat="server" />
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblCEmail" Text="Confirmar e-mail" runat="server" />
                        <asp:TextBox ID="txtCEmail"  cssClass="form-control" runat="server" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtCEmail" runat="server"  />
                    </div>
                </div>


                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblNombre" Text="Nombres" runat="server" />
                        <asp:TextBox ID="txtNombre"  cssClass="form-control"  runat="server" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtNombre" runat="server"  />
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblApellido" Text="Apellidos" runat="server" />
                        <asp:TextBox ID="txtApellido" cssClass="form-control"  runat="server" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtApellido" runat="server"  />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="sexo">Sexo</label>
                        <select id="sexo" class="form-control">
                            <option selected>Seleccione ...</option>
                            <option value="F">Femenino</option>
                            <option value="M">Masculino</option>
                            <option value="O">Otro</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                         <asp:Label ID="lblFechaNac" Text="Fecha Nacimiento" runat="server" />
                        <asp:TextBox ID="txtFechaNac" cssClass="form-control"  runat="server" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtFechaNac" runat="server"  />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="espec">Especialidad</label>
                        <select id="espec" class="form-control">
                            <option selected>Seleccione ...</option>
                            <option value="1">Medico clínico</option>
                            <option value="2">Urología</option>
                            <option value="3">Ginecología</option>
                            <option value="4">Nutricionista</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                         <asp:Label ID="lblMatricula" Text="Apellidos" runat="server" />
                        <asp:TextBox ID="txtMatricula" cssClass="form-control"  runat="server" />
                        <asp:RangeValidator ErrorMessage="Debe completar el campo" ControlToValidate="txtMatricula" runat="server"  />
                    </div>
                </div>

                <%-- <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class="form-check-label" for="gridCheck">
                   
                </label>
            </div>
        </div>--%>
                    <asp:Button Text="Guardar" ID="btnGrabarMedico" OnClick="btnGrabarMedico_Click" runat="server" />
            </form>
        </div>
    </div>
</asp:Content>
