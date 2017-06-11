<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor=mid(valor,1,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getprov2 '"&valor&"' ")
	
	If Not RS.BOF And Not RS.EOF Then 
		
	if Rs(4)=0 then
		flgT="checked"
		valT=0
		else
		flgT=""
		valT=1
	end if
	
	
	Response.Write "<input type=""checkbox"" onclick=""guardarProv(this.value,this.id,0)"" value="&valT&" "&flgT&" name=""todosP"" id=""todosP""  >TODOS PROVINCIAS<br/>"
	While Not Rs.EOF
	
	if Rs(3)=1 then
	flg="checked"
	val=0
	else
	flg=""
	val=1
	end if
	
	Response.Write "<input type=""checkbox"" onclick="" guardarProv(this.value,this.id,1)"" width=""150"" value="&val&" "&flg&" class=""checkProv""  name="""&Rs(0)&""" id="""&Rs(0)&""" >" &Rs(2)&" <br/>"
	
	Rs.MoveNext
	Wend
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing
else

response.write ""

end if 

%>


