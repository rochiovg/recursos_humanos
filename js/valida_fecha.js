function Compara_igual(vfecini,vfecfin)
{
  if ( (vfecini!='') || (vfecfin!='') )
  {
            var Anio = (vfecini).substr(6,4)
            var Mes = ((vfecini).substr(3,2))*1 - 1    
            var Dia = (vfecini).substr(0,2)    
            var Anio1 = (vfecfin).substr(6,4)    
            var Mes1 = ((vfecfin).substr(3,2))*1 - 1    
            var Dia1 = (vfecfin).substr(0,2)    
            var Fecha_Inicio = new Date(Anio,Mes,Dia)    
            var Fecha_Fin = new Date(Anio1,Mes1,Dia1)     
            
            if(+Fecha_Inicio == +Fecha_Fin)    
            {      
             return false;
                
            }    
            
  }
}

function Compara_MenorIgual(vfecini,vfecfin)
{
  if ( (vfecini!='') || (vfecfin!='') )
  {//02/05/2012
            var Anio = (vfecini).substr(6,4)
			
            var Mes = ((vfecini).substr(3,2))*1 - 1
            var Dia = (vfecini).substr(0,2)    
            var Anio1 = (vfecfin).substr(6,4)    
            var Mes1 = ((vfecfin).substr(3,2))*1 - 1
            var Dia1 = (vfecfin).substr(0,2)    
            var Fecha_Inicio = new Date(Anio,Mes,Dia) 
            var Fecha_Fin = new Date(Anio1,Mes1,Dia1)     
          		
            if(+Fecha_Inicio <= +Fecha_Fin)    
            {      
             return false;
                
            }         
  }
}


function Compara_Menor(vfecini,vfecfin)
{
  if ( (vfecini!='') || (vfecfin!='') )
  {//02/05/2012
            var Anio = (vfecini).substr(6,4)
			
            var Mes = ((vfecini).substr(3,2))*1 - 1
            var Dia = (vfecini).substr(0,2)    
            var Anio1 = (vfecfin).substr(6,4)    
            var Mes1 = ((vfecfin).substr(3,2))*1 - 1
            var Dia1 = (vfecfin).substr(0,2)    
            var Fecha_Inicio = new Date(Anio,Mes,Dia) 
            var Fecha_Fin = new Date(Anio1,Mes1,Dia1)     

		  if(Fecha_Inicio < Fecha_Fin)    
            {      
             return false;
                
            }   
    
  }
}

function validar_fecha(valor,id,band)
{
	if (valor!='')
	{	
	

				var ffinC=document.getElementById("txtfinFecha").value;
				

				var ffin=document.getElementById("txtftitu").value;

				var	fIni=document.getElementById("txtititu").value;




			if (band=='1')// fecha de fin de contrato  con la de inicio de contrato	
			 {
				 
					
				  if (  Compara_Menor(valor,fIni) == false  )
						 {
							 
							alert("Fecha err\xf3nea, No puede ser menor a la fecha de Inicio de Labores");
							document.getElementById(id).value=''
							document.getElementById(id).focus();
						 }else 
						 { 
							  	if (Compara_Menor(ffinC,valor)== false )
								 {
									 alert("Fecha err\xf3nea, No puede ser mayor a la de Termino de Contrato");
								     document.getElementById(id).value=''
								     document.getElementById(id).focus();
								 } 
						 }
				}
				
				
				
				 if (band=='2')
					{
						
							if (Compara_igual(ffin,fIni)== false)
								{				 
									
										
								
								if (Compara_Menor(valor,ffin)== false    )
										{
												 alert("Fecha de Inicio debe de ser mayor a la final de contrato");
												 document.getElementById(id).value=''
												 document.getElementById(id).focus();
										}
									
									
							}else
							{
								if (Compara_MenorIgual(valor,ffin)==false )
										{
												 alert("Fecha de Inicio debe de ser mayor a la final de contrato");
												 document.getElementById(id).value=''
												 document.getElementById(id).focus();
										}else 
										{
											
											if (Compara_Menor(ffinC,valor)== false )
								 {
									 alert("Fecha err\xf3nea, No puede ser mayor a la de Termino de Contrato");
								     document.getElementById(id).value=''
								     document.getElementById(id).focus();
								 } 

							}

						}
				}
	}


}
// JavaScript Document