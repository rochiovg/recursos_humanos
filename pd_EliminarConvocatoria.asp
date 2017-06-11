<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

'Usuario= Session("usuario")

response.ContentType="text/html; charset=iso-8859-1"

num_Convocatoria= Request("num_Convocatoria")
Id_ConvocatoriaCargo= Request("Id_ConvocatoriaCargo")
lsTipoReg = Request.Form("lsTipoReg")

txtDesConvocat= Request("txtDesConvocat")
txtfeIniConv= Request("txtfeIniConv")
txtfeFinConv= Request("txtfeFinConv")


IF lsTipoReg="1" THEN
   
set Rs2 = Server.Createobject("ADODB.Recordset")
	
sql= " Exec dbo.spu_EliminarConvoc '"&num_Convocatoria&"'; "

	
Rs2.cursorlocation=3
Rs2.Open sql, MiCone,3,3

Set RS2=Nothing

Response.write "2"

END IF


IF lsTipoReg="2" THEN
   
set Rs3 = Server.Createobject("ADODB.Recordset")
	
sql3= " Exec dbo.spu_EliminarConvoCargo '"&Id_ConvocatoriaCargo&"'; "
	
Rs3.cursorlocation=3
Rs3.Open sql3, MiCone,3,3
	
Set RS3=Nothing

END IF


IF lsTipoReg="3" THEN
   
set Rs5 = Server.Createobject("ADODB.Recordset")
	

sql5= " Exec dbo.spu_ActualizarConvocatoria '"&num_Convocatoria&"','"&txtDesConvocat&"','"&txtfeIniConv&"','"&txtfeFinConv&"';"

	
Rs5.cursorlocation=3
Rs5.Open sql5, MiCone,3,3
	
Set RS5=Nothing

Response.write "1"

END IF


	
set Micone=nothing

%>
