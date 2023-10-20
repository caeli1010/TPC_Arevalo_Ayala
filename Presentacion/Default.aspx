<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" id="fondo">
        <div class="carousel-caption d-none d-md-block">
    <h1>Turnoasdadasasdasdasdasadss On line</h1>
    <p class="display-4">Gestión de turnos web para consultorios médicos</p>
  </div>
    </div>
  </div>
</div>
<%--    <div class="jumbotron">


        <h1>TURNOS WEB</h1>


    </div>--%>

    <div class="row">
        <div class="col-md-4 text-center text-uppercase">
            <h3>TURNOS</h3>
            <p>
                Aquí podrá ver el listado completo de los turnos pendientes.
            </p>
            <p>
                <a class="btn btn-outline-info" href="ListarTurnos.aspx"> Ir al Listado </a>
            </p>
        </div>
        <div class="col-md-4 text-center text-uppercase">
            <h3>PACIENTES</h3>
            <p>
                Aquí podrá ver el listado completo de los pacientes inscriptos.
            </p>
            <p>
                <a class="btn btn-outline-info" href="ListarPacientes.aspx">Ir al Listado  &raquo;</a>
            </p>
        </div>
        <div class="col-md-4 text-center text-uppercase">
            <h3>MEDICOS</h3>
            <p>
                Aquí podrá ver el listado completo de los medicos bajo convenio
            </p>
            <p>
                <a class="btn btn-outline-info" href="ListarMedicos.aspx">Ir al Listado  &raquo;</a>
            </p>
        </div>
    </div>
    <div class="row">
        <%--<div id="donut-chart"></div>--%>
    </div>
    <div class="row" style="display: none;">
        <div class="alert alert-danger col-md-6">
            <h5>Eli</h5>
            <asp:CheckBox Text="abm 1 especialidad" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="baja de especialidades" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="unificar botones en el menu NAVBAR" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="instalar datatable" Checked="TRUE" runat="server" />
            <hr />
              <asp:CheckBox Text="mostrar en hiperviculos los dias de atencion med" Checked="false" runat="server" />
            <hr />
              <asp:CheckBox Text="horarios ABM" Checked="true" runat="server" />
            <hr />

        </div>
        <div class="alert alert-info col-md-6">
            <h5>Euge</h5>
            <asp:CheckBox Text="reservar turnos front" Checked="true" runat="server" />
            <hr /> 
            <asp:CheckBox Text="reservar turnos" Checked="false" runat="server" />
            <hr />
            <asp:CheckBox Text="abm pacientes" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="listado de turno" Checked="true" runat="server" />  
            <hr />
            <asp:CheckBox Text="datatable paciente" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="abml usuarios" Checked="false" runat="server" />
            <hr />
            <asp:CheckBox Text="listado de turnos" Checked="false" runat="server" />
             <hr />
            <asp:CheckBox Text="pdf en data table" Checked="TRUE" runat="server" /> 
            <hr />
            <asp:CheckBox Text="agregar IDESPECIALIDAD_X_MEDICO en tabla TURNOS" Checked="true" runat="server" />
        </div>
    </div>
    

</asp:Content>
