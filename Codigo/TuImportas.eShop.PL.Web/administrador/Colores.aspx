<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Colores.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Colores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div class="span12">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Colores</h3>
        </div>
        <center>
            <asp:GridView ID="gvColores" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Color"
                ShowFooter="true"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvColores_RowCommand">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron colores]"></asp:Label></center>
                </EmptyDataTemplate>
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
                            <asp:LinkButton ID="lnkActualizar" runat="server" CausesValidation="True" CommandName="Actualizar" CommandArgument='<%# Eval("Id_Color")%>' Text="Actualizar"  ValidationGroup="vgActualizar" OnClientClick="if(Page_ClientValidate('vgActualizar')){ Loading() }"></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancelar" runat="server" CausesValidation="False" CommandName="Cancelar" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lnkNuevo" runat="server" CausesValidation="True" CommandName="Nuevo" Text="Guardar" ValidationGroup="vgRegistro" OnClientClick="if(Page_ClientValidate('vgRegistro')){ Loading() }"></asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
