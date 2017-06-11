
<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 

<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Request.Form("lsUsuario")
idProyecto=Session("id_proyecto")


lsIdPresupuesto = Request("lsIdPresupuesto")
lsIdConvocatoriaCargo= Request("lsIdConvocatoriaCargo")
fecha_FIN= Request("fecha_FIN")


	WTitulo		= "PEA a Contratar" 

	SQL1 = "execute usp_VerPEAaContratar '"&lsIdPresupuesto &"','"&lsidConvocatoriaCargo&"' ,'"&idProyecto&"'"
			
	Set RS3 = Server.CreateObject("ADODB.recordset") 
	RS3.cursorlocation=3 
	RS3.Open SQL1, MiCone, 3,3 


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
If lsUbigeo <> "" then


%>
<html>
<head>
<title>PEA a Contratar</title> 
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Styles/inei.css">

<script src="js/valida_fecha.js"></script>
<script language="javascript"> 



function CambioPag()
{		
	document.frmMANTE_Proc.submit(); 
} 



function http_request() {
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}


	
function bloqueo_contrato(id,valor)
{
	
var lsIdPresupuesto=document.getElementById("lsIdPresupuesto").value;
var lsIdConvocatoriaCargo=document.getElementById("lsIdConvocatoriaCargo").value;
if (document.getElementById(''+id+'').checked==false)
val=0
else 
val=valor

ajax=http_request();

var id_per=id.substring(1);

	var valores;	
	valores= "lsidper=" +id_per+"&lsvalor="+escape(val)+"&lsIdPresupuesto="+escape(lsIdPresupuesto)+"&lsIdConvocatoriaCargo="+escape(lsIdConvocatoriaCargo)+"&lsTipo=59";  // parametros a enviar al servidor	
	
url="m_ingreso.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("a"+id_per).innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("a"+id_per).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("a"+id_per).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("a"+id_per).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 	
	}
	
	

function bloqueo_contrato_gen(cb)
{
	
var lsIdPresupuesto=document.getElementById("lsIdPresupuesto").value;
var lsIdConvocatoriaCargo=document.getElementById("lsIdConvocatoriaCargo").value;

var val=document.getElementById("marca").value;

if ( val=="9" ) { return; }


/*if (cb.checked==false)
val=0
else 
val=4*/

ajax=http_request();

var id_per="T";

	var valores;	
	valores= "lsidper=" +id_per+"&lsvalor="+escape(val)+"&lsIdPresupuesto="+escape(lsIdPresupuesto)+"&lsIdConvocatoriaCargo="+escape(lsIdConvocatoriaCargo)+"&lsTipo=146";  // parametros a enviar al servidor	
	
url="m_ingreso.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("a"+id_per).innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("a"+id_per).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("a"+id_per).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("a"+id_per).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	CambioPag();
	
   return;	 	
	}

	

