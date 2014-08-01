<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OperadorLogistico.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.OperadorLogistico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div class="content_admin">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Operadores Logísticos</h3>
        </div>
        <center>
            <asp:GridView ID="gvOperadorLogistico" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Operador"
                ShowFooter="true"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvOperadorLogistico_RowCommand">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron operadores logísticos]"></asp:Label></center>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Operador Logístico" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
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
                    <asp:TemplateField HeaderText="Precio Lima" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Costo_Lima")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtCostoLima" Text='<%# Eval("Costo_Lima")%>' Width="200px" style="padding:0 5px;margin:0;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCostoLima" runat="server" ControlToValidate="txtCostoLima" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtNewCostoLima" style="padding:0 5px;margin:0;"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvNewCostoLima" runat="server" ControlToValidate="txtNewCostoLima" Display="Dynamic"
                                ErrorMessage="Nombre Obligatorio" InitialValue="" ToolTip="Nombre Obligatorio" ValidationGroup="vgRegistro">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio Provincia" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Costo_Provincia")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtCostoProvincia" Text='<%# Eval("Costo_Provincia")%>' Width="200px" style="padding:0 5px;margin:0;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCostoProvincia" runat="server" ControlToValidate="txtCostoProvincia" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtNewCostoProvincia" style="padding:0 5px;margin:0;"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvNewCostoProvincia" runat="server" ControlToValidate="txtNewCostoProvincia" Display="Dynamic"
                                ErrorMessage="Nombre Obligatorio" InitialValue="" ToolTip="Nombre Obligatorio" ValidationGroup="vgRegistro">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tiempo de Entrega" SortExpression="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>  
                            <%# Eval("Tiempo_Entrega")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtTiempoEntrega" Text='<%# Eval("Tiempo_Entrega")%>' Width="200px" style="padding:0 5px;margin:0;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTiempoEntrega" runat="server" ControlToValidate="txtTiempoEntrega" Display="Dynamic" ValidationGroup="vgActualizar">
                                <font color="red">* Llenar el campo</font>
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtNewTiempoEntrega" style="padding:0 5px;margin:0;"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvTiempoEntrega" runat="server" ControlToValidate="txtNewTiempoEntrega" Display="Dynamic"
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
                            <asp:LinkButton ID="lnkActualizar" runat="server" CausesValidation="True" CommandName="Actualizar" CommandArgument='<%# Eval("Id_Operador")%>' Text="Actualizar"  ValidationGroup="vgActualizar" OnClientClick="if(Page_ClientValidate('vgActualizar')){ Loading() }"></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancelar" runat="server" CausesValidation="False" CommandName="Cancelar" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lnkNuevo" runat="server" CausesValidation="True" CommandName="Nuevo" Text="Guardar" ValidationGroup="vgRegistro" OnClientClick="if(Page_ClientValidate('vgRegistro')){ Loading() }"></asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Habilitado" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnHabilitado" runat="server" height="25" width="25" CausesValidation="false" CommandName="Habilitado" CommandArgument='<%#Eval("Id_Operador")%>' ImageUrl='<%#Eval("Img_Habilitado")%>' OnClientClick="Loading();"/>  
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
