<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentacion.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr class="py-1" />
    <h1 class="text-center">Ingreso Nuevo Médico</h1>
    <div class="row alert alert-secondary">
        <div class="offset-md-4 col-md-4">

            <form>
                <div class="form-group">
                    <label for="nombre">Username</label>
                    <input type="username" class="form-control" id="nombre">
                </div>
                <div class="form-group">
                    <label for="contrasenia">Password</label>
                    <input type="password" class="form-control" id="contrasenia">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="check" aria-describedby="validacion">
                    <label class="form-check-label" for="check"></label>
                    <small id="validacion" class="form-text text-muted">Presione para validar</small>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

        </div>
    </div>

</asp:Content>
