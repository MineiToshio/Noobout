<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ConsultarCIP.aspx.vb" Inherits="ConsultarCIP" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div>
    <br />
  1)  Prueba de Consulta de CIP para empresas
    <table>  
     <tr>
        <td>Numero de CIP:</td>
        <td style="width: 506px">
            <asp:TextBox ID="txtCIPs" runat="server" Width="305px" ></asp:TextBox>
        </td>
     </tr>   
     <tr>
        <td></td>
        <td style="width: 506px">
            <asp:Button ID="btnEjecutar" runat="server" Text="Ejecutar" />
        </td>
     </tr>                         
    </table>
        
        <br />
        
        <table>
        <tr>
            <td>Resultado:</td>
            <td>
                <asp:TextBox ID="txtResultado" runat="server" TextMode="MultiLine" Height="276px" Width="801px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>Estado:</td>
            <td>
                <asp:TextBox ID="txtEstado" runat="server" Height="16px" Width="801px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Mensaje:</td>
            <td>
                <asp:TextBox ID="txtMensaje" runat="server" Height="16px" Width="801px"></asp:TextBox>
            </td>
        </tr>   
        </table>
     </div>   
    </form>
</body>
</html>
