<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Producto" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<meta property="og:title" content="<%=ogTitulo %>"/>
	<meta property="og:site_name" content="<%=ogSiteName %>"/>
	<meta property="og:url" content="<%=ogUrl %>"/>
	<meta property="og:description" content="<%=ogDescripcion %>"/>
	<meta property="og:image" content="<%=ogImagen %>"/>
	<meta property="fb:admins" content="linnsy.ardilla"/>
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
							<a href="/Tienda">Tienda</a>
						</li>
						<li><span class="icon-chevron-right"></span></li>
						<li>
							<asp:Label runat="server" ID="lblCategoriaLink"></asp:Label>
						</li>
						<li><span class="icon-chevron-right"></span></li>
						<li>
							<a href="javascript:void(0)"><asp:Label runat="server" ID="lblNombreLink"></asp:Label></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--  ==========  -->
	<!--  = Main container =  -->
	<!--  ==========  -->
	<div class="container">
		<div class="push-up top-equal blocks-spacer">

			<!--  ==========  -->
			<!--  = Product =  -->
			<!--  ==========  -->
			<div class="row blocks-spacer">

				<!--  ==========  -->
				<!--  = Preview Images =  -->
				<!--  ==========  -->
				<div class="span5">
					<div class="product-preview">
						<div class="picture"><%-- Height="470px"--%>
							<asp:Image runat="server" Width="100%" ID="imgPrincipal" ImageUrl="/images/dummy/products/shirt-1.jpg" ClientIDMode="Static" style="display:none;"/>
							<div id="player" style="width:470px;height:300px"></div>
						</div>
						<div class="thumbs clearfix">
							<div class="thumb active">
								<a href="#imgPrincipal"><asp:Image runat="server" ID="imgSecundario1" ImageUrl="/images/icon_play.png" Width="86px" Height="86px" onclick="VerVideo()"/></a>
							</div>
							<div class="thumb">
								<a href="#imgPrincipal"><asp:Image runat="server" ID="imgSecundario2" ImageUrl="/images/dummy/products/shirt-2.jpg" Width="86px" Height="86px" onclick="VerImagen()"/></a>
							</div>
							<div class="thumb">
								<a href="#imgPrincipal"><asp:Image runat="server" ID="imgSecundario3" ImageUrl="/images/dummy/products/shirt-3.jpg" Width="86px" Height="86px" onclick="VerImagen()"/></a>
							</div>
							<div class="thumb">
								<a href="#imgPrincipal"><asp:Image runat="server" ID="imgSecundario4" ImageUrl="/images/dummy/products/shirt-3.jpg" Width="86px" Height="86px" onclick="VerImagen()"/></a>
							</div>
							<div class="thumb">
								<a href="#imgPrincipal"><asp:Image runat="server" ID="imgSecundario5" ImageUrl="/images/dummy/products/shirt-3.jpg" Width="86px" Height="86px" onclick="VerImagen()"/></a>
							</div>
						</div>
					</div>
				</div>

				<!--  ==========  -->
				<!--  = Title and short desc =  -->
				<!--  ==========  -->
				<div class="span7">
					<div class="product-title">
						<h1 class="name"><span class="light"><asp:Label runat="server" ID="lblNombre"></asp:Label></span></h1>
						<div class="meta">
							<span class="tag">S/. <asp:Label runat="server" ID="lblPrecio"></asp:Label></span>
							<span class="stock">
								<span class="btn btn-success">En Stock</span>
							</span>
						</div>
					</div>
					<div class="product-description">
						<p><asp:Label runat="server" ID="lblDescripcion"></asp:Label></p>
						<hr />

						<!--  ==========  -->
						<!--  = Add to cart form =  -->
						<!--  ==========  -->
						<div id="divAgregar" class="form form-inline clearfix">
							<div class="numbered">
								<asp:TextBox runat="server" name="num" value="1" class="tiny-size positive-integer validate[required]" ID="txtCantidad" MaxLength="2"></asp:TextBox>
								<span class="clickable add-one icon-plus-sign-alt"></span>
								<span class="clickable remove-one icon-minus-sign-alt"></span>
							</div>
							&nbsp;
							<%--<select name="color" class="span2">
								<option value="-1">Select Color</option>
								<option value="blue">Blue</option>
								<option value="orange">Orange</option>
								<option value="black">Black</option>
							</select>--%>
							<asp:DropDownList runat="server" ID="ddlColor" CssClass="span2" Visible="false"></asp:DropDownList>
							<%--&nbsp;
							<select name="size" class="span2">
								<option value="-1">Select Size</option>
								<option value="XS">Extra Small</option>
								<option value="S">Small</option>
								<option value="M">Medium</option>
								<option value="L">Large</option>
								<option value="XL">Extra Large</option>
								<option value="XXL">Huge</option>
							</select>--%>
							<asp:LinkButton runat="server" ID="lnkAnadir" class="btn btn-danger pull-right" OnClick="lnkAnadir_Click" Style="display:none;"><i class="icon-shopping-cart"></i> &nbsp; Añadir al Carrito</asp:LinkButton>
							<a class="btn btn-danger pull-right" onclick="ValidarAgregar()"><i class="icon-shopping-cart"></i> &nbsp; Añadir al Carrito</a>
						</div>
						<hr />

						

						<div class="share-item push-down-20">
							<div class="row-fluid">
								<div class="span6">
									Comparte este producto con tus amigos:
								</div>
								<table>
									<tr>
										<td><a data-toggle="modal" role="button" href="#enviarAmigoModal" data-dismiss="modal" class="link-enviar-amigo"><img src="/images/envelope.png"/> Enviar a un amigo</a></td>
										<td><div class="fb-share-button" data-type="button_count"></div></td>
										<td style="padding-top:5px;"><div class="g-plus" data-action="share" data-annotation="bubble"></div></td>
										<td style="padding-top:5px;"><a id="twitterShare" href="https://twitter.com/share" class="twitter-share-button" data-lang="es">Twittear</a></td>
										<%--<td><input type="button" value="Enviar a un amigo"/></td>--%>
									</tr>
								</table>
							</div>
						</div>

						<div class="store-buttons">
							<table width="100%">
								<tr>
									<td style="width:25%"><i class="icon-heart"></i> <a href="#" onclick="AgregarFavoritos(<%=Convert.ToInt32(ViewState["ID_PRODUCTO"])%>)">Añadir a favoritos</a></td>
									<td style="width:25%"><i class="icon-question"></i> <a href="/Faq">Preguntas Frecuentes</a></td>
									<td style="width:25%"><i class="icon-money"></i> <a data-toggle="modal" href="#formaPagoModal" data-dismiss="modal">Forma de Pago</a></td>
									<td style="width:25%"><i class="icon-envelope"></i> <a href="/contacto">Contáctanos</a></td>
								</tr>
							</table>
						</div>

						<!-- More Buttons 
						<div class="store-buttons">
							<i class="icon-heart"></i> <a href="#">Añadir a favoritos</a>
						</div>-->

					</div>
				</div>
			</div>

			<!--  ==========  -->
			<!--  = Tabs with more info =  -->
			<!--  ==========  -->
			<div class="row">
				<div class="span12">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active">
							<a href="#tab-1" data-toggle="tab">DETALLE</a>
						</li>
						<li>
							<a href="#tab-2" data-toggle="tab">CARACTERÍSTICAS TÉCNICAS</a>
						</li>
						<li>
							<a href="#tab-3" data-toggle="tab">DETALLES DE ENVÍO</a>
						</li>
						<li>
							<a href="#tab-4" data-toggle="tab">COMENTARIOS</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="fade in tab-pane active" id="tab-1">
							<asp:Label runat="server" ID="lblDetalle"></asp:Label>
						</div>
						<div class="fade tab-pane" id="tab-2">
							<asp:Label runat="server" ID="lblTecnica"></asp:Label>
						</div>
						<div class="fade tab-pane" id="tab-3">
							<table class="table table-items span7">
								<thead>
									<tr>
										<th><div class="align-center" style="min-width:170px;">Operador Logístico</div></th>
										<th><div class="align-center" style="min-width:100px;">Costo en Lima</div></th>
										<th><div class="align-center" style="min-width:130px;">Costo en Provincia</div></th>
										<th><div class="align-center" style="min-width:100px;">Tiempo de Entrega</div></th>
									</tr>
								</thead>
								<tbody id="bodyOperadorLogistico" runat="server">
								</tbody>
							</table>
						</div>
						<div class="fade tab-pane" id="tab-4">
							<div class="fb-comments" data-colorscheme="light" data-href="<%=ogUrl%>"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- /container -->

	<!--  ==========  -->
	<!--  = Related Products =  -->
	<!--  ==========  -->
	<div class="boxed-area no-bottom">
		<div class="container">

			<!--  ==========  -->
			<!--  = Title =  -->
			<!--  ==========  -->
			<div class="row">
				<div class="span12">
					<div class="main-titles lined">
						<h2 class="title"><span class="light">Productos</span> Relacionados</h2>
					</div>
				</div>
			</div>

			<!--  ==========  -->
			<!--  = Related products =  -->
			<!--  ==========  -->
			<asp:Panel runat="server" ID="pnlRelacionados" CssClass="row popup-products"></asp:Panel>
		</div>
	</div>

	<div id="enviarAmigoModal" class="modal hide fade validationEngineContainer" tabindex="-1" role="dialog" aria-labelledby="enviarAmigoModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="enviarAmigoModalLabel">Enviar <span class="light">a un amigo</span></h3>
		</div>
		<div class="modal-body" style="overflow-y:visible;">
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputEmailRegister">Email Amigo</label>
				<div class="controls">
					<input type="text" class="input-block-level validate[required,custom[multimail]]" id="txtAmigoEmail" placeholder="Email Amigo">
				</div>
				<label style="font-size: 7pt; font-weight: lighter;">(*) Puedes usar (;) para separar emails.</label>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputEmailRegister">Tu Nombre</label>
				<div class="controls">
					<input type="text" class="input-block-level validate[required]" id="txtAmigoTuNombre" placeholder="Tu Nombre">
				</div>
			</div>
			<center><input id="btnRecuperarPass" type="button" class="btn btn-primary input-block-level bold higher" value="ENVIAR" onclick="EnviarArmigo()" /></center>
		</div>
	</div>

	<div id="formaPagoModal" class="modal hide fade validationEngineContainer" tabindex="-1" role="dialog" aria-labelledby="formaPagoModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="formaPagoModalLabel">Métodos <span class="light">de pago</span></h3>
		</div>
		<div class="modal-body" style="overflow-y:visible;text-align:center;">
			<img src="/images/pago/logopagoefectivo.jpg" width="100" />
			<br /><br />
			<img src="/images/pago/paypal_icon.jpg" width="100"/>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
	<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
	<script type="text/javascript">
		window.___gcfg = { lang: 'es-419' };

		(function () {
			var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
			po.src = 'https://apis.google.com/js/platform.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
		})();
	</script>
	<script src="http://www.youtube.com/player_api" type="text/javascript"></script>
	<script type="text/javascript">
		var pageUrl = '<%=ResolveUrl("Producto.aspx")%>'


		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(firstScriptTag);

		// 3. This function creates an <iframe> (and YouTube player)
		//    after the API code downloads.
		var player;
		function onYouTubePlayerAPIReady() {
			player = new YT.Player('player', {
				playerVars: { 'autoplay': 1, 'controls': 1, 'autohide': 1, 'wmode': 'opaque' },
				videoId: '<%=youtube%>',
				events: {
					'onReady': onPlayerReady
				}
			});
		}

		// 4. The API will call this function when the video player is ready.
		function onPlayerReady(event) {
			event.target.mute();
		}

		function VerVideo()
		{
			$('#imgPrincipal').css("display", "none");
			$('#player').css("display", "");
			player.seekTo(0, false);
			player.playVideo();
		}

		function VerImagen() {
			$('#imgPrincipal').css("display", "");
			$('#player').css("display", "none");
			player.stopVideo();
		}

		function ValidarAgregar()
		{
			if (!$('#<%=txtCantidad.ClientID%>').validationEngine('validate'))
			{
				<%= Page.ClientScript.GetPostBackEventReference(lnkAnadir, "") %>
			}
		}

		function EnviarArmigo()
		{
			if ($("#enviarAmigoModal").validationEngine('validate')) {

				$.ajax
				({
					type: "POST",
					url: pageUrl + "/EnviarAmigo",
					data: "{'email': '" + $('#txtAmigoEmail').val() + "', 'nombre': '" + $('#txtAmigoTuNombre').val() + "'}",
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (response) {
						jAlert("Su correo ha sido enviado satisfactoriamente.", "Enviar a un amigo");
					},
					error: function (response) {
						MostrarError();
					}
				});
			}
		}

		$(document).ready(function () {
			$("#twitterShare").attr('data-text', "Mira este producto de #NoobOut: " + $('#<%=lblNombre.ClientID%>').text());
			$("#enviarAmigoModal").validationEngine({ scroll: false, autoHidePrompt: true });
			SeleccionarMenu("");
		});
	</script>
</asp:Content>
