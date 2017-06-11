<%@ Language=VBScript %>

<%
Response.Addheader "Content-Disposition", "attachment; filename=Reporte.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
    

			datos = Request.Form("datos_a_enviar")
			response.Flush()
			response.Write(datos)
			
			%>
			
            