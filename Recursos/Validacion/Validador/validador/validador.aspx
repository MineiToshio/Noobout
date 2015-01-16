<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="validador.aspx.vb" Inherits="validador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/estilos.css" type="text/css" />
    <link rel="stylesheet" href="css/style_tools.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bootstrap pspagoefectivo">
          <div class="page-head">
              <ul class="breadcrumb page-breadcrumb">
                  <li class="breadcrumb-current">
                      <i class="icon-AdminParentModules"></i>
                  </li>
              </ul>
              <h2 class="page-title">
                  Validar "Configuración PagoEfectivo"
              </h2>

          </div>
      </div>
        <div class="bootstrap pspagoefectivo">
            <div id="div_warning" class="alert alert-warning" runat="server">
        		    <button type="button" class="close" data-dismiss="alert" onclick="$('#ctl00_ContentPlaceHolder1_div_warning').hide();">×</button>
        		    <h4>Hay <span id="spn_count_warning" runat="server"></span> alerta(s):</h4>
  				    <ul id="spn_msj_warning" runat="server"></ul>
        	    </div>
            <div id="div_success" class="module_confirmation conf confirm alert alert-success" runat="server">
        	    <button type="button" class="close" data-dismiss="alert" onclick="$('#ctl00_ContentPlaceHolder1_div_success').hide();">×</button>
        	    Validación correcta
            </div>
      </div>
</asp:Content>