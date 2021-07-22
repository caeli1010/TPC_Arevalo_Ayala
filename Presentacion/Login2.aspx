<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="Presentacion.Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Turnos | Login</title>
    <%--incluimos bootstrap 4--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"/>
</head>
<body>
    <hr class="py-1" />
    <h1 class="text-center">Inicie sesion</h1>
    <div class="row alert alert-secondary ">
        <div class="offset-md-4 col-md-4">
            <form id="form1" runat="server">
                <div>
                    <div class="form-group">
                        <label for="nombre">Username</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" />
                    </div>
                    <div class="form-group">
                        <label for="contrasenia">Password</label>
                        <input type="password" class="form-control" id="contrasenia" name="contrasenia" />

                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="check" aria-describedby="validacion" name="check" />
                        <label class="form-check-label" for="check"></label>
                        <small id="validacion" class="form-text text-muted">Recordar usuario</small>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" />
                   
                </div>
            </form>
        </div>
    </div>
</body>
</html>
