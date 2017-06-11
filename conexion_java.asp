<%
Dim Micone ,cnn ,sConnString,cad
'Set Micone = Server.CreateObject("ADODB.Connection") 
Set cnn = Server.CreateObject("ADODB.Connection")



'--------------------DESARROLLO
cnn.Open    "Provider=SQLOLEDB.1;Password=jzuniga16*;Persist Security Info=True; User ID=jzuniga;Initial Catalog=HOGARURAL_BDSIGEPROC;Data Source=172.18.1.75"
cad = "Provider=SQLOLEDB.1;Password=jzuniga16*;Persist Security Info=True; User ID=jzuniga;Initial Catalog=HOGARURAL_BDSIGEPROC;Data Source=172.18.1.75"
 

Set Micone = Server.CreateObject("ADODB.Connection")
Micone.ConnectionString = cad
Micone.CommandTimeout=20000000
Micone.ConnectionTimeout=20000000
Micone.open


%> 
