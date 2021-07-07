<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarHorario.aspx.cs" Inherits="Presentacion.AgregarHorario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <h1>Agregar Horarios</h1>
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
                    <li class="list-group-item">DNI: <span class=" font-weight-bold ">
                        <asp:Label  ID="lblDni" runat="server" /></span> </li>
                    <li class="list-group-item">MATRICULA: <span class=" font-weight-bold">
                        <asp:Label ID="lblMatricula" type="number" runat="server" /></span> </li>
                    <li class="list-group-item">EMAIL: <span class="font-weight-bold ">
                        <asp:Label ID="lblEmail" runat="server" /> </span>  </li>
                </ul>
                <div class="card-body">
             
                <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <form>
                <div class="form-row">
                     <div class="form-group col-md-12">
                        <asp:Label ID="lblDias" Text="Dias" runat="server" />
                            <asp:DropDownList ID="ddlDias" CssClass="btn btn-otline-dark dropdown-toggle" runat="server">          
                                <asp:ListItem Value="1" Text="Lunes" />       
                                <asp:ListItem Value="2" Text="Martes" />       
                                <asp:ListItem Value="3" Text="Miercoles" />       
                                <asp:ListItem Value="4" Text="Jueves" />       
                                <asp:ListItem Value="5" Text="Viernes" />      
                            </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblTotalHoras" Text="Total de horas" runat="server" />
                        <asp:TextBox ID="txtTHoras" CssClass="form-control" runat="server" 
                            TextMode="Number" />
                     </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblDuracion" Text="Duracion de turno" runat="server" />
                        <asp:TextBox ID="txtDuracion" CssClass="form-control" runat="server"
                            TextMode="Number" />
                     </div>
                  </div>
              
                <div>   

                  <asp:Button Text="Agregar" OnClick="btnAgregar_Click" CssClass="card-link btn-sm  btn-danger" 
                      ID="btnAgregar"  runat="server" />
                </div>
                    <div class="form-group col-md-12">
                        <asp:Button ID="btnInsertarHorario" OnClick="btnInsertarHorario_Click"
                            Text="Insertar otro horario" CssClass="card-link btn-sm  btn-success" runat="server" />
                    </div>
            </form>
        </div>
    </div>


</asp:Content>
