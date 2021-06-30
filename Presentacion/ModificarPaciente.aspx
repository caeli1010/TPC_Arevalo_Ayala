<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarPaciente.aspx.cs" Inherits="Presentacion.ModificarPaciente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr class="py-1" />
     <h1 class=" text-center">Modificar Paciente</h1>
    <div class="row ">
    <div class="offset-md-3 col-md-6">

    <form>
        <div class="form-row">
            
            <div class="form-group col-md-12">
                <label for="nDoc"> Nro Documento </label>
                <asp:TextBox runat="server"  CssClass="form-control" ID="txtDNI"/>
            </div> 
        </div>

        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="email">Email</label>
                 <asp:TextBox runat="server"  CssClass="form-control"  ID="txtEmail"/>
            </div>
             
        </div>


        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="nombre"> Nombre </label>
                 <asp:TextBox runat="server"  CssClass="form-control" ReadOnly="true" ID="txtPaciente"/>
            </div> 
  
        </div>

        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="sexo">Sexo</label>
                <asp:TextBox runat="server"  CssClass="form-control" ReadOnly="true" ID="txtGenero"/>
            </div>
            
        </div>

        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="obSoc">Obra social</label>
                <asp:TextBox runat="server" Text="" ID="cbxObraSocial"   CssClass="form-control"/>
                <%--<select id="obSoc" class="form-control">
                    <option selected>Seleccione ...</option>
                    <option value="osde">OSde</option>
                    <option value="Swit Medical">Swits medical</option>
                    <option value="3">Galeno</option>
                    <option value="4">Cemic</option>
                </select>--%>
            </div>
            </div>
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="nCred"> Nro Credencial </label>
                <asp:TextBox runat="server" ID="txtNroCarnet" Text="" CssClass="form-control" />
                
            </div>
        </div> 

        <asp:Button Text="Modificar" CssClass="btn btn-primary" OnClick="btnModificarPte" runat="server" />
       
    </form>
    </div>
    </div>
</asp:Content>
