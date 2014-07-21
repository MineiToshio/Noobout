<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Tienda" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <!--  ==========  -->
    <!--  = Breadcrumbs =  -->
    <!--  ==========  -->
    <div class="darker-stripe">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <a href="/Inicio">Noobout</a>
                        </li>
                        <li><span class="icon-chevron-right"></span></li>
                        <li>
                            <a href="javascript:void(0);">Tienda</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="push-up">
            <div class="row">

                <!--  ==========  -->
                <!--  = Sidebar =  -->
                <!--  ==========  -->
                <aside class="span3 left-sidebar">
                    <div class="sidebar-item sidebar-filters" id="sidebarFilters">

                        <!--  ==========  -->
                        <!--  = Sidebar Title =  -->
                        <!--  ==========  -->
                        <div class="underlined">
                        	<h3><span class="light">Tienda</span></h3>
                        </div>

                        <!--  ==========  -->
                        <!--  = Categories =  -->
                        <!--  ==========  -->
                        <asp:Panel ID="pnlContenedorCategoria" runat="server" class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" href="#filterOne">Categorías <b class="caret"></b></a>
                            </div>
                            <div id="filterOne" class="accordion-body collapse in">
                                <asp:Panel runat="server" ID="pnlCategoria" class="accordion-inner"></asp:Panel>
                            </div>
                        </asp:Panel> <!-- /categories -->

                        <!--  ==========  -->
                        <!--  = Prices slider =  -->
                        <!--  ==========  -->
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" href="#filterPrices">Precio <b class="caret"></b></a>
                            </div>
                            <div id="filterPrices" class="accordion-body in collapse">
                                <div class="accordion-inner with-slider">
                                    <div class="jqueryui-slider-container">
                                        <div id="pricesRange"></div>
                                    </div>
                                    <input type="text" data-initial="432" class="max-val span1 pull-right" disabled />
                                    <input type="text" data-initial="99" class="min-val span1" disabled />
                                </div>
                            </div>
                        </div> <!-- /prices slider -->

                        <!--  ==========  -->
                        <!--  = Color filter =  -->
                        <!--  ==========  -->
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" href="#filterThree">Color <b class="caret"></b></a>
                            </div>
                            <div id="filterThree" class="accordion-body collapse">
                                <asp:Panel runat="server" ID="pnlColor" class="accordion-inner"></asp:Panel>
                            </div>
                        </div> <!-- /color filter -->

                        <a href="#" class="remove-filter" id="removeFilters"><span class="icon-ban-circle"></span> Remover Filtros</a>

                    </div>
                </aside> <!-- /sidebar -->

                <!--  ==========  -->
                <!--  = Main content =  -->
                <!--  ==========  -->
                <section class="span9 blocks-spacer">

                    <!--  ==========  -->
                    <!--  = Title =  -->
                    <!--  ==========  -->
                    <div class="underlined push-down-20">
                        <div class="row">
                            <div class="span4">
                                <h3><asp:Label runat="server" ID="lblBusqueda"></asp:Label></h3>
                            </div>
                            <div class="span5 align-right sm-align-left">
                                <div class="form-inline sorting-by">
                                    <label for="isotopeSorting" class="black-clr">Ordenar:</label>
                                    <select id="isotopeSorting" class="span3">
                                        <option value='{"sortBy":"price", "sortAscending":"true"}'>Por Precio (Bajo a Alto) &uarr;</option>
                                        <option value='{"sortBy":"price", "sortAscending":"false"}'>Por Precio (Alto a Bajo) &darr;</option>
                                        <option value='{"sortBy":"name", "sortAscending":"true"}'>Por Nombre (Bajo a Alto) &uarr;</option>
                                        <option value='{"sortBy":"name", "sortAscending":"false"}'>Por Nombre (Alto a Bajo) &darr;</option>
                                        <option value='{"sortBy":"popularity", "sortAscending":"true"}'>Por Vendidos (Bajo a Alto) &uarr;</option>
                                        <option value='{"sortBy":"popularity", "sortAscending":"false"}'>Por Vendidos (Alto a Bajo) &darr;</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div> <!-- /title -->

                    <!--  ==========  -->
                    <!--  = Products =  -->
                    <!--  ==========  -->
                    <div class="row popup-products">
                        <asp:panel runat="server" id="isotopeContainer" CssClass="isotope-container" ClientIDMode="Static"></asp:panel>
                	</div>
                	<hr />
                </section> <!-- /main content -->
            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Tienda.aspx")%>'
        var idCategoria = <%=idCategoria%>

        $(document).ready(function () {
            SeleccionarMenu("liMenu" + idCategoria);
        });
    </script> 
</asp:Content>
