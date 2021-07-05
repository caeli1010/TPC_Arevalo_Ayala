<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BajaMedico.aspx.cs" Inherits="Presentacion.BajaMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
     <hr class="py-1" />
    <h1 class="text-center">Deshabilitar Médico</h1>
    <div class="row alert alert-secondary">
        <div class="offset-md-4 col-md-4">
            <form>

                 <div class="form-row">
                     <div class="form-group col-md-12">
                        <asp:Label ID="lblApellido" Text="Apellidos" runat="server"/>
                         <asp:TextBox ID="txtApellido" Type="text" cssClass="form-control"  
                             ReadOnly="true"  ClientIDMode="Static" runat="server" /> 
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblNombre" Text="Nombres" runat="server" />
                         <asp:TextBox ID="txtNombre" Type="text" cssClass="form-control"  
                             ReadOnly="true" ClientIDMode="Static" runat="server" /> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                       <asp:Label ID="lblMatricula" Text="Matricula" runat="server" />
                        <asp:TextBox ID="txtMatricula" Type="text" cssClass="form-control" 
                            ReadOnly="true" runat="server" required="true"/> 
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Label ID="lblNDoc" Text="Nro de documento" runat="server" />
                        <asp:TextBox ID="txtDoc" type="Text" cssClass="form-control" 
                            ReadOnly="true" runat="server" required="true" />
                     </div>
                  </div>
                
                    <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" />
                     <a class="btn btn-sm btn-outline-danger" href='ListarMedicos.aspx'>Atras</a>
                   
            </form>
        </div>
    </div> 
</asp:Content>
