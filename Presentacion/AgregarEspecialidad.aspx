﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarEspecialidad.aspx.cs" Inherits="Presentacion.AgregarEspecialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <hr class="py-1" />
    <h1>Agregar Especialidad</h1>
    <div class="row alert alert-secondary">
        <div class="col-md-6">
            <div class="card" >
                <img class="card-img-top mx-auto d-block py-3" style="width: 24%;" src="https://www.adl-logistica.org/wp-content/uploads/2019/07/imagen-perfil-sin-foto.png" alt="Card image cap">
                <div class="card-body">
                    <hr />
                    <h4 class="card-title">Identidad del Medico</h4>
                    <p class="card-text">NOMBRE y APELLIDO :<span class=" font-weight-bold "> <asp:Label ID="lblNombre" runat="server" /></span></p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">DNI: <span class=" font-weight-bold "><asp:Label  ID="lblDni" runat="server" /></span> </li>
                    <li class="list-group-item">MATRICULA: <span class=" font-weight-bold"><asp:Label ID="lblMatricula" runat="server" /></span> </li>
                    <li class="list-group-item">EMAIL: <span class="font-weight-bold "><asp:Label ID="lblEmail" runat="server" /> </span>  </li>
                </ul>
                <div class="card-body">
             
                    <a href="#" class="card-link badge btn-sm badge-info">Enviar mensaje</a>
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <form>
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="espec">Especialidad</label>
                            <asp:DropDownList ID="ddlEspecialidad" runat="server">
                                <asp:ListItem Selected="True" />
                            </asp:DropDownList>
                    </div>
                </div>

                  <asp:Button Text="Agregar" CssClass="card-link btn-sm  btn-danger"  ID="btnAgregar"  runat="server" OnClick="btnAgregar_Click" />
            
            </form>
        </div>
    </div>



</asp:Content>
