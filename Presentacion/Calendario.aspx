<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendario.aspx.cs" Inherits="Presentacion.Calendario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <hr class="py-1" />
    <h1 class="text-center">Pseudo calendario  </h1>
   
    <div class="row ">
        <div class="col-4 text-left "> << anterior </div>
        <div class="col-4 text-center"> MES </div>
        <div class="col-4 text-right"> siguiente >> </div>
    </div>
        <hr class="py-1" />
    <div class="row">
        <div class="col-1 "> </div>
        <div class="col-1 "> </div>
        <div class="col-1 "> Lunes</div>
        <div class="col-1"> Martes</div>
        <div class="col-1"> Miercoles</div>
        <div class="col-1"> Jueves</div>
        <div class="col-1"> Viernes</div>
        <div class="col-1"> Sabado</div>
        <div class="col-1"> Domingo</div>

    </div>
    <% for (int i = 1; i < 6; i++)
        { %>  
            <div class="row">
                
        <div class="col-1 py-4 "> </div>
        <div class="col-1 py-4 "></div>
        <% for (int j = 1; j < 8; j++)
            { %>
            
        <div class="col-1 py-4 border btn btn-info"> </div>

          <% } %>
        </div>
    <% } %>
  

</asp:Content>
