<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProducto.ascx.cs" Inherits="TuImportas.eShop.PL.Web.usercontrol.ucProducto" %>
<div class="span3">
    <div class="product">
        <div class="product-inner">
            <div class="product-img">
                <div class="picture imagen_producto">
                    <a href="/Producto/<%=hdIdProducto.Value%>"><%--<asp:Image runat="server" ID="imgProducto" />--%><asp:Panel runat="server" ID="pnlImagen" CssClass="img-product" ClientIDMode="Static"></asp:Panel></a>
                    <div class="img-overlay">
                        <asp:HiddenField runat="server" ID="hdIdProducto"></asp:HiddenField>
                        <asp:Label runat="server" ID="lblVerMas"></asp:Label>
                        <%--<asp:LinkButton runat="server" ID="lnkAnadir" CssClass="btn buy btn-danger" OnClick="lnkAnadir_Click">Añadir</asp:LinkButton>--%>
                        <a id="lnkA" class="btn buy btn-danger" onclick="AgregarCarrito(<%=hdIdProducto.Value%>)" >Añadir</a>
                    </div>
                </div>
            </div>
            <div class="main-titles no-margin">
                <h4 class="title">S/. <asp:Label runat="server" ID="lblPrecio"></asp:Label></h4>
                <h5 class="no-margin"><asp:Label runat="server" ID="lblNombre"></asp:Label></h5>
            </div>
            <p class="desc"><asp:Label runat="server" ID="lblDescripcion"></asp:Label></p>
            <div class="row-fluid hidden-line">
                <div class="span6">
                    <%--<asp:LinkButton runat="server" ID="lnkAgregarWhishlist" class="btn btn-small" OnClick="lnkAgregarWhishlist_Click"><i class="icon-heart"></i></asp:LinkButton>--%>
                    <a id="lnkFavorito" class="btn btn-small" onclick="AgregarFavoritos(<%=hdIdProducto.Value%>)"><i class="icon-heart"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>