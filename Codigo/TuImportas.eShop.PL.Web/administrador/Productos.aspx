<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div class="span12">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Productos</h3>
        </div>
        <center>
            <asp:Button runat="server" ID="btnAgregarProducto" Text="Agregar Producto" CssClass="btn btn-primary higher bold" PostBackUrl="~/administrador/Producto.aspx"/>

            <asp:GridView ID="gvProductos" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Producto"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvProductos_RowCommand"
                AllowPaging="true" PageSize="15" OnPageIndexChanging="gvProductos_PageIndexChanging">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron productos]"></asp:Label></center>
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Producto"/>
                    <asp:BoundField DataField="Precio" HeaderText="Precio"/>
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
