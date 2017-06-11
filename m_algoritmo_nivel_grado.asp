<%@ Language=VBScript %>

<!--#include file="Conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<% 

Response.ContentType="text/html; charset=iso-8859-1"
Server.ScriptTimeout = 30000 

id_usuario=Session("id_usuario")
id_cc=Request("id_cc")

sub generaNivel_grado(id_cc)
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = cnn.execute(" exec dbo.pa_nivel_grado_listar_faltantes '"&id_cc&"'")
	
	If Not wRsDptoapli.BOF And Not wRsDptoapli.EOF Then
		Response.Write "<select class=""e_combo"" style=""width:250px"" id=""cmb_nivel_grado"" name=""cmb_nivel_grado"" >"
		Response.Write " <option value=""0"">Seleccione...</option>"
		While not wRsDptoapli.EOF
			Response.Write "<option title="""&wRsDptoapli(1)&""" value=""" &wRsDptoapli(0)&""">"&wRsDptoapli(1) & "</option>"
			wRsDptoapli.MoveNext
		Wend
		Response.Write "</select>"
	
	else 
 		Response.Write "<select class=""e_combo"" style=""width:250px"" id=""cmb_nivel_grado"" name=""cmb_nivel_grado"" >"
		Response.Write " <option value=""0"">Seleccione...</option>"
		Response.Write "</select>"
	end if
 
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sql1 = "EXEC dbo.pa_algoritmo_nivel_listar '"&id_cc&"'  "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3

%>
<html>
<head></head>
<body>

	<table  class="tabla1" align="center">
		<tr>
    	<td bgcolor="#97CEEC" colspan="4" align="center" style="text-align:center;">
      	Formaci&oacute;n Acad&eacute;mica - Detalle
      </td>
    </tr>
		<% 
		If Not RsP.BOF And Not RsP.EOF Then
      cont=0  
      Do While Not RsP.EOF
      	cont=cont+1 
    %>
		<tr>
    	<td><%=cont%></td>
    	<td><%= RsP.Fields("descripcion")%></td>
      <td>
        <input name="txt<%=RsP.Fields("algoritmo_acad_id")%>" class="etiqueta"  type="text" id="txt<%=RsP.Fields("algoritmo_acad_id")%>" value="<%=RsP.Fields("puntaje")%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo_formacion_acad','puntaje','<%=RsP.Fields("algoritmo_acad_id")%>',this.value, this.id)" size="5" maxlength="2" />
      </td>
      <td align="center">
      	<img src="images/Eliminar.PNG" align="left" onClick="eliminar_reg_ang('<%=RsP.Fields("algoritmo_acad_id")%>', '<%=id_cc%>')" />
      </td>
    </tr>

		<%
				RsP.MoveNext
			Loop
		%>

		<tr>
    	<td><%=cont+1%></td>
    	<td><% generaNivel_grado(id_cc)%></td>
      <td>
        <input name="txt_n_nivel" class="etiqueta"  type="text" id="txt_n_nivel" value=""  onkeypress="return fs_numeros(event)" size="5" maxlength="2" />   
      </td>
      <td align="center">
      	<img src="images/guardar.jpg" align="left" width="35px" height="35px" onClick="guardar_reg_ang('<%=id_cc%>')" />
      </td>
    </tr>
		<%
			RsP.close
		else
		%>
		<tr>
    	<td> No existen datos disponibles </td>
    </tr>
		<%
		end if
		%>
</table>
</body>
</html>