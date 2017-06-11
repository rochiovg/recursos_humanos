<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")

		
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD2 ")
	
	
	if wRsDptoapli(3)=0 then
	flgT="checked"
	valT=0
	else
	flgT=""
	valT=1
	end if
	
	
	Response.Write "<input type=""checkbox"" value="&valT&" "&flgT&" onclick="" guardarDep(this.value,this.id,0)""  name=""todosD"" id=""todosD""  >TODOS DEPARTAMENTOS <br/>"
	
	While not wRsDptoapli.EOF
	if wRsDptoapli(2)=1 then
	flg="checked"
	val=0
	else
	flg=""
	val=1
	end if
	
		Response.Write "<input type=""checkbox"" class=""checkDep"" onclick="" guardarDep(this.value,this.id,1)"" value="&val&" "&flg&" name=""" & wRsDptoapli(0) & """ id=""" & wRsDptoapli(0) & """ >" &wRsDptoapli(1) & "<br/>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	

%>