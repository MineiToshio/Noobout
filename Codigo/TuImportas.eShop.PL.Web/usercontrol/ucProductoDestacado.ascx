<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProductoDestacado.ascx.cs" Inherits="TuImportas.eShop.PL.Web.usercontrol.ucProductoDestacado" %>

<div class="span4">
    <div class="product">
    	<div class="product-img featured">
    	    <div class="picture">
    	        <a href="/Producto/<%=hdIdProducto.Value%>"><%--<asp:Image runat="server" ID="imgProducto" Width="259" Height="179"/>--%> <asp:Panel runat="server" ID="pnlImagen" CssClass="img-product" style="background-position:50% 100%"></asp:Panel></a>
    	        <div class="img-overlay">
                    <asp:HiddenField runat="server" ID="hdIdProducto"></asp:HiddenField>
                    <%--<asp:LinkButton runat="server" ID="lnkVerMas" CssClass="btn more btn-primary" PostBackUrl="/Productos/1">Ver Más</asp:LinkButton>--%>
    	            <%--<a href="javascript:void(0);" class="btn buy btn-danger">Añadir</a>--%>
                    <asp:Label runat="server" ID="lblVerMas"></asp:Label>
                    <%--<asp:LinkButton runat="server" ID="lnkAnadir" CssClass="btn buy btn-danger" OnClick="lnkAnadir_Click">Añadir</asp:LinkButton>--%>
                    <a id="lnkA" class="btn buy btn-danger" onclick="AgregarCarrito(<%=hdIdProducto.Value%>)" >Añadir</a>
    	        </div>
    	    </div>
    	</div>
    	<div class="main-titles">
    	    <h4 class="title">S/. <asp:Label runat="server" ID="lblPrecio"></asp:Label></h4>
    	    <h5 class="no-margin"><asp:LinkButton runat="server" ID="lnkNombre"></asp:LinkButton></h5>
    	</div>
    	<p class="desc"><asp:Label runat="server" ID="lblDescripcion"></asp:Label></p>
    </div>
</div> <!-- /product -->