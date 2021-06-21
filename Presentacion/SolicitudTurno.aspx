<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SolicitudTurno.aspx.cs" Inherits="Presentacion.SolicitudTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <hr class="py-1" />
     <h1>Solicitud de Turnos</h1>
    <div class="row alert alert-secondary">
    <div class="offset-md-2 col-md-10">

    <form>
        <%-- Se mostrara los datos de un paciente por medio de un label --%>

         <div class="form-row">
            <div class="form-group col-md-12">
                <label for="espec">Especialidad</label>
                <select id="espec" class="form-control">
                    <option selected>Seleccione ...</option>
                    <option value="1">Medico clínico</option>
                    <option value="2">Urología</option>
                    <option value="3">Ginecología</option>
                    <option value="4">Nutricionista</option>
                </select>
            </div>
             <div class="form-group col-md-12">
                <label for="profesional">Profesional</label>
                <select id="profesional" class="form-control">
                    <option selected>Seleccione ...</option>
                    <option value="1">Arostegui Isidoro</option>
                    <option value="2">Miranda Maximiliano</option>
                    <option value="3">Arevalo Eugenio</option>
                    <option value="4">Ayala Elizabeth</option>
                </select>
            </div>
        </div>

       
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="turnosDisp"> Turnos disponibles </label>
                <input type="date" name="turnosDisp" class="form-control" id="turnosDisp">
            </div>
        </div>

            
        <button type="submit"  name="grabarTurno" class="btn btn-primary">Guardar</button>
    </form>
    </div>
    </div>

</asp:Content>
