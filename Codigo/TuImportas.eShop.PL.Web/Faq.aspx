<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Faq.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Faq" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
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
							<a href="javascript:void(0)">Preguntas Frecuentes</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="push-up blocks-spacer"">
			<div class="row">
				<%--<div class="title-area">
					<h1 class="inline"><span class="light">Preguntas Frecuentes</span></h1>
				</div>--%>
				<aside class="span3">
					<div class="sidebar-item">

						<div>
							<h3><span class="light">Preguntas</span> Frecuentes</h3>
						</div>

						<div class="row">
							<div class="span3">
								<div class="widget">
									<ul class="nav nav-pills nav-stacked"><%-- class="active"--%>
										<li id="liSobreCompra"><a href="javascript:void(0);" onclick="SeleccionarSubMenu(1);">SOBRE LA COMPRA <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liMediosPagos"><a href="javascript:void(0);" onclick="SeleccionarSubMenu(2);">MEDIOS DE PAGO <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liEnvioProducto"><a href="javascript:void(0);" onclick="SeleccionarSubMenu(3);">SOBRE EL ENVÍO DE MI PRODUCTO <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liDevoluciones"><a href="javascript:void(0);" onclick="SeleccionarSubMenu(4);">DEVOLUCIONES <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liProblemasPedido"><a href="javascript:void(0);" onclick="SeleccionarSubMenu(5);">PROBLEMAS CON MI PEDIDO <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liDatosPersonales"><a href="javascript:void(0);" onclick="SeleccionarSubMenu(6);">SOBRE MIS DATOS PERSONALES <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liContacto"><a href="javascript:void(0);" onclick="SeleccionarSubMenu(7);">CONTACTO <i class="icon-caret-right pull-right"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</aside>

				<div ID="pnlInicio" class="span9">
					<div class="underlined push-down-20">
						<h3><span class="light">Medios </span>de pago</h3>
					</div>
					<%--<table>
						<tr>
							<td><div class="categoria-faq" onclick="SeleccionarMenu(1);"><img src="/images/faqs/faq1.png"/> SOBRE <span class="bold">LA COMPRA</span></div></td>
							<td></td>
							<td><div class="categoria-faq" onclick="SeleccionarMenu(2);"><img src="/images/faqs/faq2.png"/> MEDIOS <span class="bold">DE PAGO</span></div></td>
						</tr>
						<tr>
							<td><div class="categoria-faq" onclick="SeleccionarMenu(3);"><img src="/images/faqs/faq3.png"/> SOBRE <span class="bold">EL ENVÍO DE MI PRODUCTO</span></div></td>
							<td></td>
							<td><div class="categoria-faq" onclick="SeleccionarMenu(4);"><img src="/images/faqs/faq4.png"/> DE<span class="bold">VOLUCIONES</span></div></td>
						</tr>
						<tr>
							<td><div class="categoria-faq" onclick="SeleccionarMenu(5);"><img src="/images/faqs/faq5.png"/> PROBLEMAS <span class="bold">CON MI PEDIDO</span></div></td>
							<td></td>
							<td><div class="categoria-faq" onclick="SeleccionarMenu(6);"><img src="/images/faqs/faq6.png"/> SOBRE <span class="bold">MIS DATOS PERSONALES</span></div></td>
						</tr>
						<tr>
							<td><div class="categoria-faq" onclick="SeleccionarMenu(7);"><img src="/images/faqs/faq7.png"/> CON<span class="bold">TACTO</span></div></td>
							<td></td>
							<td></td>
						</tr>
					</table>--%>
					<div class="span9">
						<div class="categoria-faq span3" onclick="SeleccionarSubMenu(1);"><img src="/images/faqs/faq1.png"/> SOBRE <span class="bold">LA COMPRA</span></div>
						<div class="categoria-faq span3" onclick="SeleccionarSubMenu(2);"><img src="/images/faqs/faq2.png"/> MEDIOS <span class="bold">DE PAGO</span></div>
						<div class="categoria-faq span3" onclick="SeleccionarSubMenu(3);"><img src="/images/faqs/faq3.png"/> SOBRE <span class="bold">EL ENVÍO DE MI PRODUCTO</span></div>
						<div class="categoria-faq span3" onclick="SeleccionarSubMenu(4);"><img src="/images/faqs/faq4.png"/> DE<span class="bold">VOLUCIONES</span></div>
						<div class="categoria-faq span3" onclick="SeleccionarSubMenu(5);"><img src="/images/faqs/faq5.png"/> PROBLEMAS <span class="bold">CON MI PEDIDO</span></div>
						<div class="categoria-faq span3" onclick="SeleccionarSubMenu(6);"><img src="/images/faqs/faq6.png"/> SOBRE <span class="bold">MIS DATOS PERSONALES</span></div>
						<div class="categoria-faq span3" onclick="SeleccionarSubMenu(7);"><img src="/images/faqs/faq7.png"/> CON<span class="bold">TACTO</span></div>
						
						<p class="span8">Si aún tienes más preguntas por realizar, no dudes en enviaros un mensaje a través de la sección <span class="bolder">‘CONTACTANOS’</span>. Te responderemos a la brevedad.</p>
					</div>
				 </div>
				<div ID="pnlSobreCompra" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Sobre </span>la compra</h3>
					</div>
					<div class="accordion" id="accordion2">
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse11">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo comprar?
								</a>
							</div>
							<div id="collapse11" class="accordion-body collapse">
								<div class="accordion-inner">
									<table align="center" class="align-center" border="1">
										<tr><%--vertical-align:top;--%>
											<td colspan="6" style="height:40px;">Comprar en <span class="bolder">NOOB OUT</span> es muy sencillo, sigue los siguientes pasos</td>
										</tr>
										<tr>
											<td class="pasos-como-comprar">Paso 1</td>
											<td class="pasos-como-comprar">Paso 2</td>
											<td class="pasos-como-comprar">Paso 3</td>
											<td class="pasos-como-comprar">Paso 4</td>
											<td class="pasos-como-comprar">Paso 5</td>
											<td class="pasos-como-comprar">Paso 6</td>
										</tr>
										<tr>
											<td><img src="/images/comocomprar/comocomprar1.jpg"/></td>
											<td><img src="/images/comocomprar/comocomprar2.jpg"/></td>
											<td><img src="/images/comocomprar/comocomprar3.jpg"/></td>
											<td><img src="/images/comocomprar/comocomprar4.jpg"/></td>
											<td><img src="/images/comocomprar/comocomprar5.jpg"/></td>
											<td><img src="/images/comocomprar/comocomprar6.jpg"/></td>
										</tr>
										<tr>
											<td>Ingresa a <a href="www.noobout.com">www.noobout.com</a><br /><a href="#loginModal" data-toggle="modal">Inicia Sesión</a> o <a href="#registerModal" data-toggle="modal">Regístrate</a></td>
											<td>Busca el o los producto(s) de tu preferencia en nuestra página web.</td>
											<td>Añádelo(s)  a tu carrito de compras haciendo clic en <input type="button" value="AÑADIR A CARRITO" class="btn btn-primary"/> </td>
											<td>Ingresa la dirección donde deseas que llevemos tu(s) producto(s).</td>
											<td>Escoge el Método de Pago que más te convenga y dale clic en <input type="button" value="PAGAR" class="btn btn-primary"/></td>
											<td>Verifica la información y si todo está ok, dale clic en <input type="button" value="CONFIRMAR LA COMPRA" class="btn btn-primary"/></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse12"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Existe un monto mínimo de compra?
								</a>
							</div>
							<div id="collapse12" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>No tenemos con un monto mínimo de compra.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse13"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo puedo filtrar los productos?
								</a>
							</div>
							<div id="collapse13" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Puedes utilizar los filtros ubicados en la parte izquierda de nuestra página web por tipo de producto, marca, precio.</p>
									<p>Debes seleccionar solo los filtros relacionados a lo que buscas y los resultados se actualizarán inmediatamente.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse14"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo sé si hay unidades disponibles del producto que quiero comprar?
								</a>
							</div>
							<div id="collapse14" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>En NOOB OUT siempre te avisamos la cantidad de unidades que quedan disponibles en cada producto que ofrecemos, esta información está ubicada en el detalle de cada producto cuando le das clic en <span class="bolder">VER MÁS</span>.</p>
									<p>Si el producto que quieres comprar no está disponible pero lo encuentras en nuestro catálogo, mándanos un correo a <a href="mailto:servicioalcliente@noobout.com">servicioalcliente@noobout.com</a> indicándonos el producto que deseas. Te responderemos si es posible conseguirte el producto que necesitas.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse15"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo sé si se procesó correctamente mi orden de compra y pago?
								</a>
							</div>
							<div id="collapse15" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Una vez realizado el pedido recibirás un e-mail con los detalles de la orden, dando la confirmación de la compra. En caso de haber optado por pagar con Pago Efectivo, te llegará un segundo e-mail con la confirmación del pago.</p>
									<p>Asimismo, en la sección <span class="bolder">‘Mis pedidos’</span> de tu cuenta, puedes ver el estado de cada una de las órdenes que has realizado.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse16"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo busco un producto?
								</a>
							</div>
							<div id="collapse16" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Puedes utilizar:</p>
									<ul style="list-style-type:decimal">
										<li>La <span class="bolder">‘barra de búsqueda’</span> ubicada en la parte superior derecha de la página.</li>
										<li>Los <span class="bolder">‘filtros’</span> ubicados a la izquierda de la página.</li>
										<li>Las categorías ubicadas en la parte superior de la página.</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse17"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo elimino un producto de mi carrito de compras? 
								</a>
							</div>
							<div id="collapse17" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Si agregaste un producto al carrito de compras y quieres eliminarlo, solo debes seguir estos pasos:</p>
									<ul style="list-style-type:decimal">
										<li>Haz clic en <span class="bolder">‘Carrito de compras’</span>, este lo podrás encontrar en el costado superior derecho de la página.</li>
										<li>Cuando ya estés en tu carrito de compras, ubícate sobre el producto que quieres eliminar y haz clic en la <span class="bolder">“x"</span> que aparece al lado del nombre del producto.</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse18"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué hago si ya realicé mi pedido y no recibo el correo de confirmación?
								</a>
							</div>
							<div id="collapse18" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Una vez realizado tu pedido, recibirás un e-mail con los detalles la orden, dando la confirmación de tu compra. Recuerda que la confirmación de tu pedido dependerá del método de pago que hayas utilizado:</p>
									<ul>
										<li><span class="bolder">Pago Efectivo</span>: Te llegará un segundo e-mail con la confirmación del pago. </li>
										<li><span class="bolder">Paypal</span>:</li>
									</ul>
									<p>Puedes conocer y revisar el estado de tu pedido ingresando a <span class="bolder">‘Mi Cuenta’</span> y luego haciendo clic en la sección de <span class="bolder">‘Mis pedidos’</span>. Asegúrate de que la información que se ha registrado (correo electrónico y número de teléfono) sean correctos, para revisar tu información puedes ingresar a <span class="bolder">‘Mi Cuenta’</span> y luego a <span class="bolder">‘Información de la Cuenta’</span>.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse19"> 
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo hago seguimiento a mi pedido?
								</a>
							</div>
							<div id="collapse19" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Es muy fácil hacer seguimiento a tu pedido y conocer su estado, solo debes seguir estos pasos:</p>
									<ul style="list-style-type:decimal">
										<li>Haz clic en el botón <span class="bolder">‘Iniciar Sesión’</span> que se encuentra en la parte superior central de nuestra página web.</li>
										<li>En tu cuenta, haz clic en la sección de <span class="bolder">’Mis Pedidos’</span>.</li>
										<li>Elige la orden que deseas revisar, una vez hagas clic en el pedido puedes revisar la columna <span class="bolder">‘Estado del Pedido’</span>.</li>
										<li>Si quieres obtener más información sobre el estado de tu pedido, haz clic en <span class="bolder">‘Ver pedido’</span>. Allí podrás ver toda la información relacionada con tu orden: dirección de entrega, facturación, forma de pago, información de envío y resumen de la orden.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div ID="pnlMediosPagos" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Medios </span>de pago</h3>
					</div>
					<div class="accordion" id="accordion3">
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapse21">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué opciones de pago tengo?
								</a>
							</div>
							<div id="collapse21" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Por ahora te ofrecemos las siguientes opciones de pago:</p>
									<ul style="list-style-type:decimal">
										<li><span class="bolder">Pago Efectivo</span>: cupón con el que podrás realizar el pago en Agencias, Home Banking (pago por internet a través de la página de los bancos) y Agentes del BCP, BBVA, Scotiabank, Interbank, Western Unión y Full Carga. </li>
										<li><span class="bolder">PayPal</span>: sistema con el que podrás pagar con tu tarjeta de crédito VISA o MASTERCARD sin necesidad de compartir tu información financiera.  Para mayor información ingresa a <a href="www.paypal.com.pe">www.paypal.com.pe</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div ID="pnlEnvioProducto" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Sobre </span>el envío de mi producto</h3>
					</div>
					<div class="accordion" id="accordion4">
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#collapse31">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cuánto cuesta el envío de mi producto?
								</a>
							</div>
							<div id="collapse31" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>El costo de envío depende de cada producto, de la ciudad en la que quieres que el producto sea entregado y del modo de envío que escojas al realizar tu compra.</p>
									<p>Los costos de envío promedio son:</p>
									<ul>
										<li>Para Lima: S/. 10.00</li>
										<li>Otras provincias: S/. 15.00</li>
									</ul>
									<p>El servicio de envío se cobra por orden de compra y no por productos comprados. </p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#collapse32">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿En cuánto tiempo llega mi pedido?
								</a>
							</div>
							<div id="collapse32" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Los pedidos en Lima se entregan como máximo en 5 días útiles. Si la entrega es a otras provincias, tu pedido puede llegar hasta en 7 días útiles.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#collapse33">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Quién entrega mi pedido?
								</a>
							</div>
							<div id="collapse33" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>NOOB OUT cuenta con una alianza estratégica con los siguientes operadores logísticos:</p>
									<ul>
										<li>OLVA COURIER</li>
										<li>SMP COURIER</li>
										<li>SERVIENTREGA (Red Verde Perú SAC)</li>
									</ul>
									<p>Quienes garantizan el despacho seguro y eficaz de todos los productos que ofrecemos.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#collapse34">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué pasa si no estoy en casa al momento de la entrega de mi(s) producto(s)?
								</a>
							</div>
							<div id="collapse34" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>El mensajero de nuestros operadores logísticos entregará el pedido a alguna persona mayor de edad que manifieste vínculo familiar o de amistad con el comprador. Finalmente, tomará datos de la persona que recibe los productos, de tal modo que podamos llevar un registro de esto y darte la información en caso la requieras.</p>
									<p>De no encontrar a alguien para recibir el producto, se dejará una notificación donde se informa que se regresará al día siguiente. Si es que al segundo intento no se puede hacer entrega del pedido, nos comunicaremos contigo para coordinar una hora de entrega. Sin embargo, este tercer intento tendrá un costo adicional.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div ID="pnlDevoluciones" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">De</span>voluciones</h3>
					</div>
					<div class="accordion" id="accordion5">
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapse41">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Aceptan cambios y/o devoluciones?
								</a>
							</div>
							<div id="collapse41" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Sólo aceptamos devoluciones, cuya solicitud sea realizada hasta 7 días hábiles después de entregado el producto. Te emitiremos una nota de crédito con la cual podrás volver a adquirir otro durante los siguientes 6 meses.</p>
									<p>Recuerda que sólo se aceptará la devolución de un producto que no esté usado, que se encuentre en las mismas condiciones en las que se te entregó, con empaque y etiquetas originales. Además deberás contar con la boleta o factura original de tu compra.</p>
									<p>Para mayor información entra a <a href="/Terminos">Políticas de Devoluciones</a>.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapse42">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cuánto tiempo tengo para devolver un producto?
								</a>
							</div>
							<div id="collapse42" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Una vez que recibas tu producto tienes 7 días hábiles para devolverlo. Nosotros te devolveremos el dinero y puedes utilizarlo para hacer otro pedido.</p>
									<p>Si recibiste tu producto y ya pasaron los 7 días hábiles, te sugerimos tramitar la garantía con el proveedor. Revisa los tiempos y las razones que valida el proveedor para devolver el producto.</p>
									<p>Si necesitas ayuda o quieres conocer los conceptos de garantía del fabricante, comunícate con nosotros y con gusto te ayudaremos a tramitarla.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapse43">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué hago si no tengo el paquete original para la devolución?
								</a>
							</div>
							<div id="collapse43" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Para la devolución, el paquete original es tan importante como el producto mismo; cuídalo, guárdalo y manéjalo con cuidado para que no tengas inconvenientes al momento de devolverlo. Sin el paquete y las etiquetas originales no se aceptarán devoluciones.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div ID="pnlProblemasPedido" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Problemas </span>con mi pedido</h3>
					</div>
					<div class="accordion" id="accordion6">
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#collapse51">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué hago si la entrega de mi pedido está retrasada?
								</a>
							</div>
							<div id="collapse51" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Revisa el tiempo de entrega de tu producto. Para conocer el tiempo estimado de entrega, puedes contar a partir del día en el que recibiste el correo de confirmación y desde esa fecha empezar a contar en días hábiles el tiempo de entrega que se especifica en el correo.</p>
									<p>También, puedes ingresar a <span class="bolder">'Mi Cuenta'</span> y revisar el estado de tu pedido en la sección llamada <span class="bolder">'Mis Pedidos'</span>.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#collapse52">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué hago si mi producto llegó dañado?
								</a>
							</div>
							<div id="collapse52" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Si recibiste el producto dañado por maltrato en el envío, comunícate inmediatamente con nosotros en un plazo de máximo 7 días hábiles, para hacer la devolución de tu producto y el rembolso de tu dinero.</p>
									<p>Si el producto no funciona, en primer lugar revisa el manual para ver si puedes solucionar el inconveniente que presenta.</p>
									<p>Si tu producto todavía no funciona y presenta fallas técnicas, comunícate con nosotros en un plazo máximo 7 días hábiles después de recibirlo; en NOOB OUT comprobaremos la calidad de tu producto y lo reemplazaremos por uno nuevo o te devolveremos el dinero.</p>
									<p>Si ya pasaron los 7 días hábiles de recibir tu producto, debes revisar los conceptos de garantía del proveedor y si tienes una razón válida, puedes contactarte con el proveedor o con nosotros para ayudarte a hacer uso de la garantía.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#collapse53">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué hago si mi producto no es el que pedí?
								</a>
							</div>
							<div id="collapse53" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Si no recibes el producto que ordenaste, comunícate con nosotros a través de la sección <span class="bolder">‘CONTACTANOS’</span>.</p>
								</div>
							</div>
						</div>
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#collapse54">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Qué hago si no recibí todos los productos que ordené?
								</a>
							</div>
							<div id="collapse54" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Si no recibiste todos los productos que ordenaste en una sola entrega no te preocupes. Recuerda que hay productos en tu orden que pueden tener varios tiempos de entrega, estos te serán enviados en diferentes momentos.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div ID="pnlDatosPersonales" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Sobre </span>mis datos personales</h3>
					</div>
					<div class="accordion" id="accordion7">
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#collapse61">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Es seguro dejar mis datos personales en NOOB OUT?
								</a>
							</div>
							<div id="collapse61" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Sí, toda la información es manejada con total seguridad y confidencialidad, pensando siempre en tu seguridad. La información solicitada es para llevar un registro de usuarios y poder estar en contacto en caso de algún inconveniente. No se comparte ni vende tu información a terceros.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div ID="pnlContacto" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Con</span>tacto</h3>
					</div>
					<div class="accordion" id="accordion8">
						<div class="accordion-group accordion-style-2">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#collapse71">
									<span class="bg-for-icon"><i class="icon-minus"></i><i class="icon-plus"></i></span>
									¿Cómo me puedo contactar con NOOB OUT?
								</a>
							</div>
							<div id="collapse71" class="accordion-body collapse">
								<div class="accordion-inner">
									<p>Puedes comunicarte con nosotros a través de la sección <span class="bolder">‘CONTACTANOS’</span> ubicada en </p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
	<script type="text/javascript">
		var pageUrl = '<%=ResolveUrl("Faq.aspx")%>'

		$(document).ready(function () {
			SeleccionarMenu("");
		});

		function SeleccionarSubMenu(menu) {
			$("#liSobreCompra").removeClass("active");
			$("#liMediosPagos").removeClass("active");
			$("#liEnvioProducto").removeClass("active");
			$("#liDevoluciones").removeClass("active");
			$("#liProblemasPedido").removeClass("active");
			$("#liDatosPersonales").removeClass("active");
			$("#liContacto").removeClass("active");

			$("#pnlInicio").css("display", "none");
			$("#pnlSobreCompra").css("display", "none");
			$("#pnlMediosPagos").css("display", "none");
			$("#pnlEnvioProducto").css("display", "none");
			$("#pnlDevoluciones").css("display", "none");
			$("#pnlProblemasPedido").css("display", "none");
			$("#pnlDatosPersonales").css("display", "none");
			$("#pnlContacto").css("display", "none");

			switch (menu) {
				case 1:
					$("#liSobreCompra").addClass("active");
					$("#pnlSobreCompra").css("display", "");
					break;
				case 2:
					$("#liMediosPagos").addClass("active");
					$("#pnlMediosPagos").css("display", "");
					break;
				case 3:
					$("#liEnvioProducto").addClass("active");
					$("#pnlEnvioProducto").css("display", "");
					break;
				case 4:
					$("#liDevoluciones").addClass("active");
					$("#pnlDevoluciones").css("display", "");
					break;
				case 5:
					$("#liProblemasPedido").addClass("active");
					$("#pnlProblemasPedido").css("display", "");
					break;
				case 6:
					$("#liDatosPersonales").addClass("active");
					$("#pnlDatosPersonales").css("display", "");
					break;
				case 7:
					$("#liContacto").addClass("active");
					$("#pnlContacto").css("display", "");
					break;
			}
		}
	</script> 
</asp:Content>
