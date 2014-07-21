<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div class="span12">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Usuarios</h3>
        </div>
        <center>
            <asp:Button runat="server" ID="btnAgregarProducto" Text="Agregar Usuario" CssClass="btn btn-primary higher bold" PostBackUrl="~/administrador/Usuario.aspx"/>

            <asp:GridView ID="gvUsuarios" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Usuario"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvUsuarios_RowCommand">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron productos]"></asp:Label></center>
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="Usuario" HeaderText="Usuario"/>
                    <asp:BoundField DataField="Nombre_Completo" HeaderText="Nombre"/>
                    <asp:BoundField DataField="Dni" HeaderText="DNI"/>
                    <asp:BoundField DataField="Rol" HeaderText="Rol"/>
                    <asp:TemplateField HeaderText="Habilitado" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnHabilitado" runat="server" height="25" width="25" CausesValidation="false" CommandName="Habilitado" CommandArgument='<%#Eval("Id_Usuario")%>' ImageUrl='<%#Eval("Img_Habilitado")%>' OnClientClick="Loading();"/>  
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnEditar" runat="server" height="25" width="25" CausesValidation="false" CommandName="Edicion" CommandArgument='<%#Eval("Id_Usuario")%>' ImageUrl='/images/cambio.png' OnClientClick="Loading();" />  
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
