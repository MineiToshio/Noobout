<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProductoFiltro.ascx.cs" Inherits="TuImportas.eShop.PL.Web.usercontrol.ucProductoFiltro" %>
<asp:Panel ID="pnlProducto" runat="server">
    <div class="product">
        <div class="product-inner">
            <asp:Panel ID="pnlNuevo" runat="server" CssClass="stamp green" Visible="false">Nuevo</asp:Panel>
            <div class="product-img">
                <div class="picture">
                    <a href="/Producto/<%=hdIdProducto.Value%>"><%--<asp:Image runat="server" ID="imgProducto" Width="270" Height="187" AlternateText="" />--%> <asp:Panel runat="server" ID="pnlImagen" CssClass="img-product"></asp:Panel></a>
                    <div class="img-overlay">
                        <asp:HiddenField runat="server" ID="hdIdProducto"></asp:HiddenField>
                        <asp:Label runat="server" ID="lblVerMas"></asp:Label>
                        <%--<asp:LinkButton runat="server" ID="lnkAnadir" CssClass="btn buy btn-danger" OnClick="lnkAnadir_Click">Añadir</asp:LinkButton>--%>
                        <a id="lnkA" class="btn buy btn-danger" onclick="PopUpAgregarCarritoAtributo(<%=hdIdProducto.Value%>)" >Añadir</a>
                    </div>
                </div>
            </div>
            <div class="main-titles no-margin">
                <h4 class="title">S/. <asp:Label runat="server" ID="lblPrecio"></asp:Label></h4>
                <h5 class="no-margin isotope--title"><asp:Label runat="server" ID="lblNombre"></asp:Label></h5>
            </div>
            <div class="row-fluid hidden-line">
                <div class="span6">
                    <a id="lnkFavorito" class="btn btn-small" onclick="AgregarFavoritos(<%=hdIdProducto.Value%>)"><i class="icon-heart"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Panel> 
