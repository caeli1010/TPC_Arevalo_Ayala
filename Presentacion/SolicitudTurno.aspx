<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SolicitudTurno.aspx.cs" Inherits="Presentacion.SolicitudTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <h1>Solicitud de Turnos</h1>
    <div class="row alert alert-secondary">
        <div class="col-md-6">
            <div class="card" >
                <img class="card-img-top mx-auto d-block py-3" style="width: 24%;" src="https://www.adl-logistica.org/wp-content/uploads/2019/07/imagen-perfil-sin-foto.png" alt="Card image cap">
                <div class="card-body">
                    <hr />
                    <h4 class="card-title">Identidad del Paciente</h4>
                    <p class="card-text">NOMBRE y APELLIDO : <% =Request.QueryString["paciente"] %></p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">DNI: <span class=""><% =Request.QueryString["dni"] %></></span> </li>
                    <li class="list-group-item">OBRA SOCIAL:<span class=""><% =Request.QueryString["obsoc"] %></span> </li>
                    <li class="list-group-item">NUMERO CARNET: <span class=" "><% =Request.QueryString["carnet"] %> </span></li>
                    <li class="list-group-item">EMAIL: <span class=""><% =Request.QueryString["email"] %> </span>  </li>
                </ul>
                <div class="card-body">
                    <a href="#" class="card-link badge btn-sm badge-warning">Modificar Datos</a>
                    <a href="#" class="card-link badge btn-sm badge-info">Enviar mensaje</a>
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <form>
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="espec">Especialidad</label>
                        <select id="espec" class="form-control" required>
                            <option selected>Seleccione ...</option>
                            <option value="1">Medico clínico</option>
                            <option value="2">Urología</option>
                            <option value="3">Ginecología</option>
                            <option value="4">Nutricionista</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">

                    <div class="form-group col-md-6">

                        <label for="profesional">Profesional</label>
                        <select id="profesional" class="form-control" required>
                            <option selected>Seleccione ...</option>
                            <option value="1">Arostegui Isidoro</option>
                            <option value="2">Miranda Maximiliano</option>
                            <option value="3">Arevalo Eugenio</option>
                            <option value="4">Ayala Elizabeth</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="turnosDisp">Turnos disponibles </label>
                        <input type="date" name="turnosDisp" class="form-control" id="turnosDisp" required>
                    </div>
                </div>


                <button type="submit" name="grabarTurno" class="btn btn-success">Agendar</button>
            </form>
        </div>
    </div>

</asp:Content>