function enviarcard(dni)
{		
	 			
 pagina = "contacto.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=600,height=250,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

</script> 



</head> 
<body leftmargin="5" topMargin="1"> 

<form Id="frmMANTE_Proc" name="frmMANTE_Proc" method="post" action="pd_PEAaContratar.asp">
  <input type="hidden" name="lsIdPresupuesto" Id="lsIdPresupuesto" value="<%=lsIdPresupuesto%>">
  <input type="hidden" name="lsIdConvocatoriaCargo" Id="lsIdConvocatoriaCargo" value="<%=lsIdConvocatoriaCargo%>">
  <input type="hidden" name="fecha_FIN" Id="fecha_FIN" value="<%=fecha_FIN%>">
<%
	'actualizamos numero de pagina
	If Request.Form("pag")<>"" Then 
		Pag=Request.Form("pag")
	Else
		Pag=1
	End If

	num_registros = 30 
	'Dimensionamos las paginas y determinamos la pagina actual
	If RS3.RecordCount > 0 Then 
		RS3.PageSize=num_registros
		RS3.AbsolutePage=Pag
	End If 
	
	If RS3.RecordCount > 0 Then 
		cargomostrar=RS3.Fields("cargo")
	else
		cargomostrar=""
	End If 
	
	%>

	<table border="0" width="95%" align="center" cellpadding="0" cellspacing="0"> 
		<tr ><td align="right" Class="e_td_string1" width="100%">
             Página:&nbsp; 
			<select name="pag" onChange="CambioPag()" style="width:40;">
			<%i=0 
			While i<RS3.PageCount 
				i=i+1%>
				<option value="<%=i%>" <%If cint(Pag) = cint(i) Then%>Selected<%End If%>><%=i%></option>
			<%Wend%> 
		    </select>&nbsp;/&nbsp;<b><%=RS3.PageCount%></b>&nbsp;<br>&nbsp;    
			    Total Registros:&nbsp;<b><%=RS3.RecordCount%></b>&nbsp;(<%=RS3.PageSize%>&nbsp;Reg. por Página)
          </td> 
		</tr> 
	</table> 


<table width='95%' align=CENTER border="1" cellpadding="1" cellspacing="2"  bordercolor="#DAE8F3"  >

<tr><td colspan="13" align=CENTER><span class="titulo1" ><strong><%=WTitulo%></strong></span><BR><BR><BR></td></tr>

<tr><td colspan=10>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0"> 
	<tr>
		<td Class="e_td_string1" >
		<strong>Cargo :&nbsp;</strong><%=cargomostrar%>&nbsp;&nbsp;<br>
		
		
		</td> 
	</tr>
	</table> 
	</td>
</tr>

<%'----- Oficios de Contratación ----- %> 

	<tr><td colspan="13"><span class="TxtGrilla" style="font-size:11px">

	</td></tr>
                
	<tr style="font-size:11px">
	<th width="5%"  bgcolor="#DAE8F3" class="dato3">Nº</th>

	<th width="07%" bgcolor="#DAE8F3" class="dato3">DNI</th>
	<th width="20%" bgcolor="#DAE8F3" class="dato3">Apellidos</th>
	<th width="15%" bgcolor="#DAE8F3" class="dato3">Nombres</th>
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Departamento</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Provincia</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Distrito</th> 
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >Fecha Fin <br>&Uacute;ltimo Contrato</th> 
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >Proyecto</th> 
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >Afecto</th> 
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >Registro<br>Afiliaci&oacute;n</th> 
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >Pase a Contrato<br>
    (Colocar check para no ser contratado)
  <!--  <input name="marca" type="checkbox" id="marca" onClick="bloqueo_contrato_gen(this)" />-->
    
    	<select name="marca"  id="marca"  onChange="bloqueo_contrato_gen(this)" style="width:80;">
			
				<option value="9" >...</option>
                <option value="4" >Seleccionar</option>
                <option value="0" >Deseleccionar</option>
			
		    </select>
            
            
            
    </th> 
	</tr> 

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='CabeGrilla' style=" font-size:10px">
			<%
			
			registro = (cint(Pag) * num_registros) -  num_registros
			

			registros_mostrados = 0 
			Do While  (Not RS3.eof And registros_mostrados < num_registros)
		   registros_mostrados = registros_mostrados +1
			
			
            registro = registro + 1 	
            %>

	<tr style=" font-size:11px" > 
	<td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td> 
 <% d1=""
 	m1=""
	a1="" 
	
	d2=""
 	m2=""
	a2=""
	
 flag = "false"
 aa=""
 
 if RS3.Fields("id_tipopension")="" then
		mensaje="NO TIENE REGISTRO"
	else
		mensaje="SI TIENE REGISTRO"
	end if
	
	
 
 if fecha_FIN<>""  then
		if RS3.Fields("fecha_fin")<>"" and fecha_FIN<>"" then 
 
			d1=Mid(fecha_FIN,1,2)
			m1=Mid(fecha_FIN,4,2)
			a1=Mid(fecha_FIN,7)

			d2=Mid(RS3.Fields("fecha_fin"),1,2)
			m2=Mid(RS3.Fields("fecha_fin"),4,2)
			a2=Mid(RS3.Fields("fecha_fin"),7)

			if a1<a2 then 
				flag="true"  
				val=1  
			end if
			if (a1=a2 and m1 < m2) then 
				flag="true" 
				val=2 
			end if 
			if (a1=a2 and  m1= m2 and d1 <= d2) then 
				flag="true" 
				val=3 
			end if	
			
			if flag="true" then 
			 	aa= "bgcolor=""#FF0000"""
			else
				aa=""
			end if
		end if
	end if
	
if RS3.Fields("pase")="1" then
	aa= "bgcolor=""#FF8000"""
end if

if mensaje="NO" then
	aa= "bgcolor=""#FFFF00"""
end if
	
	

	%>
    
	<td class='e_td_string1' <%=aa%>><a href="#" class="titulo3" onClick="javascript:enviarcard('<%=RS3.Fields("DNI")%>')"><%=RS3.Fields("DNI")%></a></td> 
	<td class='e_td_string1' <%=aa%>><%=trim(RS3.Fields("apellidos"))%></td> 
	<td class='e_td_string1' <%=aa%>><%=trim(RS3.Fields("nombres"))%></td> 
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("departamento")%></td>
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("provincia")%></td>
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("distrito")%></td>
    <td class='e_td_string1' <%=aa%>><%=RS3.Fields("fecha_fin")%>  </td>
    <td class='e_td_string1' <%=aa%>><%=RS3.Fields("metas_2013")%></td>
    <td class='e_td_string1' <%=aa%>><%=mensaje%></td>
    <td class='e_td_string1' <%=aa%>><%=mensaje%></td>
   <td align="center" class='e_td_string1'>&nbsp;<input name="<%="S"&RS3.Fields("id_per")%>" type="checkbox" id="<%="S"&RS3.Fields("id_per")%>" value="4" <% if RS3.Fields("activo") ="4" then response.Write("checked=""checked""") end if %> onClick="bloqueo_contrato(this.id,this.value)" /><div style="display:none" id="<%="a"&RS3.Fields("id_per")%>"></div> </td>
  </tr>
            <%
			
			RS3.MoveNext
            Loop	
            RS3.close 
            Set RS3 = Nothing 
            %>

	</table>
	<% else %>
    <table width='95%' align='center'>
         <tr><td class='subtitulo' colspan='4'><br><br>No Existe Información Registrada</td></tr>
    </table>
	<% end If%>

 
<%Micone.Close%> 
	<table border="0" width="95%" align="center">
		<tr style="font-size:11px"><td height="27"  Class="e_td_string1" BgColor="White"  align=right colspan="10" ><strong>Fecha&nbsp;:</strong>&nbsp;&nbsp;<%=day(date())&"/"&month(date())&"/"&year(date())%>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>Hora&nbsp;:</strong>&nbsp;&nbsp;<%=time()%>
		</td></tr>
	</table> 
	<br>

</form>
</body>
</html>

<%Else
Response.Redirect("default.asp") 
End If%>



