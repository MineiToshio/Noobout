<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Sliders.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Sliders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="content_admin">
        <div class="underlined push-down-30">
            <table style="width:100%">
                <tr>
                    <td><h3><span class="light">Administrar</span> Sliders</h3></td>
                    <td style="text-align:right;"><asp:Button runat="server" ID="btnAgregarSlider" Text="Agregar Slider" CssClass="btn btn-dark higher bold" PostBackUrl="~/administrador/Slider.aspx"/></td>
                </tr>
            </table>
            
        </div>
        <center>
            <asp:Button runat="server" ID="btnActualizarOrden" Text="Actualizar Orden" CssClass="btn btn-dark higher bold" OnClick="btnActualizarOrden_Click"/>
            

            <asp:GridView ID="gvSliders" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id_Slider"
                CssClass="gridview"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                ShowHeader="true" OnRowCommand="gvSliders_RowCommand">
                <EmptyDataTemplate>
                    <center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron colores]"></asp:Label></center>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Orden" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="txtOrden" Text='<%#Eval("Orden")%>' Width="20px" CssClass="positive-integer"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lnkNombre" Text='<%#Eval("Nombre")%>' PostBackUrl='<%#"Slider.aspx?id=" + Eval("Id_Slider")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion"/>
                    <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnEliminar" runat="server" height="25" width="25" CausesValidation="false" CommandName="Eliminar" CommandArgument='<%#Eval("Id_Slider") + "," + Eval("Imagen") +  "," + Eval("Background")%>' ImageUrl='/images/recycle-bin.png' OnClientClick="return confirm('¿Está seguro que desea eliminar el registro?');" />  
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
