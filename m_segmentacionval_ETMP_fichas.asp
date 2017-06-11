<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

id_Proyecto=Session("id_proyecto")

SQL1 = "exec dbo.pa_ETMP_fichas_listar '"&id_Proyecto&"' "	


	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		
		
set RSCuad1	= Server.CreateObject("ADODB.Recordset") 
RSCuad1.cursorlocation=3


		
		If Not RSCuad.BOF And Not RSCuad.EOF Then

%>


    
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
<tr>
<td colspan="50"></td>
</tr>






    <tr style="font-size:11px; color:#333; font-weight:bold ">
    <td bgcolor="#DAE8F3"  width="125">ID_PROYECTO</td>
     <td bgcolor="#E9DBD1" width="115">ape_paterno</td>
        <td bgcolor="#E9DBD1" width="115">ape_materno</td>
            <td bgcolor="#E9DBD1" width="115">nombre</td>
                <td bgcolor="#E9DBD1" width="115">dni</td>
                                <td bgcolor="#E9DBD1" width="115">RUC</td>
                    <td bgcolor="#E9DBD1" width="115">fec_nac</td>
                        <td bgcolor="#E9DBD1" width="115">sexo</td>
                            <td bgcolor="#E9DBD1" width="115">id_estadocivil</td>
                            
                            
                                        <td bgcolor="#E9DBD1" width="115">Tipo Via</td>
 <td bgcolor="#E9DBD1" width="115">id tipo via</td>
                <td bgcolor="#E9DBD1" width="115">DireccionNombreVia</td>
                    <td bgcolor="#E9DBD1" width="115">DireccionPuerta</td>
                        <td bgcolor="#E9DBD1" width="115">Distr. Postula</td>
                            <td bgcolor="#E9DBD1" width="115">Ubigeo Post</td>
                                                        <td bgcolor="#E9DBD1" width="115">Zona</td>
                                                                                    <td bgcolor="#E9DBD1" width="115">Seccion</td>
                            
<!--                                                    <td bgcolor="#E9DBD1" width="115">Pais Nac</td>
                            <td bgcolor="#E9DBD1" width="115">id Pais Nac</td>
                                          <td bgcolor="#E9DBD1" width="115">Dist Nac</td>
                            <td bgcolor="#E9DBD1" width="115">Ubigeo Nac</td> -->
                            <td bgcolor="#E9DBD1" width="115">telefono</td>

                            <td bgcolor="#E9DBD1" width="115">celular</td>
                                          <td bgcolor="#E9DBD1" width="115">Nivel</td>
                            <td bgcolor="#E9DBD1" width="115">id_nivel</td>
                                    <td bgcolor="#E9DBD1" width="115">Grado</td>
                                    
                                  <td bgcolor="#E9DBD1" width="115">Id Grado</td>
                            <td bgcolor="#E9DBD1" width="115">Profesion</td>
                                    <td bgcolor="#E9DBD1" width="115">Id Profesion</td>   
                                    
                                    

    <td bgcolor="#E9DBD1" width="115">bandaprob</td>
    <td bgcolor="#E9DBD1" width="65">preseleccionado</td>
    <td bgcolor="#E9DBD1" width="108">capacita</td>
    <td bgcolor="#CCFFFF" width="132">sw_titu</td>
    <td bgcolor="#CBFED7" width="77">seleccionado</td>
        <td bgcolor="#CBFED7" width="77">fec. upload</td>
            <td bgcolor="#CBFED7" width="77">OK</td>
                        <td bgcolor="#CBFED7" width="77">COMENTARIO</td>
                                


    
  </tr>
  <%Do While Not RSCuad.EOF
			response.Flush()
 %>
  
  <tr>
  
  
  
  
    <td><%=RSCuad.Fields("ID_PROYECTO")%></td>
        <td><%=RSCuad.Fields("APE_PAT_PER")%></td>
    <td><%=RSCuad.Fields("APE_MAT_PER")%></td>
            <td><%=RSCuad.Fields("NOM_EMP_PER")%></td>
                <td><%=RSCuad.Fields("LIBR_ELEC_PER")%></td>
                <td><%=RSCuad.Fields("OTRO_DOCU_PER")%></td>
                    <td><%=RSCuad.Fields("FEC_NAC_PER")%></td>
                        <td><%=RSCuad.Fields("SEXO_EMP")%></td>
                            <td><%=RSCuad.Fields("EST CIVIL")%></td>
                            
                            
                                        <td><%=RSCuad.Fields("TIPO_VIA")%></td>
                                                                                <td><%=RSCuad.Fields("ID_TVIA")%></td>
                                        
                <td><%=RSCuad.Fields("NOMB_VIA_PER")%></td>
                    <td><%=RSCuad.Fields("NUME_DIRE_PER")%></td>
                        <td><%=RSCuad.Fields("DIST_POSTULA")%></td>
                            <td><%=RSCuad.Fields("UBI_POST")%></td>
                            
                                                        <td><%=RSCuad.Fields("ZONA")%></td>
                                                                                    <td><%=RSCuad.Fields("SECCION")%></td>
                                                                                    
                            
<!--                                                      <td><%=RSCuad.Fields("PAIS_NAC")%></td>
                            <td><%=RSCuad.Fields("ID_PAIS_NAC")%></td>
                                          <td><%=RSCuad.Fields("DIST_NAC")%></td>
                            <td><%=RSCuad.Fields("UBI_NAC")%></td>                            -->
                            
                            <td><%=RSCuad.Fields("NUM_TEL_PER")%></td>

                            <td><%=RSCuad.Fields("NUM_CEL_PER")%></td>
                                          <td><%=RSCuad.Fields("NIVEL")%></td>
                            <td><%=RSCuad.Fields("ID_NIVEL")%></td>
                                    <td><%=RSCuad.Fields("GRADO")%></td>
                                    
                                    
                                    
                                          <td><%=RSCuad.Fields("ID_GRADO")%></td>
                            <td><%=RSCuad.Fields("PROFESION")%></td>
                                    <td><%=RSCuad.Fields("ID_PROFESION")%></td>





    <td><%=RSCuad.Fields("bandaprob")%></td>
    <td><%=RSCuad.Fields("preseleccionado")%></td>
    <td><%=RSCuad.Fields("capacita")%></td>
    <td><%=RSCuad.Fields("sw_titu")%></td>
    <td><%=RSCuad.Fields("seleccionado")%></td>
    <td><%=RSCuad.Fields("fec_reg")%></td>

           <td><%=RSCuad.Fields("OK")%></td>
    <td><%=RSCuad.Fields("COMENTARIO")%></td>
         



  
  	

  </tr>
  <%
			registro = registro + 1
			RSCuad.MoveNext

			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
			
			
				 
			
			
 %>
</table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
          <%end if%>


