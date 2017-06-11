<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 

<%

id_proyecto=Session("id_proyecto")
lsRol = Session("txtTipoUsuarioValido")
usuario = Session("id_usuario")

varccdd= Request("lsDPTO")
varccpp = Request("lsPROV")
varccdi = Request("lsDIST")
cargo = Request("lscargo") 
nivel = Request("lsnivel")
tipo = Request("tipo")


varccpp = Mid(varccpp,4,2)
varccdi = Mid(varccdi,6,2)

response.Redirect("http://aplicaciones.inei.gob.pe/sys.sgpc/web/ece_gastos/reporteGastos_pdf_01?dpto="&varccdd&"=&prov" &varccpp&"&dist="&varccdi&"&cargo="&cargo&"&id_proyecto="&id_proyecto&"&nivel="&nivel="&tipo="&tipo&"&id_cuenta="&usuario&"" )

	 

%>