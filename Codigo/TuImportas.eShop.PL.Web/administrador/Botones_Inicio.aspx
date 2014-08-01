<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Botones_Inicio.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Botones_Inicio" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div class="content_admin">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Botones de Inicio</h3>
        </div>
        <center>
            <asp:GridView ID="gvBotonesInicio" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Boton_Inicio"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvBotonesInicio_RowCommand">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron botones]"></asp:Label></center>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Nombre")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtNombre" Text='<%# Eval("Nombre")%>' Width="200px" style="padding:0 5px;margin:0;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion" SortExpression="Descripcion" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Descripcion")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtDescripcion" Text='<%# Eval("Descripcion")%>' Width="200px" style="padding:0 5px;margin:0;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Url" SortExpression="Url" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Url")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtUrl" Text='<%# Eval("Url")%>' Width="200px" style="padding:0 5px;margin:0;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUrl" runat="server" ControlToValidate="txtUrl" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CausesValidation="False" CommandName="Editar" Text="Editar"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkActualizar" runat="server" CausesValidation="True" CommandName="Actualizar" CommandArgument='<%# Eval("Id_Boton_Inicio")%>' Text="Actualizar"  ValidationGroup="vgActualizar" OnClientClick="if(Page_ClientValidate('vgActualizar')){ Loading() }"></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancelar" runat="server" CausesValidation="False" CommandName="Cancelar" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
