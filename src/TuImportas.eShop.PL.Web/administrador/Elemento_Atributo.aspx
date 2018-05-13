<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Elemento_Atributo.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Elemento_Atributo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="content_admin">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Elementos del Atributo</h3>
        </div>
        <center>
            <asp:GridView ID="gvElementos" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Elemento_Atributo"
                ShowFooter="true"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvElementos_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Color" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Nombre")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtNombre" Text='<%# Eval("Nombre")%>' Width="200px" style="padding:0 5px;margin:0;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtNewNombre" style="padding:0 5px;margin:0;"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvNewNombre" runat="server" ControlToValidate="txtNewNombre" Display="Dynamic"
                                ErrorMessage="Nombre Obligatorio" InitialValue="" ToolTip="Nombre Obligatorio" ValidationGroup="vgRegistro">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CausesValidation="False" CommandName="Editar" Text="Editar"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkActualizar" runat="server" CausesValidation="True" CommandName="Actualizar" CommandArgument='<%# Eval("Id_Elemento_Atributo")%>' Text="Actualizar"  ValidationGroup="vgActualizar" OnClientClick="if(Page_ClientValidate('vgActualizar')){ Loading() }"></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancelar" runat="server" CausesValidation="False" CommandName="Cancelar" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lnkNuevo" runat="server" CausesValidation="True" CommandName="Nuevo" Text="Guardar" ValidationGroup="vgRegistro" OnClientClick="if(Page_ClientValidate('vgRegistro')){ Loading() }"></asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEliminar" runat="server" CausesValidation="False" CommandName="Eliminar" Text="Eliminar" CommandArgument='<%# Eval("Id_Elemento_Atributo")%>' OnClientClick="return confirm('¿Está seguro que desea eliminar el registro?');"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
