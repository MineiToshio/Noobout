<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CostoEnvio.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.CostoEnvio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div class="content_admin">
        <asp:ScriptManager runat="server" ID="sm"></asp:ScriptManager>
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Costos de Envío</h3>
        </div>
        <center>
            
            <asp:DropDownList runat="server" ID="ddlDepartamento" OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            <asp:DropDownList runat="server" ID="ddlProvincia" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" AutoPostBack="true"><asp:ListItem Text="Provincia" Value="-1" style="display:none;" disabled Selected></asp:ListItem></asp:DropDownList>
            <asp:UpdatePanel runat="server" ID="up">
            <ContentTemplate>

            
            <asp:GridView ID="gvDistrito" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="CodDist"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvDistrito_RowCommand">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron colores]"></asp:Label></center>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Precio" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Nombre")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%# Eval("Nombre")%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Precio")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtPrecio" Text='<%# Eval("Precio")%>' Width="50px" style="padding:0 5px;margin:0;" MaxLength="7" CssClass="positive-integer"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtPrecio" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CausesValidation="False" CommandName="Editar" Text="Editar"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkActualizar" runat="server" CausesValidation="True" CommandName="Actualizar" CommandArgument='<%# Eval("CodDist")%>' Text="Actualizar"  ValidationGroup="vgActualizar" OnClientClick="if(Page_ClientValidate('vgActualizar')){ Loading() }"></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancelar" runat="server" CausesValidation="False" CommandName="Cancelar" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </ContentTemplate>
            </asp:UpdatePanel>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
