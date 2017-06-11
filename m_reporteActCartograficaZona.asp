<%@ Language=VBScript%>

<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 2304000  
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"


lsDPTO = Request.Form("lsDPTO")
lsPROV = Request.Form("lsPROV")
lsDIST = Request.Form("lsDIST")
lsZona = Request.Form("lsZona")
lsSeccion = Request.Form("lsSeccion")

cantvarccddTot=len(lsDPTO)
nomccdd = Mid(lsDPTO,3,cantvarccddTot-2)
varccdd = Mid(lsDPTO,1,2)

cantvarccppTot=len(lsPROV)
nomccpp = Mid(lsPROV,5,cantvarccppTot-4)
varccpp = Mid(lsPROV,3,2)

cantvarccdiTot=len(lsDIST)
nomccdi = Mid(lsDIST,7,cantvarccdiTot-6)
varccdi = Mid(lsDIST,5,2)

consulta1 = "exec dbo.pa_reporte_cpv_actualizacion   '"&varccdd&"', '"&varccpp&"' , '"&varccdi&"', '"&lsZona&"', '"&lsSeccion&"' "	

	Set RsP = Server.CreateObject("ADODB.Recordset")
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3

	  If  Not RsP.BOF And Not RsP.EOF Then   %>
      
      <div align="center" style="width:100%">
      <TABLE>
      	<tr>
       		<td colspan="2" align="center"><font class="titulo" style="text-align:center">LISTADO DE VIVIENDAS DE POTENCIALES FUNCIONARIOS CENSALES</font></td>
        </tr>
        <tr>
   		  <td align="center">
            	<table border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
                    <tr   bgcolor="#DAE8F3">
                   	  <td colspan="3"> A. UBICACION GEOGR&Aacute;FICA
                      </td>
                    </tr>
                    <tr>
                   	  <td>DEPARTAMENTO
                      </td>
                      <td><%=varccdd%>
                        </td>
                      <td><%=nomccdd%>
                        </td>
                    </tr>
                    <tr>
                   	  <td>PROVINCIA
                      </td>
                      <td><%=varccpp%>
                        </td>
                      <td><%=nomccpp%>
                        </td>
                    </tr>
                    <tr>
                    	<td>DISTRITO
                        </td>
                        <td><%=varccdi%>
                        </td>
                        <td><%=nomccdi%>
                        </td>
                    </tr>
                    
                
                </table>
            
          </td>
          <td>
            	<table border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
                	<tr   bgcolor="#DAE8F3">
                   	  <td colspan="2"> B. UBICACI&Oacute;N CENSAL
                      </td>
                    </tr>
                    <tr>
                    	<td> ZONA
                        </td>
                        <td> <%=lsZona%>
                        </td>
                    </tr>
                </table>
          </td>
        </tr>
        <tr>
       		<td colspan="2" align="center">
            	<table border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
                     <tr bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">
                       <td rowspan="2">N&deg;</td>
                       <td rowspan="2">SECCI&Oacute;N</td>
                       <td rowspan="2">MANZANA</td>
                       <td colspan="9">DIRECCI&Oacute;N DE LA VIVIENDA</td>
                       <td rowspan="2">Apellidos y Nombres del Jefe de Hogar</td>
                       <td colspan="3">N&deg; de personas</td>
                     </tr>
                     <tr bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">
                       <td>Tipo de Via</td>
                       <td>Nombre de Via</td>
                       <td>N&deg; de Puerta</td>
                       <td>Block</td>
                       <td>Manzana</td>
                       <td>Lote</td>
                       <td>Piso</td>
                       <td>Interior</td>
                       <td>Km.</td>
                       <td>4to y 5to de sec</td>
                       <td>Educ. superior</td>
                       <td>Emp. P&uacute;blicos</td>
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
                     <TR  height="34" class='e_td_string1'>
                        <TD><%=RsP.Fields("ID")%></TD>
                        <TD><%=RsP.Fields("seccion")%></TD>
                        <TD><%=RsP.Fields("manzana")%></TD>
                        <TD><%=RsP.Fields("P20")%></TD>
                        <TD><%=RsP.Fields("P21")%></TD>
                        <TD><%=RsP.Fields("P22_A")%></TD>
                        <TD><%=RsP.Fields("P23")%></TD>
                        <TD><%=RsP.Fields("P24")%></TD>
                        <TD><%=RsP.Fields("P25")%></TD>
                        <TD><%=RsP.Fields("P26")%></TD>
                        <TD><%=RsP.Fields("P27_A")%></TD>
                        <TD>&nbsp;</TD>
                        <TD><%=RsP.Fields("P32")%></TD>
                        <TD><%=RsP.Fields("estuduante_sec")%></TD>
                        <TD><%=RsP.Fields("estudiante_sup")%></TD>
                        <TD><%=RsP.Fields("sector_publico")%></TD>
                     </TR>
                      <% 
		registro = registro + 1
		RsP.MoveNext
		
		Loop	
		RsP.close 
		Set RsP = Nothing
		%>
                </table>
            
            
            </td>
        </tr>
      </TABLE>
      </div>
	  <br>

        
<% else %>
     <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
                </table>

       <% end If %>

     
