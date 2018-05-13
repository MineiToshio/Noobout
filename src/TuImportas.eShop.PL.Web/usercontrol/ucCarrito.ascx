<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCarrito.ascx.cs" Inherits="TuImportas.eShop.PL.Web.usercontrol.ucCarrito" %>

<asp:Panel runat="server" class="item-in-cart clearfix" ClientIDMode="Static" ID="pnlItemCart">
    <div class="image">
        <asp:Image runat="server" ID="imgProducto" Width="124" AlternateText="cart item"/>
    </div>
    <div class="desc">
        <asp:HiddenField runat="server" ID="hdIdProducto" />
        <asp:HiddenField runat="server" ID="hdIdAtributos" />
        <strong><asp:LinkButton runat="server" ID="lnkNombre"></asp:LinkButton> <a id="lnkA" class="icon-remover" onclick="QuitarCarrito(<%=hdIdProducto.Value%>,'<%=hdIdAtributos.Value%>')" ></a></strong>
        <span class="light-clr qty">
            <asp:Label runat="server" ID="lblAtributos"></asp:Label>
            Cantidad: <asp:Label runat="server" ID="lblCantidad"></asp:Label>
        </span>
    </div>
    <div class="price">
        <strong>S/. <asp:Label runat="server" ID="lblPrecio"></asp:Label></strong>
    </div>
</asp:Panel>