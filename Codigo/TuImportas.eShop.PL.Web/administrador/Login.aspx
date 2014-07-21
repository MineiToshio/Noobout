<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Login" %>

<!DOCTYPE html>


<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta charset="UTF-8" />
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Login" />
	<meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
	<meta name="author" content="Codrops" />
	<link rel="shortcut icon" href="images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="/stylesheets/login.css" />
	<link rel="stylesheet" type="text/css" href="/stylesheets/animate-custom.css" />
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<div class="container">
				<header>
					<img src="/images/logo.png" />
				</header>
				<section>				
					<div id="container_demo" >
						<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
						<a class="hiddenanchor" id="toregister"></a>
						<a class="hiddenanchor" id="tologin"></a>
						<div id="wrapper">
							<div id="login" class="animate form" onkeypress="EnterLogin();">
								<h1>Ingresar al Sistema</h1> 
								<p> 
									<label for="txtUsuario" class="uname" data-icon="u" > usuario </label>
									<input id="txtUsuario" name="username" type="text" placeholder="miusuario"/> <%--oninvalid="this.setCustomValidity('Por favor ingresar el usuario')"--%>
									<%--<asp:TextBox runat="server" id="txtUsuario" name="username" required="required" type="text" placeholder="miusuario" ></asp:TextBox>--%>
								</p>
								<p> 
									<label for="txtPassword" class="youpasswd" data-icon="p"> contraseña </label>
									<input id="txtPassword" name="password" type="password" placeholder="ej. X8df!90EO" /> 
									<%--<asp:TextBox runat="server" id="txtPassword" name="password" required="required" type="password" placeholder="ej. X8df!90EO"></asp:TextBox>--%>
								</p>
								<%--<p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">mantenme conectado</label>
								</p>--%>
								<p class="login button"> 
									<%--<input type="submit" value="Login" id="btnLogin" onclick="login();" /> --%>
									<input type="button" value="Login" id="btnLogin" onclick="login();" /> 
									<%--<asp:Button runat="server" ID="btnLogin" Text="Ingresar" onclick="btnLogin_Click" />--%>
								</p>
								<p class="change_link">
									¿olvidaste tu contraseña?
									<a href="#toregister" class="to_register">Recupérala</a>
								</p>
							</div>

							<div id="register" class="animate form">
								<h1> Recuperar Datos</h1> 
								<%--<p> 
									<label for="usernamesignup" class="uname" data-icon="u">Your username</label>
									<input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
								</p>--%>
								<p> 
									<label for="emailsignup" class="youmail" data-icon="e" > correo electrónico</label>
									<input id="txtCorreo" name="emailsignup" required="required" type="email" placeholder="micorreo@mail.com"/>
									<%--<asp:TextBox runat="server" id="txtCorreo" name="emailsignup" required="required" type="email" placeholder="micorreo@mail.com"></asp:TextBox>--%>
								</p>
								<%--<p> 
									<label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
									<input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
								</p>
								<p> 
									<label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
									<input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
								</p>--%>
								<p class="signin button"> 
									<input type="button" value="Recuperar" id="btnRecuperar" onclick="recuperar_datos();" /> 
									<%--<asp:Button runat="server" Text="Recuperar" ID="btnRecuperar" 
										onclick="btnRecuperar_Click" />--%>
								</p>
								<p class="change_link">  
									¿te acordaste tu contraseña?
									<a href="#tologin" class="to_register"> Regresar </a>
								</p>
							</div>
						</div>
					</div>  
				</section>
			</div>
		</div>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
			if (typeof jQuery == 'undefined') {
				document.write('<script src="js/jquery.min.js"><\/script>');
			}
		</script>

		<script src="/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/noty/packaged/jquery.noty.packaged.min.js"></script>
		<script src="/js/global.js" type="text/javascript"></script>
		<script src="/js/jquery.blockUI.js" type="text/javascript"></script>
		<script type="text/javascript">
			var page_url = '<%= ResolveUrl("Login.aspx") %>';

			$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

			function failpass() {
				var n = noty({
					text: 'usuario o contraseña incorrectos',
					type: 'warning',
					dismissQueue: true,
					layout: 'top',
					theme: 'defaultTheme',
					timeout: 5000
				});
			}

			function login() {
				$.ajax
				({
					type: "POST",
					url: page_url + "/Ingresar",
					data: "{'usuario': '" + $('#txtUsuario').val() +
						"', 'password': '" + $('#txtPassword').val() + "'}",
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (response) {
						if(response.d == 0)
						{
							top_noty('warning', 'usuario o contraseña incorrectos.');
							txtUsuario.focus();
						}
						else
							window.location.replace("/Admin");
					},
					error: function (response) {
						error();
					}
				});

			}

			function recuperar_datos() {
				$.ajax
				({
					type: "POST",
					url: page_url + "/Recuperar_Datos",
					data: "{'email': '" + $('#txtCorreo').val() + "'}",
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (response) {
						if (response.d == 1)
							top_noty('information', 'Se le ha enviado un correo con la información para recuperar su contraseña.');
						else
							top_noty('information', 'Correo inválido.');

						$('#txtCorreo').val('')
						txtCorreo.focus();
					},
					error: function (response) {
						error();
					}
				});

			}

			function EnterLogin() {
				if (event.keyCode == '13') {
					$("#btnLogin").click();
					event.preventDefault();
				}
			}
		</script>
	</form>
</body>
</html>
