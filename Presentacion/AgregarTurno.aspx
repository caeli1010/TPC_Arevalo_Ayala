﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarTurno.aspx.cs" Inherits="Presentacion.AgregarTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<asp:ScriptManager  runat="server" />--%>
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
                    <a href='ModificarPaciente?ipc=<% =Session["idPaciente"]%>' 
                        class="btn btn-sm btn-outline-secondary" 
                        title="Modificar datos de este Paciente" >
                                       Modificar Datos <i class="fa fa-user-edit"  ></i>
                                    </a>
                    <%--<asp:Button Text="Modificar Datos" 
                        CssClass="card-link btn-sm btn-outline-secondary"  
                        ID="btnModificar"  runat="server" />--%>
             
                </div>
            </div>

        </div>
        <div class="col-md-6">

            <form>
           <%-- <asp:UpdatePanel runat="server">
                <ContentTemplate>--%>
                <asp:Label ID="lblTurno" Visible="true" runat="server" />
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="espec">Especialidad</label>
                        <asp:Label ID="lblEspecialidad" Visible="false" runat="server" />
                        <asp:DropDownList 
                            ID="ddlEspecialidad" 
                            Visible="true"
                            OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged"
                            AutoPostBack="true"
                            CssClass="form-control" 
                            runat="server">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <asp:Label Text="Profesional"  Visible="false"  ID="lblProfesional" runat="server" />
                          <asp:Label ID="lblMedico" Visible="false" runat="server" />
                        <asp:DropDownList 
                            ID="ddlProfesional" 
                            Visible="false"
                              AutoPostBack="true"
                            OnSelectedIndexChanged="ddlProfesional_SelectedIndexChanged"
                            CssClass="form-control" 
                            runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
              
                 <div class="form-row">
                    <div class="form-group col-md-12">
                        <asp:Label Text="Dias " ID="lblDias" Visible="false" runat="server" />
                        <asp:TextBox runat="server" 
                            ID="clndFecha" 
                            Visible="false"
                             AutoPostBack="true"
                            CssClass="form-control" 
                            OnTextChanged="clndFecha_TextChanged"
                            TextMode="Date" />
                           
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        
                        <asp:Label Text="Horario" ID="lblHorario"  Visible="false"  runat="server" />
                        <asp:DropDownList runat="server"
                            Visible="false" 
                              AutoPostBack="true"
                            ID="ddlHorario"
                            OnSelectedIndexChanged="ddlHorario_SelectedIndexChanged"
                            CssClass="form-control" >
<%--                            <asp:ListItem Text="Seleccionar un horario" />
                            <asp:ListItem Text="14" />
                            <asp:ListItem Text="15" />
                            <asp:ListItem Text="16" />
                            <asp:ListItem Text="17" />--%>
                        </asp:DropDownList>
                        <asp:Label Text="Minutos" ID="lblMin"  Visible="false"  runat="server" />
                        <asp:DropDownList runat="server" 
                            ID="ddlMin" 
                             Visible="false" 
                             CssClass="form-control"
                            OnSelectedIndexChanged="ddlMin_SelectedIndexChanged"
                            AutoPostBack="true">
<%--                            <asp:ListItem Text="00" />
                            <asp:ListItem Text="15" />
                            <asp:ListItem Text="30" />
                            <asp:ListItem Text="45" />--%>
                        </asp:DropDownList>
                    </div>
                </div>
                 <%-- </ContentTemplate>
    </asp:UpdatePanel>--%> 
                <div class="row ">
                 <div class="text-right col-md-12 ">
                <asp:Button 
                    Visible="false" 
                    Text="Agendar Turno" 
                    CssClass="btn btn-outline-info"
                    ID="btnAgendar" OnClick="btnAgendar_Click"
                    
                    runat="server"  />
                     <asp:Button 
                    Visible="false" 
                    Text="Reprogramar Turno" 
                    CssClass="btn btn-outline-info"
                    ID="btnReprogramar" OnClick="btnReprogramar_Click"
                    
                    runat="server"  />
                     <asp:Button 
                    Visible="false" 
                    Text="Volver" 
                    CssClass="btn btn-outline-info"
                    ID="btnVolver" OnClick="btnVolver_Click"
                    
                    runat="server"  />
                </div>
                </div>
            </form>
        </div>
    </div>
 
</asp:Content>
