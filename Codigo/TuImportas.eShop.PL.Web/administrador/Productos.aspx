<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="content_admin">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Productos</h3>
        </div>
        <center>
            <table>
                <tr>
                    <td>
                        <label class="control-label" for="txtNombreBuscar">Producto:</label>
                        <asp:TextBox runat="server" ID="txtNombreBuscar"></asp:TextBox>
                    </td>
                    <td width="50px"></td>
                    <td>
                        <label class="control-label" for="ddlActivoBuscar">Activo: </label>
                        <asp:DropDownList runat="server" ID="ddlActivoBuscar" Width="70px">
                            <asp:ListItem Value="-1">--</asp:ListItem>
                            <asp:ListItem Value="1">Si</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-dark higher bold" OnClick="btnBuscar_Click"/></td>
                </tr>
            </table>
            
            <asp:Button runat="server" ID="btnAgregarProducto" Text="Agregar Producto" CssClass="btn btn-dark higher bold" PostBackUrl="~/administrador/Producto.aspx"/>
            <asp:GridView ID="gvProductos" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Producto"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvProductos_RowCommand"
                AllowPaging="true" PageSize="15" OnPageIndexChanging="gvProductos_PageIndexChanging" AllowSorting="true" OnSorting="gvProductos_Sorting">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron productos]"></asp:Label></center>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image runat="server" ID="imgProducto" ImageUrl='<%#Eval("Ruta_Img_Principal")%>' Width="40px" Height="40px"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nombre" HeaderText="Producto" SortExpression="Nombre"/>
                    <asp:BoundField DataField="Precio" HeaderText="Precio" ItemStyle-HorizontalAlign="Center" SortExpression="Precio"/>
                    <asp:BoundField DataField="Cantidad_Vendidos" HeaderText="Cantidad<br/>Vendidos" HtmlEncode="false" ItemStyle-HorizontalAlign="Center" SortExpression="Cantidad_Vendidos"/>
                    <asp:TemplateField HeaderText="Habilitado" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnHabilitado" runat="server" height="25" width="25" CausesValidation="false" CommandName="Habilitado" CommandArgument='<%#Eval("Id_Producto")%>' ImageUrl='<%#Eval("Img_Habilitado")%>' OnClientClick="Loading();"/>  
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnEditar" runat="server" height="25" width="25" CausesValidation="false" CommandName="Edicion" CommandArgument='<%#Eval("Id_Producto")%>' ImageUrl='/images/cambio.png' OnClientClick="Loading();" />  
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
