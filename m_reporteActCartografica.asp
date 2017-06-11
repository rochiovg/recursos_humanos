<%@ Language=VBScript%>

<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"


id = Request.Form("id")
lsDPTO = Request.Form("lsDPTO")
lsPROV = Request.Form("lsPROV")
lsDIST = Request.Form("lsDIST")
zona = Request.Form("zona")
seccion = Request.Form("seccion")
aeu = Request.Form("aeu")


cantvarccddTot=len(lsDPTO)
nomccdd = Mid(lsDPTO,3,cantvarccddTot-2)
varccdd = Mid(lsDPTO,1,2)

cantvarccppTot=len(lsPROV)
nomccpp = Mid(lsPROV,5,cantvarccppTot-4)
varccpp = Mid(lsPROV,3,2)

cantvarccdiTot=len(lsDIST)
nomccdi = Mid(lsDIST,7,cantvarccdiTot-6)
varccdi = Mid(lsDIST,5,2)

consulta1 = "exec dbo.PA_LISTAR_REPORTE_ACTUALIZACION  '"&id&"', '"&varccdd&"', '"&varccpp&"' , '"&varccdi&"', '"&zona&"', '"&seccion&"', '"&aeu&"' "	


	Set RsP = Server.CreateObject("ADODB.Recordset")
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3

	  If  Not RsP.BOF And Not RsP.EOF Then %>
      
      <div align="center" style="width:100%">
      <TABLE>
      	<tr>
       		<td align="center"><font class="titulo" style="text-align:center"> REPORTE DE CANTIDAD DE RESIDENTES APTOS PARA SER ENCUESTADORES<BR>
            (Fuente: Actualuzaci&oacute;n Cartogr&aacute;fica)</font>
            </td>
        </tr>
      </TABLE>
      </div>

