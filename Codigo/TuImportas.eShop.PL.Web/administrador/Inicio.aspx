<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <center>
        <p style="font-size:25pt;">BIENVENIDO AL ADMINISTRADOR DE NOOB OUT</p>
        <br />
        <div>
            <table>
                <tr>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(1);"><i class="icon-user"></i> USUARIOS</div></td>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(2);"><i class="icon-gamepad"></i> PRODUCTOS</div></td>
                </tr>
                <tr>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(3);"><i class="icon-tags"></i> CATEGORÍAS</div></td>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(4);"><i class="icon-pencil"></i> ATRIBUTOS</div></td>
                </tr>
                <tr>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(5);"><i class="icon-money"></i> COSTOS DE ENVÍO</div></td>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(6);"><i class="icon-gift"></i> PEDIDOS</div></td>
                </tr>
                <tr>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(7);"><i class="icon-th-large"></i> BOTONES INICIO</div></td>
                    <td><div class="opciones-admin" onclick="SeleccionarSubMenu(8);"><i class="icon-file"></i> SLIDERS</div></td>
                </tr>
            </table>
        </div>
    </center>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
    <script>
        function SeleccionarSubMenu(menu)
        {
            switch (menu)
            {
                case 1: window.location = '/administrador/Usuarios.aspx'; break;
                case 2: window.location = '/administrador/Productos.aspx'; break;
                case 3: window.location = '/administrador/Categorias.aspx'; break;
                case 4: window.location = '/administrador/Atributos.aspx'; break;
                case 5: window.location = '/administrador/OperadorLogistico.aspx'; break;
                case 6: window.location = '/administrador/Pedidos.aspx'; break;
                case 7: window.location = '/administrador/Botones_Inicio.aspx'; break;
                case 8: window.location = '/administrador/Sliders.aspx'; break;
            }
            
        }
    </script>
</asp:Content>
