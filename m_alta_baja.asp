<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"


varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsnivel = Request.Form("lsnivel")
lsUsuario = Request.Form("id_usuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

idProyecto=Session("id_proyecto")


		consulta1="exec dbo.uspGet_DatosContratadosActivos   '"&varccdd&"', '"&varccpp&"', '"&varccdi&"', '1', '','"&lsnivel&"' ,'', '"&idProyecto&"' "
		
		response.Write(consulta1)
		

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
            <span class="titulo">RRHH Asignado: </span><br>
		    <table width='98%' class="tabla2">
            </table>
                <table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
    <tr style="font-size:11px">
      <th width="3%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
      <th width="4%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DNI <span class="e_td_string1">
        <input name="txtID_PER" type="hidden" id="txtID_PER" value="<%=RsP.Fields("id_per")%>" />
      </span></th>
      <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" ><span class="e_td_string1">
        <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
      </span>Provincia</th>
      <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Distrito</th>
      <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Cargo</th>
      <th width="7%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Fecha Incio</th>
      <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Fecha Fin</th>
    <th width="29%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nombre</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Pago Completo Procesado</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Alerta</th>
    <th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Registrar</th>
  <!--  <th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Baja<br>Capacitaci&oacute;n</th> -->
    </tr>
  <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
  <tr class='<%=clase%>'>
    <td height="34" class='e_td_string1'><%response.Write(cont)%></td>
    <td class='e_td_string1'><%=RsP.Fields("dni")%>
    </td>
    <td class='e_td_string1'><%=RsP.Fields("prov")%></td>
    <td class='e_td_string1'><%=RsP.Fields("dist")%></td>
    <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
    <td class='e_td_string1'><%=RsP.Fields("fec_inicio")%></td>
    <td class='e_td_string1'><%=RsP.Fields("fechaFin")%></td>
    <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
    <td class='e_td_string1'><%=RsP.Fields("FlagPagoCom")%></td>
    <td align="center" class='e_td_string1' id="A<%=RsP.Fields("id_Contratos")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RsP.Fields("posbaja")="1" then response.Write("checked=""checked""")  end if %> name="Al<%=RsP.Fields("id_Contratos")%>"  onclick="alerta_datos('<%=RsP.Fields("id_Contratos")%>',this,'<%=lsUsuario%>', '<%=idProyecto%>')" id="Al<%=RsP.Fields("id_Contratos")%>" /></td>
    
    
    <td align="center" class='e_td_string1' id="T<%=RsP.Fields("dni")%>"><% if RsP.Fields("ncontratos")=0 then %><img src="images/edita.gif" width="15" height="14" onclick="mostrar_datos('<%=RsP.Fields("id_contratos")%>','1')"/><% else %>
    <img src="images/cierre.png" width="16" height="16" />
   <% end if %> 
    
    </td>
   <!-- <td align="center" class='e_td_string1' id="T<%=RsP.Fields("dni")%>"><% if RsP.Fields("ncontratos")=0 then %><img src="images/edita.gif" width="15" height="14" onclick="mostrar_datos('<%=RsP.Fields("id_contratos")%>','2')"/><% else %>
    <img src="images/cierre.png" width="16" height="16" />
   <% end if %> 
    
    </td>  -->
    <% dato = dato+1
		  lsRptaO1=0
			lsRptaO2=0		
				 %>		
    <% 
		registro = registro + 1
		dato2 = dato2+1 %>
    <%		RsP.MoveNext
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
          

