<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsPaterno=request.Form("lsPaterno")
lsMaterno=request.Form("lsMaterno")
lsNombre = Request.Form("lsNombre")
lsDNI=Request.Form("lsDNI")
lsOpcion=Request.Form("lsOpcion")
lsUsuario=Request.Form("lsUsuario")

id_Proyecto=Session("id_proyecto")


SQL1 = "exec dbo.pa_participante_ubigeo_mostrar '"& lsPaterno &"', '"& lsMaterno &"', '"& lsNombre &"' , '"& lsDNI &"', '"& lsOpcion &"', '"&id_Proyecto&"' " 

Set RSCuad  = Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
    
<%If Not RSCuad.BOF And Not RSCuad.EOF Then

    dni = RSCuad.Fields("dni")
    ape_paterno  = RSCuad.Fields("ape_paterno")
    ape_materno = RSCuad.Fields("ape_materno")  
    nombre = RSCuad.Fields("nombre") 
    cargo  = RSCuad.Fields("cargo")
    desc_proyecto  = RSCuad.Fields("desc_proyecto")
    id_proyecto  = RSCuad.Fields("id_proyecto")
    ccdd_i = RSCuad.Fields("ccdd_i")
    ccpp_i = RSCuad.Fields("ccpp_i")
    ccdi_i = RSCuad.Fields("ccdi_i")
    zona_i = RSCuad.Fields("zona_i")
    seccion_i = RSCuad.Fields("seccion_i")
    dpto = RSCuad.Fields("dpto")
    prov = RSCuad.Fields("prov")
    dist = RSCuad.Fields("dist")
    id = RSCuad.Fields("id_convocatoriacargo")

end if




if dni<>"" then
%>
    <form id="FORM1" name="FORM1" >
    <table width='72%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
        <tr  bordercolor="#DAE8F3">
            <th width="18%" bgcolor="#DAE8F3" class="dato" >DNI</th>
            <th width="18%" bgcolor="#DAE8F3" class="dato" >Apellido Paterno</th>
            <th width="27%" bgcolor="#DAE8F3" class="dato" >Apellido Materno</th>
            <th width="24%" bgcolor="#DAE8F3" class="dato" >Nombre</th>       
            <th width="21%" bgcolor="#DAE8F3" class="dato">Cargo</th>
        </tr>
        <tr>
            <td widtd="18%" class="dato" ><%=dni%> </td>
             <input name="txtDNI22" id="txtDNI22" type="hidden" value=<%=dni%>>
             
            <td widtd="18%" class="dato" ><%=ape_paterno%></td>
            <td widtd="27%" class="dato" ><%=ape_materno%></td>
            <td widtd="24%" class="dato" ><%=nombre%></td>       
            <td widtd="21%" class="dato"><%=cargo%></td>
        </tr>
    </table>
    <br>
    <table width='72%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
        <tr  bordercolor="#DAE8F3">
            <th width="18%" bgcolor="#DAE8F3" class="dato" >Departamento</th>
            <th width="18%" bgcolor="#DAE8F3" class="dato" >Provincia</th>
            <th width="27%" bgcolor="#DAE8F3" class="dato" >Distrito</th>
            <th width="24%" bgcolor="#DAE8F3" class="dato" >Zona</th>       
            <th width="21%" bgcolor="#DAE8F3" class="dato">Secci&oacute;n</th>
            <th width="21%" bgcolor="#DAE8F3" class="dato">Cambiar</th>
        </tr>
        <tr>
            <td widtd="18%" class="dato" ><%=dpto%></td>
            <td widtd="18%" class="dato" ><%=prov%></td>
            <td widtd="27%" class="dato" ><%=dist%></td>
            <td widtd="24%" class="dato" ><%=zona_i%></td>       
            <td widtd="21%" class="dato"><%=seccion_i%></td>
            <td widtd="21%" class="dato" rowspan="2">
                <img src="images/ok.gif" onclick="cambiozona()" width="16" height="16" border="0" />
            </td>
        </tr>
        <tr>
            <td widtd="18%" class="dato" ><%=dpto%>
                <input name="txtDpto" id="txtDpto" type="hidden" value=<%=ccdd_i %>>
            </td>
            <td widtd="18%" class="dato" id="tr_prov" ><%=prov%>
                <input name="txtProv1" id="txtProv1" type="hidden" value=<%=ccdd_i&ccpp_i %>>
            </td>
            <td widtd="27%" class="dato" id="tr_dist" ><%=dist%>
                <input name="txtDist1" id="txtDist1" type="hidden" value=<%=ccdd_i&ccpp_i&ccdi_i %>>
            </td>
            <td widtd="24%" class="dato" id="tr_zona" >
                <select id="txtZona" name="txtZona" class="form-control">
                    <option>Seleccione...</option>
                    <option  selected value="<%=zona_i%>"  ><%=zona_i%></option>
                </select>
            </td>       
            <td widtd="21%" class="dato" id="tr_seccion">
                <select id="txtSeccion" name="txtSeccion" class="form-control">
                    <option value="">Seleccione...</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <div id="mensaje"></div>
            </td>
        </tr>
    </table>
    </form>
</body>
<%else%>
    <table width='95%' align='center'>
        <tr>
            <td class='subtitulo' colspan='4'>La persona no esta registrada en el proyeto o existe error en los datos ingresados</td>
        </tr>
    </table>
<%end if%>
