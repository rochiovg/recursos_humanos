<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
		 	 

Response.ContentType="text/html; charset=iso-8859-1"

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
valor=Request.Form("valor")
vmin=Request.Form("vmin")
vmax=Request.Form("vmax")
vcantidad=Request.Form("vcantidad")


id_proyecto=session("id_proyecto") 

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

lscargo=Mid(plsCargo,2)



		consulta1 = "EXEC dbo.pa_ficha_calificacionAuto '" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "' , '" & id_proyecto & "', '" & valor & "', '" & vmin & "' , '" & vmax & "' , '" & vcantidad & "'" 
		

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3
	if varccdd="99" and varccpp="99" and varccdi="99" then
				   vartittn=" A Nivel Nacional"
				end if
				if varccdd<>"99" then
				   vartit1= "Departamento : " & nomccdd
				end if
				if varccpp<>"99" then
				   vartit2= " / Provincia : "& nomccpp
				end if
				if varccdi<>"99" then
				
				   vartit3= " / Distrito : "&nomccdi
				end if
				strubig=strubig1 & strubig2 & strubig3
				strubigT=strubig1T & strubig2T & strubig3T
				vartitt=vartit1 & vartit2 & vartit3
	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
                
               <tr>
                  <td colspan="15" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%></span></td>
                </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOMBRES</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >EDAD</th>
                <th  bgcolor="#DAE8F3" class="dato3" >FECHA NAC.</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >NIVEL EDUCATIVO</th>
		        <th bgcolor="#DAE8F3" class="dato3" >GRADO EDUCATIVO</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >PROFESION</th>
		        <th bgcolor="#DAE8F3" class="dato3" >TRABAJO DE CAMPO</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >PROYECTO</th>
                <th  bgcolor="#DAE8F3" class="dato3" >NOTA CALIFICACI&Oacute;N</th>
                <th  bgcolor="#DAE8F3" class="dato3" >PRESELECCI&Oacute;N</th>
          

		        </tr>
		      <% 	registro = 0					
		Do While Not RsP.EOF
		response.Flush()
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If
			
		if RsP.Fields("maltrabajador")=1 then
			a="bgcolor=""#FF0000"""
		else
			a="bgcolor=""#F8FAFC"""
		end if	
		
			cont = registro+1 %>
		      <tr <%=a%> style="font-size:9px;">
		        <td height="34" class='e_td_string1'><%response.Write(cont)%> </td>
                <% if RsP.Fields("maltrabajador")=1 then %>
		        <td  ><a href="#" class="titulo3" onClick="javascript:enviarcardDatos('<%=RsP.Fields("Dni")%>')"><%=RsP.Fields("Dni")%></td>
                <%else%>
                 <td  ><%=RsP.Fields("Dni")%></td>
                <%end if%>
                
		        <td ><%=RsP.Fields("nombre")%></td>
		        <td ><%=RsP.Fields("edad")%></td>
                <td ><%=RsP.Fields("fec_nac")%></td>
		        <td ><%=RsP.Fields("nivel")%></td>
		        <td ><%=RsP.Fields("gradoP")%></td>
		        <td ><%=RsP.Fields("profesionD")%></td>
		        <td >&nbsp;<%="A&ntilde;o:"&RsP.Fields("expCampo_anio")&" Meses:"&RsP.Fields("expCampo_meses")%></td>
		        <td >&nbsp;<%=RsP.Fields("proyecto")%></td>
                <td >&nbsp;<%=RsP.Fields("NOTA_AUTOMATICA")%></td>
				
                <%  varvisualiza="enabled"
		
       if RsP.Fields("Activo")="1" or RsP.Fields("Activo")="2" or RsP.Fields("cenviocontra")="1"  or RsP.Fields("cenviocontra")="2" TheN
	     		varvisualiza="disabled"
       end if%>
                
                <td  align="center" id="t<%=RsP.Fields("ID_PER")%>"><%=RsP.Fields("APROBO_AUTOMATICA")%></td>



               
        <% lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close %>
	          </tr>
		    
            </table>
<% else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
                </table>
		<% end If %>

