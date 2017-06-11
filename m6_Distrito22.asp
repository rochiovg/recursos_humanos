<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getdist_conv '"&valor1&"' ,'"&valor2&"' ")
	
	If Not RS.BOF And Not RS.EOF Then 
	 
			if Rs(5)=0 then
				flgT="checked"
				valT=0
			else
				flgT=""
				valT=1
			end if
			Response.Write "<input type=""checkbox"" value="&valT&" "&flgT&"  onclick=""guardarDist(this.value,this.id,0)"" name=""todosDI"" id=""todosDI""  > TOTAL  DISTRITOS <br/>"
			While Not Rs.EOF
			
			if Rs(4)=1 then
			flg="checked"
			val=0
			else
			flg=""
			val=1
			end if	
			response.Write "<input type=""checkbox"" class=""checkDist"" onclick="" guardarDist(this.value,this.id,1)"" value="&val&" "&flg&" name="""&Rs(0)&""" id="""&Rs(0)&""">" &Rs(3)&" <br/>"
			Rs.MoveNext
			Wend
			
		Rs.Close
		Set Rs = Nothing
		Micone.Close
		Set Micone = Nothing
		
else 
		
		response.Write " "
end if
	
%>