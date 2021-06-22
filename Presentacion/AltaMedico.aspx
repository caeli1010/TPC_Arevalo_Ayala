<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="Presentacion.AltaMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <h1 class="text-center">Ingreso Nuevo Médico</h1>
    <div class="row alert alert-secondary">
    <div class="offset-md-1 col-md-10">

    <form>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="tipodoc">Tipo Doc</label>
                <select id="tipodoc" class="form-control">
                    <option selected>Seleccione ...</option>
                    <option value="1">DNI</option>
                    <option value="2">LE</option>
                    <option value="3">CI</option>
                    <option value="4">CUIT</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="nDoc"> Nro Documento </label>
                <input type="text" name="nDoc" class="form-control" id="nDoc">
            </div> 
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="email">Email</label>
                <input name="email" type="email" class="form-control" id="email">
            </div>
             <div class="form-group col-md-6">
                <label for="cEmail">Confirmar Email</label>
                <input name="cEmail" type="email" class="form-control" id="cEmail">
            </div>
        </div>


        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="nombre"> Nombre </label>
                <input type="text" name="nombre" class="form-control" id="nombre">
            </div> 
            <div class="form-group col-md-6">
                <label for="apellido"> Apellido </label>
                <input type="text" name="apellido" class="form-control" id="apellido">
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
                <label for="fechaNac"> Fecha de Nacimiento </label>
                <input type="date" name="fechaNac" class="form-control" id="fechaNac">
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
                <label for="nMatricula"> Nro Matricula </label>
                <input type="text" name="nMatricula" class="form-control" id="nMatricula">
            </div>
        </div> 

       <%-- <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class="form-check-label" for="gridCheck">
                   
                </label>
            </div>
        </div>--%>
        <button type="submit"  name="grabarMedico" class="btn btn-primary">Guardar</button>
    </form>
    </div>
    </div>

</asp:Content>
