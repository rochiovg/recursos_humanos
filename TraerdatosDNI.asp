<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%
Anio=Session("anio")
usuario= Session("usuario")

id_proyecto=session("id_proyecto")

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 


lsvalor=Request.Form("lsvalor")
IF(lsvalor="1") THEN

txtDNI=Request.Form("txtDNI")
lsperiodo=Request.Form("lsperiodo")

 Response.ContentType="text/html; charset=iso-8859-1"
 
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	set Rs2 = Server.Createobject("ADODB.Recordset")
	
	sql2= " Exec dbo.uspGet_Planilla_TraerApellNom '"&txtDNI&"', '"&id_proyecto&"';"

	
	Rs2.cursorlocation=3
	Rs2.Open sql2, MiCone,3,3
		
	if Rs2.RecordCount>0 then
	NomCompleto=Rs2("NomCompleto")
	Desc_ActivoC=Rs2("Desc_ActivoC")
	ActivoC=Rs2("ActivoC")
	FlagPagoCom=Rs2("FlagPagoCom")

    
	count=1
	else
	NomCompleto=""
	Desc_ActivoC=""
	ActivoC=""
	FlagPagoCom=""
	count=0
	end if

    if count=1 then
	
	response.Write NomCompleto&","&Desc_ActivoC&","&ActivoC&","&FlagPagoCom
	else

	end if

    Set Rs2= Nothing
	

END IF
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF (lsvalor="2") THEN

  lsperiodo=Request.Form("lsperiodo")

  Response.ContentType="text/html; charset=iso-8859-1"

   set Rs3 = Server.Createobject("ADODB.Recordset")
	
	sql3= " Exec dbo.uspGet_PlanillaListEstPer '"&lsperiodo&"', '"&id_proyecto&"';"

	
	Rs3.cursorlocation=3
	Rs3.Open sql3, MiCone,3,3
	
	
	if Rs3.RecordCount>0 then
	descorta=Rs3("descorta")    
	cuentaper=1
	
	else
	descorta=""

	cuentaper=0
	end if
	
	
	 if cuentaper=1 then
	
	response.Write descorta

	else
	
	response.Write ""

	end if
   

END IF

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF(lsvalor="3") THEN

Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.spu_ListarPerPlanillaTipo '6', '"&id_proyecto&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmboPerPlanilla"" name=""cmboPerPlanilla"" onChange=""TraerDescEstado();"" >"
	Response.Write "<OPTION value=""0"">seleccione....</OPTION>"
	
	While not wRsDptoapli.EOF		
		Response.Write "<option title="""&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  Estado:"&wRsDptoapli(4)&"" & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  ("&wRsDptoapli(4)&") " & "</option>"		
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
	
		
Set wRsDptoapli1 = Server.CreateObject("ADODB.Recordset")
	sql1 = "exec dbo.pa_fuentefto_listar"
	wRsDptoapli1.CursorLocation=3
	wRsDptoapli1.Open sql1, Micone,3,3

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmboFuente"" name=""cmboFuente""  >"
	Response.Write "<OPTION value=""0"">seleccione....</OPTION>"
	
	While not wRsDptoapli1.EOF		
		Response.Write "<option title ="""&wRsDptoapli1(1) & """ value=""" & wRsDptoapli1(0) & """>"&wRsDptoapli1(2) & "</option>"
		wRsDptoapli1.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"
	wRsDptoapli1.Close
	Set wRsDptoapli1 = Nothing	
	

END IF

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF (lsvalor="4") THEN

  lsperiodo=Request.Form("lsperiodo")
  txtDNI=Request.Form("txtDNI")

  Response.ContentType="text/html; charset=iso-8859-1"

   set Rs4 = Server.Createobject("ADODB.Recordset")
	
	sql4= " Exec dbo.uspGet_PlanillaValidarDNIExiste '"&txtDNI&"', '"&id_proyecto&"';"

	
	Rs4.cursorlocation=3
	Rs4.Open sql4, MiCone,3,3
	
	'Set  Rs4=Nothing
	
	if Rs4.RecordCount>0 then 
	existedni=1
	
	else
	existedni=0
	end if
	
	
      IF (existedni=1) THEN
   
           set Rs5 = Server.Createobject("ADODB.Recordset")
	
	       sql5= " Exec dbo.uspGet_PlanillaValDNIContrato '"&txtDNI&"', '"&id_proyecto&"';"
		   
	
	       Rs5.cursorlocation=3
	       Rs5.Open sql5, MiCone,3,3
	       
		   'Set  Rs5=Nothing
	
	       if Rs5.RecordCount>0 then   
	       'Response.write "1"
	
	       else
           Response.write "2"
	       end if
      ELSE   
      Response.write "3"
	  END IF
	
	
 
END IF

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

IF (lsvalor="5") THEN

  lsperiodo=Request.Form("lsperiodo")

  Response.ContentType="text/html; charset=iso-8859-1"

   set Rs5 = Server.Createobject("ADODB.Recordset")
	
	sql5= " Exec dbo.spu_ListarPerPlanillaTipo '6', '"&id_proyecto&"';"

	
	Rs5.cursorlocation=3
	Rs5.Open sql5, MiCone,3,3
	
	
	if Rs5.RecordCount>0 then
		response.Write(Rs5("maxPeriodo")&"*"&Rs5("NumAbierto"))
	else
		response.Write "0*0"
	end if
   

END IF




	
set Micone=nothing

%>




