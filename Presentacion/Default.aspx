<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>TURNOS WEB</h1>


    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>TURNOS</h2>
            <p>
                Aquí podrá ver el listado completo de los turnos pendientes.
            </p>
            <p>
                <a class="btn btn-default" href="~/Turnos">Ir &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>PACIENTES</h2>
            <p>
                Aquí podrá ver el listado completo de los pacientes inscriptos.
            </p>
            <p>
                <a class="btn btn-default" href="~/Pacientes">Ir &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>MEDICOS</h2>
            <p>
                Aquí podrá ver el listado completo de los medicos bajo convenio
            </p>
            <p>
                <a class="btn btn-default" href="~/Medicos">Ver Más &raquo;</a>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="alert alert-danger col-md-6">
            <h5>Eli</h5>
            <asp:CheckBox Text="abm 1 especialidad" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="baja de especialidades" Checked="false" runat="server" />
            <hr />
            <asp:CheckBox Text="unificar botones en el menu NAVBAR" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="instalar datatable" Checked="TRUE" runat="server" />
            <hr />
              <asp:CheckBox Text="mostrar en hiperviculos los dias de atencion med" Checked="false" runat="server" />
            <hr />

        </div>
        <div class="alert alert-info col-md-6">
            <h5>Euge</h5>
            <asp:CheckBox Text="reservar turnos" Checked="false" runat="server" />
            <hr />
            <asp:CheckBox Text="eliminar pacietes" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="modificar pacientes" Checked="false" runat="server" />
            <hr />
            <asp:CheckBox Text="listado de turno" Checked="false" runat="server" />  
            <hr />
            <asp:CheckBox Text="datatable paciente" Checked="true" runat="server" />
            <hr />
            <asp:CheckBox Text="abml usuarios" Checked="false" runat="server" />
            <hr />
            <asp:CheckBox Text="abml usuarios" Checked="false" runat="server" />
            <hr />
            <asp:CheckBox Text="listado de turnos" Checked="false" runat="server" />
             <hr />
            <asp:CheckBox Text="pdf en data table" Checked="false" runat="server" />
        </div>
    </div>


</asp:Content>
