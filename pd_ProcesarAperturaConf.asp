<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  -->

<%


Server.ScriptTimeout = 230400  

Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0'
Response.Buffer = True 
Response.Flush 

id_proyecto=session("id_proyecto")
lsval = request("lsval")

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



IF (lsval=1 ) THEN

fin = request("fin")

lsperiodo = request("lsperiodo")
txtDesPeriodo = Request.Form("txtDesPeriodo")
lsnivel = Request.Form("lsnivel")
txtusuario=Request.Form("txtusuario")
txtipusuario=Request.Form("txtipusuario")
lsfuente = Request("lsfuente")



set Rs1 = Server.Createobject("ADODB.Recordset")
	
sql1 = " Exec dbo.uspGet_PlanillaListEstPer '" & lsperiodo & "', '"&id_proyecto&"';"	




Rs1.cursorlocation=3
Rs1.Open sql1, MiCone,3,3

    if Rs1.RecordCount>0 then
    estadoPla=Rs1("estadoPla")
		
	else
    estadoPla =""	
	
    end if	
	
Set RS1=Nothing


 
 
IF (estadoPla=1 OR estadoPla=2)THEN


     Set wRsSup = Server.CreateObject("ADODB.Recordset")
     sql=" exec dbo.uspGet_Planilla_ValidarDupProceso '"&lsperiodo&"','"&lsnivel&"','', '"&id_proyecto&"';"

	 wRsSup.CursorLocation=3
	 wRsSup.Open sql, Micone,3,3
	 
	if wRsSup.RecordCount>0 then
	contador = 1
	else
    contador = 0	 
    end if
	
	Set wRsSup=Nothing
	
''''''''''''''''''''''''''
     IF (contador = 0) THEN
 
	 Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
	
  SQL1 = "EXEC dbo.uspGet_Planilla_GeneraPlanilla '"&lsperiodo&"','" & txtDesPeriodo & "', '" & lsnivel & "', '" & txtusuario & "', '" & txtipusuario& "','', '"& id_proyecto& "','"&lsfuente&  "';" 
  
		response.write(SQL1)
		

  		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		

        Set RSCuad=Nothing

        Response.write "1"
     ELSE 

    Response.write "2"

    END IF

  ELSE
  Response.write "3"
  END IF

END IF 

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF (lsval=2) THEN
  
lsperiodo = request("lsperiodo")
txtDesPeriodo = Request.Form("txtDesPeriodo")
lsnivel = Request.Form("lsnivel")
txtusuario=Request.Form("txtusuario")
txtipusuario=Request.Form("txtipusuario")
txtDNI=Request.Form("txtDNI")
lsfuente = Request("lsfuente")



set Rs1 = Server.Createobject("ADODB.Recordset")
	
sql1 = " Exec dbo.uspGet_PlanillaListEstPer '" & lsperiodo & "', '"&id_proyecto&"';"

		
Rs1.cursorlocation=3
Rs1.Open sql1, MiCone,3,3

    if Rs1.RecordCount>0 then
    estadoPla=Rs1("estadoPla")
		
	else
    estadoPla =""	
	
    end if	
	
Set RS1=Nothing

IF (estadoPla=1 OR estadoPla=2)THEN
	 
	 Set wRsSup = Server.CreateObject("ADODB.Recordset")
     sql=" exec dbo.uspGet_Planilla_ValidarDupProceso '"&lsperiodo&"','','"&txtDNI&"', '"&id_proyecto&"';"	
	 
	 
	 wRsSup.CursorLocation=3
	 wRsSup.Open sql, Micone,3,3
	 
	if wRsSup.RecordCount>0 then
	contador = 1
	else
    contador = 0	 
    end if
	
	Set wRsSup=Nothing
	 
''''''''''''''''''''''''''

      IF (contador = 0) THEN

	  Set RSCuad	= Server.CreateObject("ADODB.Recordset") 

SQL1 = "EXEC dbo.uspGet_Planilla_GeneraPlanilla '"&lsperiodo&"','" & txtDesPeriodo & "', ' ', '" & txtusuario & "', '" & txtipusuario& "','"&txtDNI&"', '"&id_proyecto& "','"&lsfuente& "';" 
	
	response.write(SQL1)
	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3

        Set RSCuad=Nothing

        Response.write "1"

       ELSE 

       Response.write "2"
 
      END IF
 
 ELSE
  Response.write "3"
 END IF 

END IF 

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF (lsval=3 ) THEN

lsperiodo = request("lsperiodo")



        Set wRsSup3 = Server.CreateObject("ADODB.Recordset")
        sql3=" exec dbo.uspGet_Planilla_Reproceso '"&lsperiodo&"', '"&id_proyecto&"';"	
	
	 
	    wRsSup3.CursorLocation=3
	    wRsSup3.Open sql3, Micone,3,3
	 
	    Set wRsSup3=Nothing
	   Response.write "1"
   
