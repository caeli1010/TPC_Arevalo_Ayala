﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarEspecialidad.aspx.cs" Inherits="Presentacion.ListarEspecialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <hr class="py-1" />
    <h3>Agregar Especialidad</h3>
    <div class="Especialidades">

         <div class="col-md-12">

            <form>

                <div class="form-row">
                   <div class="row alert alert-heading">
                    <div class="form-group col-md-8">
                        <table class="table">
                               <thead class="thead-dark">
                                  <tr>
                                    <th scope="col">Especialidad</th>
                                    <th scope="col">Medicos</th>
                                   </tr>
                                </thead>
                                <tbody>
                                       <asp:Repeater runat="server" ID="repetidor">
                                           <ItemTemplate>   
                                     <tr>
                                                <th><%#Eval("nombre")%></th>
                                                    <%foreach (Dominio.Medico item in doctor)
                                                        {%>
                                                <td>
                                                            <asp:Label ID="txtNombre" text="<% =item.nombre %>" runat="server" /></br>
                                                </td> 
                                                       <%} %>
                                    </tr>
                                           </ItemTemplate>
                                       </asp:Repeater>
                                </tbody>
                        </table>
                    </div>
                </div>
            </div>
                
            </form>
           <div class="form-row">

        <div class="col-md-4">
            <div class="card" >
              
                <div class="card-body">
                    <hr />
                    <asp:Button ID="btnModificar" Text="Modificar Especialidad" 
                        OnClick="btnModificar_Click" runat="server" />
                </div>
                 <div class="card-body">
                    <hr />
                    <asp:Button ID="btn" Text="Modificar Especialidad" 
                        OnClick="btnModificar_Click" runat="server" />
                </div>
                 <div class="card-body">
                    <hr />
                    <asp:Button ID="Button2" Text="Modificar Especialidad" 
                        OnClick="btnModificar_Click" runat="server" />
                </div>
                <div class="card-body">
             
                <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>
                </div>
            </div>

        </div>

    </div>
  </div>
</div>
</asp:Content>
