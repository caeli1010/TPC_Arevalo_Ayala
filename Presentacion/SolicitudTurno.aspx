<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SolicitudTurno.aspx.cs" Inherits="Presentacion.SolicitudTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
     <h3 class="text-center">Solicitud de Turnos</h3>
    <div class="row alert alert-secondary col-md-8 offset-md-2">
        <div class="col-md-6">
            <div class="card" >
                <img class="card-img-top mx-auto d-block py-3" style="width: 24%;" 
                    src="image/perfil.png" alt="Card image cap">
                <div class="card-body">
    
                    <h4 class="card-title">Paciente: <asp:Label ID="lblNombre" runat="server" /></h4>
                   
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        DNI: <span class=" font-weight-bold ">
                        <asp:Label  ID="lblDni" runat="server" /></span> 
                    </li>
                    <li class="list-group-item">
                        OBRA SOCIAL: <span class=" font-weight-bold">
                        <asp:Label ID="lblObraSocial" runat="server" /></span> 
                    </li>
                    <li class="list-group-item">
                        EMAIL: <span class="font-weight-bold ">
                        <asp:Label ID="lblEmail" runat="server" /> </span>
                    </li>
                </ul>
                <div class="card-body">
                    <asp:Button Text="Modificar Datos" 
                        CssClass="card-link btn-sm btn-outline-secondary"  
                        ID="btnModificar"  runat="server" />
             
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <form>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="espec">Especialidad</label>
                        <asp:DropDownList ID="ddlEspecialidad"  CssClass="form-control" runat="server">
                            <asp:ListItem Text="text1" />
                            <asp:ListItem Text="text2" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="profesional">Profesional</label>
                        <asp:DropDownList ID="ddlProfesional"  
                            OnSelectedIndexChanged="ddlProfesional_SelectedIndexChanged"
                            CssClass="form-control" runat="server">
                            <asp:ListItem Text="text1" />
                            <asp:ListItem Text="text2" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="turnosDisp">Turnos disponibles </label>
                        <asp:TextBox runat="server" ID="txtFecha"  CssClass="form-control" TextMode="Date" />
                    </div>
                </div>
                <div class="row ">
                 <div class="text-right col-md-12 ">
                <asp:Button 
                    Text="Agendar Turno" 
                    CssClass="btn btn-outline-info"
                    ID="btnAgendar" 
                    Visible="true" 
                    runat="server" />
                </div>
                </div>
            </form>
        </div>
    </div>

</asp:Content>