END IF

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

IF (lsval=4 ) THEN

lsperiodo = request("lsperiodo")


       Set wRsSup5 = Server.CreateObject("ADODB.Recordset")
       sql5=" exec dbo.uspGet_Planilla_CambiarEstado '"&lsperiodo&"', '"&id_proyecto&"';"	

	 
	   wRsSup5.CursorLocation=3
	   wRsSup5.Open sql5, Micone,3,3
	 
	    Set wRsSup5=Nothing
	    Response.write "1"


END IF


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

IF (lsval=5 ) THEN

lsperiodo = request("lsperiodo")

set Rs1 = Server.Createobject("ADODB.Recordset")
	
sql1 = " Exec dbo.uspGet_PlanillaListEstPer '" & lsperiodo & "', '"&id_proyecto&"';"	
			
Rs1.cursorlocation=3
Rs1.Open sql1, MiCone,3,3

    if Rs1.RecordCount>0 then
    estadoPla=Rs1("estadoPla")
		
	else
    estadoPla =""	
	
    end if	
	
Set RS1=Nothing

   IF (estadoPla=1)THEN

	    Response.write "1"
	ELSE
	Response.write "2"
	END IF

END IF
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


IF (lsval=6 ) THEN

lsperiodo = request("lsperiodo")

set Rs1 = Server.Createobject("ADODB.Recordset")
	
sql1 = " Exec dbo.uspGet_PlanillaListEstPer '" & lsperiodo & "', '"&id_proyecto&"';"	
			
Rs1.cursorlocation=3
Rs1.Open sql1, MiCone,3,3

    if Rs1.RecordCount>0 then
    estadoPla=Rs1("estadoPla")
		
	else
    estadoPla =""	
	
    end if	
	
Set RS1=Nothing

   IF (estadoPla=1 OR estadoPla=2)THEN


     Set wRsSup = Server.CreateObject("ADODB.Recordset")
     sql=" exec dbo.uspGet_Planilla_ValidarDupProceso '"&lsperiodo&"',' ','', '"&id_proyecto&"';"			
	 
	 wRsSup.CursorLocation=3
	 wRsSup.Open sql, Micone,3,3
	 
	if wRsSup.RecordCount>0 then
	contador = 1
	else
    contador = 0	 
    end if
	
	Set wRsSup=Nothing


    IF (contador = 1) THEN

	   Response.write "1"
    ELSE 

       Response.write "2"


     END IF
	 
  ELSE
  Response.write "3"
  END IF

END IF

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


IF (lsval=7 ) THEN

periodoPla = request("periodoPla")
id_Presupuesto = request("id_Presupuesto")
ID_PER = request("ID_PER")
id_Contratos = request("id_Contratos")
lsperiodo = request("lsperiodo")

set Rs1 = Server.Createobject("ADODB.Recordset")
	
sql1 = " Exec dbo.uspGet_PlanillaListEstPer '" & lsperiodo & "', '"&id_proyecto&"';"	
			
Rs1.cursorlocation=3
Rs1.Open sql1, MiCone,3,3

    if Rs1.RecordCount>0 then
    estadoPla=Rs1("estadoPla")
		
	else
    estadoPla =""	
	
    end if	
	
Set RS1=Nothing

   IF (estadoPla=1 OR estadoPla=2)THEN



       Set wRsSup5 = Server.CreateObject("ADODB.Recordset")
       sql5=" exec dbo.uspGet_Planilla_EliminarReg '"&periodoPla&"','"&id_Presupuesto&"','"&ID_PER&"','"&id_Contratos&"', '"&id_proyecto&"';"	

		'response.write(sql5)
		'response.end()
		

	 
	   wRsSup5.CursorLocation=3
	   wRsSup5.Open sql5, Micone,3,3
	 
	    Set wRsSup5=Nothing
	    Response.write "1"
	ELSE 
	Response.write "2"
	END IF 


END IF


IF (lsval=8) THEN

lsperiodo = request("lsperiodo")
txtusuario = request("txtusuario")
txtipusuario = request("txtipusuario")

id_proyecto=session("id_proyecto")

set Rs10 = Server.Createobject("ADODB.Recordset")
	
sql10 = " Exec dbo.pa_planilla_descuento '" & lsperiodo & "','" & txtusuario & "','" & txtipusuario & "', '"&id_proyecto&"';"	

	Rs10.cursorlocation=3
	Rs10.Open sql10, MiCone,3,3

	response.Write "1"
set Rs10=Nothing

END IF

set Micone=nothing
			





%>
