 <%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 


<%

Response.ContentType="text/html; charset=iso-8859-1"

dni=request("dni")
lsSQL2 = "EXEC dbo.pa_ficha_confirmarInscripcion  '"&dni&"'" 

Response.ContentType="text/html; charset=iso-8859-1"

Call getRS(RS2, lsSQL2)

If Not RS2.BOF And Not RS2.EOF Then

PERSONA=Rs2.Fields("PERSONA")
DNI=Rs2.Fields("DNI")
LOCAL=Rs2.Fields("local")
id_proyecto=Rs2.Fields("id_proyecto")
DIRECCION=Rs2.Fields("direccion")&" <br/> "&Rs2.Fields("referencia")
HORA="Hasta el "&Rs2.Fields("FECHAFIN")&" "&Rs2.Fields("HORA")
ID_CC=Rs2.Fields("id_convocatoriacargo")
mensaje_confirmacion=Rs2.Fields("mensaje_confirmacion")
Adjuntar_cv=Rs2.Fields("Adjuntar_cv")
else 
PERSONA=""
DNI=""
LOCAL=""
DIRECCION=""
HORA=""
ID_CC=""
mensaje_confirmacion=""
Adjuntar_cv=""
end if




Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")
		
if objFSO.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&DNI&"_1.pdf" ) then 
	aa=1		
else 
	aa=0 
end if     

if Adjuntar_cv=1  then
	aa=1 
end if
	   
if aa=0 then
mensaje_archivo3="Tercer Archivo: Documentaci&oacute;n que acredita experiencia<br>"
else 
mensaje_archivo3="" 
end if


Dim objFSO2
Set objFSO2 = CreateObject("Scripting.FileSystemObject")
		
if objFSO2.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&DNI&"_2.pdf" ) then 
    bb=1
else 
	bb=0
 end if   
	   
if Adjuntar_cv=1 then 
	bb=1 
end if  
 
if bb=0  then
mensaje_archivo1="Primer archivo: DNI del postulante<br>"
else
mensaje_archivo1=""
end if
	   
	   
Dim objFSO3
Set objFSO3 = CreateObject("Scripting.FileSystemObject")
		
if objFSO.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&DNI&"_3.pdf" ) then 
	cc=1
else 
	cc=0
     
end if  

if Adjuntar_cv=1 then 
	cc=1 
end if  

if cc=0  then
mensaje_archivo2="Segundo archivo: Formaci&oacute;n acad&eacute;mica<br>"
else
mensaje_archivo2=""
end if

if aa=0 or bb=0 or cc=0 then
 mensaje_total="CUIDADO:<BR>Los siguientes Archivos no se cargaron correctamente, <br>-"&mensaje_archivo1&" -"&mensaje_archivo2&" -"&mensaje_archivo3&"<br>Ingrese a Consulta de Inscipci&oacute;n para que <br> realice la carga nuevamente."
end if

if aa=1 and bb=1 and cc=1 then

	C1 = "EXEC dbo.pd_ficha_guardocv '" & DNI & "', '" & id_proyecto & "'" 
	 	
	Set RsP	= Server.CreateObject("ADODB.Recordset") 
	RsP.cursorlocation=3
	RsP.Open C1, MiCone, 3,3
	

end if


%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=es-iso-8859-1" />
   <title>..:: SISTEMA DE CONSECUCION DE RRHH ::..</title>
   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <script type="text/javascript" src="js/cliente.js"></script>   
</head>
<body>
<div id="cabecera"> 	

<!--#include file="cabecera.html"-->
<table align="center"><tr><td>
<div  color=MediumBlue class="tituloPrin" style="margin-top:30px; margin-bottom:20px" align="center"><u>Estado de Inscripci&oacute;n</u></div>
		
			<div style="width:650px; height:293px;background-image:url(images/reporte.png);" align="center">

 <div style=" color: #06C; text-align:left; margin-top:80px; margin-bottom:11px; padding-left:110px; padding-right:90px;font-family: Arial; font-size:12px"><%if id_proyecto=2 then%> La Postulante :<%else%>El/la Postulante :<%end if%>  <%=PERSONA%><BR>
           con DNI: <%=DNI%><BR> 
        <% 	
		if id_proyecto=45 or id_proyecto=47 then
	 lsMensajeE="Ha registrado su ficha correctamente<br><br>Por favor, imprima la FICHA ELECTRONICA dando click <a href=declaracion.asp?id="&ID_CC&"&p="&id_proyecto&"&dni="&dni&"  target=_self>AQUI</a><br><br><span class=""mensaje7"">"&mensaje_total&" </span><br><br>"&mensaje_confirmacion&"</strong>"	
		else 
		
			'if id_proyecto=155 then
			 lsMensajeE="Ha registrado su ficha correctamente<br><br>Por favor, imprima la FICHA ELECTRONICA dando click <a href=declaracion.asp?id="&ID_CC&"&p="&id_proyecto&"&dni="&dni&"  target=_self>AQUI</a><br><br><span class=""mensaje7"">"&mensaje_total&" </span><br><br>"&mensaje_confirmacion&"</strong>"
			 'else 
' lsMensajeE="Ha registrado su ficha correctamente<br><br>Por favor, imprima la FICHA ELECTRONICA dando click <a href=declaracionece.asp?id="&ID_CC&"&p="&id_proyecto&"&dni="&dni&"  target=_self>AQUI</a><br><br><span class=""mensaje7"">"&mensaje_total&" </span><br><br>"&mensaje_confirmacion&"</strong>"
 'end if
 
  end if
  lsmns="&#8220; Debe verificar si su inscripci&oacute;n se ha realizado correctamente. No olvide que los resultados se publicar&aacute;n de acuerdo al cronograma por este mismo medio&#8221;."

           %>
           <div align="left" style="width:80%; height:40%"><p><span class=""><strong><%=lsMensajeE%></strong></span></p></div>
       
            </div> 

</div>
            <span class="alerta3">
            <strong><%=lsmns%> </strong></span>
            <div id="divDerechoAutor"></div>
 
 </td></tr><table>
</body>
</html>

