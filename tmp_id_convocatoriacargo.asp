<%@ Language=VBScript %>

<% 


valor = Request.Form("datos")

Session ( "tmp_id_convocatoriacargo") = valor
	

response.write("ok")
%>