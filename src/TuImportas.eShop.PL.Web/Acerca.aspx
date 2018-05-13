<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Acerca.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Acerca" EnableEventValidation="false" %>
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
							<a href="javascript:void(0)">Acerca</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="push-up blocks-spacer">
			<div class="row">
				
				<!--  ==========  -->
				<!--  = Sidebar =  -->
				<!--  ==========  -->
				<aside class="span3">
					<div class="sidebar-item">
						
						<!--  ==========  -->
						<!--  = Sidebar Title =  -->
						<!--  ==========  -->
						<div class="underlined">
							<h3><span class="light">Acerca</span> de Noobout</h3>
						</div>
						
						<!--  ==========  -->
						<!--  = Menu (affix) =  -->
						<!--  ==========  -->
						<div class="row">
							<div class="span3" id="spyMenu">
								<ul class="nav nav-pills nav-stacked">
									<li class="active"><a href="#jaka">¿Quienes somos? <i class="icon-caret-right pull-right"></i></a></li>
								</ul>
							</div>
						</div>
						
					</div>
				</aside> <!-- /sidebar -->
				
				<!--  ==========  -->
				<!--  = Main content =  -->
				<!--  ==========  -->
				<section class="span9">
					
					<!--  ==========  -->
					<!--  = Title =  -->
					<!--  ==========  -->
					<div class="underlined push-down-20">
						<h3><span class="light">A</span> Un poco acerca de nosotros</h3>
					</div> <!-- /title -->
					
					<!--  ==========  -->
					<!--  = Description=  -->
					<!--  ==========  -->
					<section class="blocks-spacer">
						<h5>Como empezó todo</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut feugiat mauris eget magna egestas porta. Curabitur sagittis sagittis neque rutrum congue. Donec lobortis dui sagittis, ultrices nunc ornare, ultricies elit. Curabitur tristique felis pulvinar nibh porta, sit amet interdum ligula placerat. Maecenas auctor, sem nec eleifend blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut feugiat mauris eget magna egestas porta. Curabitur sagittis sagittis neque rutrum congue. Donec lobortis dui sagittis, ultrices nunc ornare, ultricies elit. Curabitur tristique felis pulvinar nibh porta, sit amet interdum ligula placerat. Maecenas auctor, sem nec eleifend blandit.</p>
						
						<h5>¿Qué sigue?</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut feugiat mauris eget magna egestas porta. Curabitur sagittis sagittis neque rutrum congue. Donec lobortis dui sagittis, ultrices nunc ornare, ultricies elit. Curabitur tristique felis pulvinar nibh porta, sit amet interdum ligula placerat. Maecenas auctor, sem nec eleifend blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut feugiat mauris eget magna egestas porta. Curabitur sagittis sagittis neque rutrum congue. Donec lobortis dui sagittis, ultrices nunc ornare, ultricies elit. Curabitur tristique felis pulvinar nibh porta, sit amet interdum ligula placerat. Maecenas auctor, sem nec eleifend blandit.</p>
						
						<h5>Lo que hemos logrado</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut feugiat mauris eget magna egestas porta. Curabitur sagittis sagittis neque rutrum congue. Donec lobortis dui sagittis, ultrices nunc ornare, ultricies elit. Curabitur tristique felis pulvinar nibh porta, sit amet interdum ligula placerat. Maecenas auctor, sem nec eleifend blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut feugiat mauris eget magna egestas porta. Curabitur sagittis sagittis neque rutrum congue. Donec lobortis dui sagittis, ultrices nunc ornare, ultricies elit. Curabitur tristique felis pulvinar nibh porta, sit amet interdum ligula placerat. Maecenas auctor, sem nec eleifend blandit.</p>
					</section>
				</section> <!-- /main content -->
			</div>
		</div>
	</div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
	<script type="text/javascript">
		var pageUrl = '<%=ResolveUrl("Acerca.aspx")%>'
	</script> 
</asp:Content>
