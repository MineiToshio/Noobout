<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ElimCIPmod1.aspx.vb" Inherits="ElimCIPmod1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">        
        <div>
        <br />
            1)  Prueba Eliminación de CIP desde WS
        <table>
            <tr>
            <td>cip:</td>
            <td style="width: 506px">
                <asp:TextBox ID="txtCIP" runat="server"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td></td>
            <td style="width: 506px">
                <asp:Button ID="btnEliminarCIP" runat="server" Text="Eliminar CIP" />
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
