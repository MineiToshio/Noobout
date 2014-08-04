<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div class="content_admin">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Usuarios</h3>
        </div>
        <center>
            <table>
                <tr>
                    <td>
                        <label class="control-label" for="txtUsuarioBuscar">Usuario:</label>
                        <asp:TextBox runat="server" ID="txtUsuarioBuscar"></asp:TextBox>
                    </td>
                    <td width="50px"></td>
                    <td>
                        <label class="control-label" for="txtUsuarioNombreBuscar">Nombre:</label>
                        <asp:TextBox runat="server" ID="txtUsuarioNombreBuscar"></asp:TextBox>
                    </td>
                    <td width="50px"></td>
                    <td>
                        <label class="control-label" for="txtUsuarioApellidoPBuscar">Apellido Paterno:</label>
                        <asp:TextBox runat="server" ID="txtUsuarioApellidoPBuscar"></asp:TextBox>
                    </td>
                    <td width="50px"></td>
                    <td>
                        <label class="control-label" for="txtUsuarioApellidoMBuscar">Apellido Materno:</label>
                        <asp:TextBox runat="server" ID="txtUsuarioApellidoMBuscar"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label" for="txtUsuarioDniBuscar">DNI:</label>
                        <asp:TextBox runat="server" ID="txtUsuarioDniBuscar"></asp:TextBox>
                    </td>
                    <td width="50px"></td>
                    <td>
                        <label class="control-label" for="txtUsuarioEMailBuscar">EMail:</label>
                        <asp:TextBox runat="server" ID="txtUsuarioEMailBuscar"></asp:TextBox>
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
                    <td width="50px"></td>
                    <td align="right">
                        <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary higher bold" OnClick="btnBuscar_Click"/>
                    </td>
                </tr>
            </table>

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
