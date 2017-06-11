<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<% 

Response.ContentType="text/html; charset=iso-8859-1"
Server.ScriptTimeout = 30000 

id_usuario=Session("id_usuario")
id_cc=Request("id_cc")


sql1 = "EXEC dbo.pa_algoritmo_capacitacion_listar '"&id_cc&"'  "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3

%>
<html>
<head>
</head>
<body>

<table  class="tabla1" align="center" width="50%">
	<tr>
    	<td bgcolor="#97CEEC" colspan="3" align="center" style="text-align:center;">Grupo de Edad - Detalle</td>
    </tr>
<% If Not RsP.BOF And Not RsP.EOF Then
	cont=0  
	Do While Not RsP.EOF
	cont=cont+1 
%>
	<tr>
    	<td><%=cont%>
        </td>
    	<td> De 
        <input name="txtRmin<%=RsP.Fields("algoritmo_capacitacion_id")%>" class="etiqueta"  type="text" id="txtRmin<%=RsP.Fields("algoritmo_capacitacion_id")%>" value="<%=RsP.Fields("rango_min")%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo_capacitacion','rango_min','<%=RsP.Fields("algoritmo_capacitacion_id")%>',this.value, this.id)" size="5" maxlength="3" /> a 
        
        <input name="txtRmax<%=RsP.Fields("algoritmo_capacitacion_id")%>" class="etiqueta"  type="text" id="txtRmax<%=RsP.Fields("algoritmo_capacitacion_id")%>" value="<%=RsP.Fields("rango_max")%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo_capacitacion','rango_max','<%=RsP.Fields("algoritmo_capacitacion_id")%>',this.value, this.id)" size="5" maxlength="3" /> A&ntilde;os:
        </td>
        <td>
        <input name="txtPun<%=RsP.Fields("algoritmo_capacitacion_id")%>" class="etiqueta"  type="text" id="txtPun<%=RsP.Fields("algoritmo_capacitacion_id")%>" value="<%=RsP.Fields("puntaje")%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo_capacitacion','puntaje','<%=RsP.Fields("algoritmo_capacitacion_id")%>',this.value, this.id)" size="5" maxlength="3" />   
        </td>
    </tr>

<%
		RsP.MoveNext
		Loop	
		RsP.close
else%>

	<tr>
    	<td> No existen datos disponibles
        </td>
    </tr>
<%end if%>
</table>

</body>
</html>