<br>
     <table id="Exportar_a_Excel" width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
   	   
       <% if id=2 then %>
       <tr>
       		<td colspan="7" align="center" class="alerta5">  
            	<a href="#" onclick=" ver_reporte_ActCartografica('1','','','','0','0','0')" title="Ver anterior"> Retroceder </a>
            </td>
       </tr>
       <%elseif id=3 then %>
       <tr>
       		<td colspan="8" align="center" class="alerta5">  
            	<a href="#" onclick=" ver_reporte_ActCartografica('2','<%=lsDPTO%>', '<%=lsPROV%>', '<%=lsDIST%>', '<%=zona%>', '', '')" title="Ver anterior"> Retroceder </a>
            </td>
       </tr>
       <%elseif id=4 then %>
       <tr>
       		<td colspan="11" align="center" class="alerta5">  
            	<a href="#" onclick=" ver_reporte_ActCartografica('3','<%=lsDPTO%>', '<%=lsPROV%>', '<%=lsDIST%>', '<%=zona%>', '<%=seccion%>', '')" title="Ver anterior"> Retroceder </a>
            </td>
       </tr>
       <% end if %>
       <tr>
         <td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Nro</td>
         <td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DISTRITO</td>
         <td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ZONA</td>
         <% IF id>=2 then%>
         	<td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SECCI&Oacute;N</td>
         <%end if%>
         <% IF id>=3 then%>
         	<td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">AUE FINAL</td>
         <%end if%>
         <% IF id=4 then%>
         	<td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" >MANZANA</td>
            <td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FRENTE</td>
            <td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NUM. VIVIENDA</td>
         <%end if%>
         <td colspan="3" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">RESIDENTES</td>
         <% IF id=4 then%>
         <td rowspan="2" align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Invitaci&oacute;n</td>
         <% end if%>
       </tr>
       <tr>
         <td align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Sector P&uacute;blico</td>
         <td align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Estudiantes Nivel Superior</td>
         <td align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Estudiantes de Secundaria</td>
           
       </tr>
  <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
		response.Flush()
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
      <tr>
      <% if id=1  then 
      		if RsP.Fields("id")="0" then %>
            <tr bgcolor="#FFFFD9" style="text-align:center; font-weight:bold; ">
      		<td height="34" class='e_td_string1' colspan="3">TOTAL</td>     
      <%	else %>
      		<tr>
      		<td height="34" class='e_td_string1'><%=RsP.Fields("id")%></td>
        	<td class='e_td_string1'><%=nomccdi%></td>
	   		<%if RsP.Fields("zona")<>0 then %>
         		<td class='e_td_string1'><a href="#" onclick=" ver_reporte_ActCartografica('2', '<%=lsDPTO%>', '<%=lsPROV%>', '<%=lsDIST%>', '<%=RsP.Fields("zona")%>', '', '')" title="Ver Secciones"><%=RsP.Fields("zona")%></a></td>
         	<%else %>
         		<td class='e_td_string1'><%=RsP.Fields("zona")%>&nbsp;</td>
         	<%end if
	  		end if 
       end if%>	
		
      
      <% if id=2  then 
      		if RsP.Fields("id")="0" then %>
            <tr bgcolor="#FFFFD9" style="text-align:center; font-weight:bold;">
      		<td height="34" class='e_td_string1' colspan="4">TOTAL</td>
      
      <%	else %>
      		<tr>
      		<td height="34" class='e_td_string1'><%=RsP.Fields("id")%></td>
        	<td class='e_td_string1'><%=nomccdi%></td>
            <td class='e_td_string1'><%=zona%></td>
	   		<%if RsP.Fields("seccion")<>0 then %>
         		<td class='e_td_string1'><a href="#" onclick=" ver_reporte_ActCartografica('3', '<%=lsDPTO%>', '<%=lsPROV%>', '<%=lsDIST%>', '<%=zona%>', '<%=RsP.Fields("seccion")%>', '')" title="Ver AEUs"><%=RsP.Fields("seccion")%></a></td>
            <%else%>
         		<td class='e_td_string1'><%=RsP.Fields("seccion")%>&nbsp;</td>
         	<%end if
	  		end if 
       end if%>
        
       
       
       <% if id=3  then 
      		if RsP.Fields("id")="0" then %>
            <tr bgcolor="#FFFFD9" style="text-align:center; font-weight:bold;">
      		<td height="34" class='e_td_string1' colspan="5">TOTAL</td>
      
      <%	else %>
      		<tr>
      		<td height="34" class='e_td_string1'><%=RsP.Fields("id")%></td>
        	<td class='e_td_string1'><%=nomccdi%></td>
            <td class='e_td_string1'><%=zona%></td>
            <td class='e_td_string1'><%=seccion%></td>
	   		<%if RsP.Fields("AEU_FINAL")<>0 then %>
         		<td class='e_td_string1'><a href="#" onclick=" ver_reporte_ActCartografica('4', '<%=lsDPTO%>', '<%=lsPROV%>', '<%=lsDIST%>', '<%=zona%>', '<%=seccion%>', '<%=RsP.Fields("AEU_FINAL")%>')" title="Ver Manzanas, frentes y viviendas"><%=RsP.Fields("AEU_FINAL")%></a></td>
            <%else%>
         	<td class='e_td_string1'><%=RsP.Fields("AEU_FINAL")%>&nbsp;</td>
         	<%end if
	  		end if 
       end if%> 
       
       <% if id=4  then 
      		if RsP.Fields("id")="0" then %>
            <tr bgcolor="#FFFFD9" style="text-align:center; font-weight:bold;">
      		<td height="34" class='e_td_string1' colspan="9">TOTAL</td>
      
      <%	else %>
      		<tr>
      		<td height="34" class='e_td_string1'><%=RsP.Fields("id")%></td>
        	<td class='e_td_string1'><%=nomccdi%></td>
            <td class='e_td_string1'><%=zona%></td>
            <td class='e_td_string1'><%=seccion%></td>
            <td class='e_td_string1'><%=aeu%></td>
	   		<td class='e_td_string1' align="center"><%=RsP.Fields("manzana")%>&nbsp;</td>
            <td class='e_td_string1' align="center" ><%=RsP.Fields("FRENTE_ORD")%>&nbsp;</td>
            <td class='e_td_string1' align="center" ><%=RsP.Fields("ID_REG_OR")%>&nbsp;</td>
	  	<%	end if 
       end if%>  
        <td class='e_td_string1' align="center" ><%=RsP.Fields("sector_publico")%>&nbsp;</td>
        <td class='e_td_string1' align="center" ><%=RsP.Fields("estudiante_sup")%></td>
        <td class='e_td_string1' align="center" ><%=RsP.Fields("estuduante_sec")%></td>
        <% IF id=4 then%>
        <td class='e_td_string1' align="center" ><img src="images/PDF.jpg" onclick="exportar_invitacion()"  width="32" height="29" /></td>
        <%end if%>
      </tr>

    <% 
		registro = registro + 1
		RsP.MoveNext
		
		Loop	
		RsP.close 
		Set RsP = Nothing
		%>

     </table>
<% else %>
     <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
                </table>

       <% end If %>

     