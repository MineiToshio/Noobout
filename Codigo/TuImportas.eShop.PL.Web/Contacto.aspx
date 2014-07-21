<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Contacto" EnableEventValidation="false" %>
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
                            <a href="/Contacto">Contacto</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="push-up top-equal blocks-spacer-last">
            <div class="row">
                
                <!--  ==========  -->
                <!--  = Main Title =  -->
                <!--  ==========  -->
                
                <div class="span12">
                    <div class="title-area">
                        <h1 class="inline"><span class="light">Contáctenos</span></h1>
                    </div>
                </div>
                
                <!--  ==========  -->
                <!--  = Main content =  -->
                <!--  ==========  -->

                <article class="post span12">
                        <div class="post-inner justify">
                            <p>Nosotros queremos conocer tu opinión, comentarios y preguntas.
                            Si tienes dudas puedes revisar nuestra sección de <a href="/Faq">Preguntas Frecuentes</a>.
                            <span class="bolder">Si aún tienes dudas</span>, estamos a tu disposición para ayudarte en lo que necesites, para ello llena el siguiente formulario y te responderemos lo más pronto posible.</p>
                        </div>
                    </article>

                <section class="span8 single single-page">
                    
                    <!--  ==========  -->
                    <!--  = Post =  -->
                    <!--  ==========  -->
                    
                    
                    <%--<hr />--%>
                    
                    <!--  ==========  -->
                    <!--  = Contact Form =  -->
                    <!--  ==========  -->
                    <section class="contact-form-container">
                        
                        <h3 class="push-down-25"><span class="light">Envíanos</span> un Mensaje</h3>
                        
                        <div id="divMensaje" class="form form-inline form-contact validationEngineContainer">
                            <p class="push-down-20">
                                <%--<input type="text" aria-required="true" tabindex="1" size="30" value="" id="author" name="author" required>--%>
                                <asp:TextBox runat="server" ID="txtNombre" CssClass="validate[required]" Width="250px"></asp:TextBox>
                                <label for="txtNombre">Nombre<span class="red-clr bold">*</span></label>
                            </p>
                            <p class="push-down-20">
                                <%--<input type="text" aria-required="true" tabindex="1" size="30" value="" id="author" name="author" required>--%>
                                <asp:TextBox runat="server" ID="txtApellido" CssClass="validate[required]" Width="250px"></asp:TextBox>
                                <label for="txtNombre">Apellido<span class="red-clr bold">*</span></label>
                            </p>
                            <p class="push-down-20">
                                <%--<input type="email" aria-required="true" tabindex="2" size="30" value="" id="email" name="email" required>--%>
                                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="validate[required,custom[email]]" Width="250px"></asp:TextBox>
                                <label for="email">E-Mail<span class="red-clr bold">*</span></label>
                            </p>
                            <p class="push-down-20">
                                <%--<input type="text" tabindex="3" size="30" value="" id="url" name="url">--%>
                                <asp:TextBox runat="server" ID="txtTelefono" Width="250px"></asp:TextBox>
                                <label for="url">Teléfono</label>
                            </p>
                            <p class="push-down-20">
                                <%--<input type="text" tabindex="3" size="30" value="" id="url" name="url">--%>
                                <asp:DropDownList runat="server" ID="ddlComoAyudar" CssClass="validate[required]" Width="275px">
                                    <asp:ListItem Value="1" Text="Estado de mi pedido"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Envío y entrega"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Devolución y reembolso"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Pagos"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="Otros"></asp:ListItem>
                                </asp:DropDownList>
                                <label for="url">¿Cómo te ayudamos?</label>
                            </p>
                            <p class="push-down-20">
                                <%--<textarea class="input-block-level" tabindex="4" rows="7" cols="70" id="comment" name="comment" placeholder="Escribe tu mensaje..." required></textarea>--%>
                                <asp:TextBox runat="server" ID="txtMensaje" placeholder="Escribe tu mensaje..." TextMode="MultiLine" Width="700px" Height="150px" CssClass="validate[required]"></asp:TextBox>
                            </p>
                            <p>
                                <%--<asp:Button runat="server" CssClass="btn btn-primary bold" tabindex="5" ID="btnEnviar" Text="ENVIAR CORREO" OnClick="btnEnviar_Click"/>--%>
                                <input type="button" class="btn btn-primary bold" tabindex="5" id="btnEnviarAux" value="ENVIAR CORREO" onclick="Enviar()"/>
                            </p>
                        </div>
                    </section>
                    
                </section>
                <!--  ==========  -->
                <!--  = Sidebar =  -->
                <!--  ==========  -->
                <aside class="span4">
                    <div class="sidebar-item opening-time" id="opening_time-4">
                        <div class="underlined">
                            <h3><span class="light">Horario de </span> Atención</h3>
                        </div>
                        <div class="time-table">
                            <dl class="week-day">
                                <dt>
                                    Lunes - Viernes
                                </dt>
                                <dd>
                                    9:00 - 18:00
                                </dd>
                            </dl>
                            <dl class="week-day light-bg">
                                <dt>
                                    Sábados
                                </dt>
                                <dd>
                                    9:00 - 13:00
                                </dd>
                            </dl>
                        </div>
                    </div>
                    
                    <!--  ==========  -->
                    <!--  = Twitter Widget =  -->
                    <!--  ==========  -->
                    <%--<div class="sidebar-item widget_twitter">
                        <div class="underlined">
                            <h3><span class="light">Twitter</span> Feed</h3>
                        </div>
                        
                        <a class="twitter-timeline"  href="https://twitter.com/primozcigler"  data-widget-id="361435057526800385">Tweets de @noobout</a>
<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>

                    </div>--%>
                    
                    
                </aside> <!-- /sidebar -->

            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Contacto.aspx")%>'

        $(document).ready(function () {
            $("#divMensaje").validationEngine({ scroll: false, autoHidePrompt: true });
            SeleccionarMenu("liMenuContacto");
        });
        
        function Enviar()
        {
            if ($("#divMensaje").validationEngine('validate')) {

                var objMensajeBE = {};

                objMensajeBE.Nombre = $("#<%=txtNombre.ClientID%>").val(),
                objMensajeBE.Apellido = $("#<%=txtApellido.ClientID%>").val(),
                objMensajeBE.Correo = $("#<%=txtEmail.ClientID%>").val(),
                objMensajeBE.Telefono = $("#<%=txtTelefono.ClientID%>").val(),
                objMensajeBE.ComoAyudar = $("#<%=ddlComoAyudar.ClientID%> option:selected").text(),
                objMensajeBE.Mensaje = $("#<%=txtMensaje.ClientID%>").val()

                var DTO = { 'objMensajeBE': objMensajeBE };

                $.ajax
                ({
                    type: "POST",
                    url: pageUrl + "/Enviar",
                    data: JSON.stringify(DTO),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        jAlert("El mensaje ha sido enviado satisfactoriamente", "Contáctenos");
                    },
                    error: function (response) {
                        MostrarError();
                    }
                });
            }
        }

    </script> 
</asp:Content>
