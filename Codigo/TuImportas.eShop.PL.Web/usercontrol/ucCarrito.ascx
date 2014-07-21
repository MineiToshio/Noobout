<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCarrito.ascx.cs" Inherits="TuImportas.eShop.PL.Web.usercontrol.ucCarrito" %>

<asp:Panel runat="server" class="item-in-cart clearfix" ClientIDMode="Static" ID="pnlItemCart">
    <div class="image">
        <asp:Image runat="server" ID="imgProducto" Width="70" Height="70" AlternateText="cart item"/>
        <%--<img src="images/dummy/cart-items/cart-item-1.jpg" width="124" height="124" alt="cart item" />--%>
    </div>
    <div class="desc">
        <strong><asp:LinkButton runat="server" ID="lnkNombre"></asp:LinkButton></strong>
        <span class="light-clr qty">
            Cantidad: <asp:Label runat="server" ID="lblCantidad"></asp:Label>
            &nbsp;
            <asp:HiddenField runat="server" ID="hdIdProducto" />
            <%--<asp:LinkButton runat="server" ID="lnkRemoverCarrito" title="Remover Item" OnClick="lnkRemoverCarrito_Click" class="icon-remover"></asp:LinkButton>--%>
            <a id="lnkA" class="icon-remover" onclick="QuitarCarrito(<%=hdIdProducto.Value%>)" ></a>
        </span>
    </div>
    <div class="price">
        <strong>S/. <asp:Label runat="server" ID="lblPrecio"></asp:Label></strong>
    </div>
</asp:Panel>