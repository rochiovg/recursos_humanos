<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
 <%session.lcid=2057%>


<%

If lsUbigeo <> "" then



%>	
    
<HTML>
<HEAD> 
      <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
<!--#include file="cabecera.html"--> 
<!--#include file="pd_menu.asp"-->

<div align="center" id="formulario">
   	P&Aacute;GINA EN MANTENIMIENTO.
</div>

</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
