<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<% 

Response.ContentType="text/html; charset=iso-8859-1"
Server.ScriptTimeout = 30000 

id_usuario=Session("id_usuario")
id_cc=Request("id_cc")


sql1 = "EXEC dbo.pa_algoritmo_listar '"&id_cc&"'  "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3
		
		If Not RsP.BOF And Not RsP.EOF Then  
			algoritmo_id=RsP.Fields("algoritmo_id")
			id_convocatoriacargo=RsP.Fields("id_convocatoriacargo")
			if RsP.Fields("f_acad_min")="" or RsP.Fields("f_acad_min")="0"  or isnull(RsP.Fields("f_acad_min")) then 
				f_acad_min=""
			else
				f_acad_min=RsP.Fields("f_acad_min")
			end if
			
			if RsP.Fields("f_acad_max")="" or RsP.Fields("f_acad_max")="0"  or isnull(RsP.Fields("f_acad_max")) then 
				f_acad_max=""
			else
				f_acad_max=RsP.Fields("f_acad_max")
			end if
			
			if RsP.Fields("experiencia_rangos")="" or RsP.Fields("experiencia_rangos")="0"  or isnull(RsP.Fields("experiencia_rangos")) then 
				experiencia_rangos=""
			else
				experiencia_rangos=RsP.Fields("experiencia_rangos")
			end if
			
			if RsP.Fields("experiencia_min")="" or RsP.Fields("experiencia_min")="0"  or isnull(RsP.Fields("experiencia_min")) then 
				experiencia_min=""
			else
				experiencia_min=RsP.Fields("experiencia_min")
			end if
			
			if RsP.Fields("experiencia_max")="" or RsP.Fields("experiencia_max")="0"  or isnull(RsP.Fields("experiencia_max")) then 
				experiencia_max=""
			else
				experiencia_max=RsP.Fields("experiencia_max")
			end if
			
			if RsP.Fields("capacitacion_rangos")="" or RsP.Fields("capacitacion_rangos")="0"  or isnull(RsP.Fields("capacitacion_rangos")) then 
				capacitacion_rangos=""
			else
				capacitacion_rangos=RsP.Fields("capacitacion_rangos")
			end if
			
			if RsP.Fields("capacitacion_min")="" or RsP.Fields("capacitacion_min")="0"  or isnull(RsP.Fields("capacitacion_min")) then 
				capacitacion_min=""
			else
				capacitacion_min=RsP.Fields("capacitacion_min")
			end if
			
			if RsP.Fields("capacitacion_max")="" or RsP.Fields("capacitacion_max")="0"  or isnull(RsP.Fields("capacitacion_max")) then 
				capacitacion_max=""
			else
				capacitacion_max=RsP.Fields("capacitacion_max")
			end if
	
	else
		algoritmo_id=""
		id_convocatoriacargo=""
		f_acad_min=""
		f_acad_max=""
		experiencia_rangos=""
		experiencia_min=""
		experiencia_max=""
		capacitacion_rangos=""
		capacitacion_min=""
		capacitacion_max=""
	end if 
		

%>
<html>
<head>
</head>
<body>

<table width="80%" align="center" class="tabla1">  
    	<tr bgcolor="#97CEEC">
        	<td colspan="2" style="text-align:center"> Formaci&oacute;n Acad&eacute;mica</td>
            <td colspan="2" style="text-align:center"> Experiencia Laboral</td>
            <td colspan="2" style="text-align:center"> Grupo de Edad</td>
        </tr>
        <tr>
        	<td colspan="2">
            	<input name="h_algoritmo_id" id="h_algoritmo_id" type="hidden" value="<%=algoritmo_id%>">
	            <input name="h_id_convocatoriacargo" id="h_id_convocatoriacargo" type="hidden" value="<%=id_convocatoriacargo%>">
            </td>
       	  <td>Cantidad de Rangos de Evaluaci&oacute;n:</td>
            <td><input  name="txtExran<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtExran<%=algoritmo_id%>" value="<%=experiencia_rangos%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','experiencia_rangos','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" /> </td>
            <td>Cantidad de Rangos de Evaluaci&oacute;n:</td>
            <td><input  name="txtCapRan<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtCapRan<%=algoritmo_id%>" value="<%=capacitacion_rangos%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','capacitacion_rangos','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" />  
            </td>
        </tr>
        
        <tr>
        	<td>Puntaje M&aacute;ximo</td>
       	  <td><input  name="txtFA_max<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtFA_max<%=algoritmo_id%>" value="<%=f_acad_max%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','f_acad_max','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" /> </td>
            <td>Puntaje M&aacute;ximo
            </td>
            <td><input  name="txtExMax<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtExMax<%=algoritmo_id%>" value="<%=experiencia_max%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','experiencia_max','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" /> </td>
            <td>Puntaje M&aacute;ximo</td>
            <td><input  name="txtCapMax<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtCapMax<%=algoritmo_id%>" value="<%=capacitacion_max%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','capacitacion_max','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" />  
            </td>
        </tr>
        
        <tr>
        	<td>Puntaje M&iacute;nimo</td>
       	  	<td><input  name="txtFA_min<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtFA_min<%=algoritmo_id%>" value="<%=f_acad_min%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','f_acad_min','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" /> </td>
            <td>Puntaje M&iacute;nimo
            </td>
            <td><input  name="txtExMin<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtExMin<%=algoritmo_id%>" value="<%=experiencia_min%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','experiencia_min','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" /> </td>
            <td>Puntaje M&iacute;nimo</td>
            <td><input  name="txtCapMin<%=algoritmo_id%>" class="etiqueta"  type="text" id="txtCapMin<%=algoritmo_id%>" value="<%=capacitacion_min%>"  onkeypress="return fs_numeros(event)" onBlur="guardarPuntaje('algoritmo','capacitacion_min','<%=algoritmo_id%>',this.value, this.id)" size="5" maxlength="2" />  
            </td>
        </tr>
        
        <tr>
        	<td colspan="2" style=" text-align:center"><input name="button" type="button" class="boton" id="button" value="Detalle" onClick="muestra_algoritmo_nivel('<%=id_cc%>', '1')"></td>
       	  <td colspan="2" style=" text-align:center"><input name="button" type="button" class="boton" id="button" value="Detalle" onClick="muestra_algoritmo_nivel('<%=id_cc%>', '2')"></td>
          <td colspan="2" style=" text-align:center"><input name="button" type="button" class="boton" id="button" value="Detalle" onClick="muestra_algoritmo_nivel('<%=id_cc%>', '3')"></td>
        </tr>
    </table>


</body>
</html>