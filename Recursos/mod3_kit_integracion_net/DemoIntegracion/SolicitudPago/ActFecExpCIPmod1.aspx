<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ActFecExpCIPmod1.aspx.vb" Inherits="ActFecExpCIPmod1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <form id="form1" runat="server">
           <div>
            <br />
             1)  Prueba Actualizaci&oacute;n de CIP desde WS
            <table>
             <tr>
                <td>cip:</td>
                <td style="width: 506px">
                    <asp:TextBox ID="txtCIP" runat="server"></asp:TextBox>
                </td>
             </tr>  
             <tr>
                <td>Fecha de Expiración:</td>
                <td style="width: 506px">
                    <div id="datetimepicker" class="input-append date">
                      <asp:TextBox ID="txtFechaExpiracion" runat="server"></asp:TextBox>
                      <span class="add-on">
                        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                      </span>
                    </div>
                    <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
                    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
                    <script type="text/javascript" src="Scripts/bootstrap-datetimepicker.min.js"></script>
                    <script type="text/javascript" src="Scripts/bootstrap-datetimepicker.pt-BR.js"></script>

                    <script type="text/javascript">
                        $('#datetimepicker').datetimepicker({
                            format: 'dd/MM/yyyy hh:mm:ss',
                            language: 'pt-BR'
                        });
                    </script>
                </td>
             </tr>                  
             <tr>
                <td></td>
                <td style="width: 506px">
                    <asp:Button ID="btnActualizarCIP" runat="server" Text="Actualizar CIP" />
                </td>
             </tr>                         
            </table>
                
                <br />
                
                <table>
                <tr>
                    <td>Resultado:</td>
                    <td></td>
                </tr>
                    <tr>
                        <td>Estado:</td>
                        <td>
                            <asp:TextBox ID="txtEstado" runat="server"></asp:TextBox>
                        </td>
                     </tr>                            
                    <tr>
                        <td>Mensaje:</td>
                        <td>
                            <asp:TextBox ID="txtMensaje" runat="server"></asp:TextBox>
                        </td>
                     </tr>                         
                </table>
            </div>
    </form>
</body>
</html>
