function buscarMapa(){
	ccdd=getValor("cmbDpto");
	ccpp=getValor("cmbProv");
	ccdi=getValor("cmbDist");
	var maxVar = 1; // Máximo numero de variables a seleccionar (n ubigeos; n>1)
	var ubigeo="";
	if(ubigeoValido(ccdd)){
		ubigeo=ccdd;
	}
	if(ubigeoValido(ccpp)){
		ubigeo=ccpp;
		if(ccpp=='00'){
			if(ccdd=='00'){ubigeo='0000';}
			else{ubigeo=ccdd+'00';}
		}
	}
	if(ubigeoValido(ccdi)){
		ubigeo=ccdi;
		if(ccdi=='00'){
			if(ccpp!='00'){ubigeo=ccpp+'00';}
			else if(ccdd!='00'){ubigeo=ccdd+'0000';}
			else{ubigeo='000000';}
		}
	}
	/*arrCol = seleccionColumnas();
	var cadCol = "";
	if (arrCol.length>0){
		cadCol = arrCol[0];
	}
	for(j=1;j<arrCol.length;j++){
		cadCol += "|" + arrCol[j];
	}
	// Proyecto y año seleccionado
	if( arrCol.length>maxVar && (ccdd=='00' || ccpp=='00' || ccdi=='00') ){
		alert("Seleccionar como máximo "+maxVar+" variable.");
	}else if(arrCol.length==0){
		alert("Seleccione como mínimo una variable.");
	}else{
		var anio = arrGlobal[getValor('txtProyecto')]['anio']; // Año del ubigeo
		abrirMapa(getValor('txtProyecto'),anio,ubigeo,cadCol);
	}*/
	if(globalCuadro==''){ // Seleccion de Cuadro
		alert("Seleccione cuadro");
	}else{
		//abrirMapa(getValor('txtProyecto'),globalCuadro,ubigeo);
		tituloMapaServ(getValor('txtProyecto'),globalCuadro,ubigeo);
	}
}

function tituloMapaServ(proy,cuadro,ubigeo){
	ajax=http_request();	
	var valores;
	url="TituloCuadro.asp";
	valores="proy="+proy+"&cuadro="+cuadro+"&ubigeo="+ubigeo+"&titulo=mapa";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
		 	getCampo("divPrincipal").innerHTML="Cargando ...";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					getCampo("titTabla").innerHTML = ajax.responseText;
					abrirMapa(proy,cuadro,ubigeo);
            }
            else if(ajax.status==404){
				getCampo("divPrincipal").innerHTML="Servicio no disponible temporalmente.";
            }
            else{
				//getCampo("divPrincipal").innerHTML="Datos no disponibles temporalmente.";				
				getCampo("divPrincipal").innerHTML=ajax.responseText;				
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;
}

function abrirMapa(proy,cuadro,ubigeo){
	ajax=http_request();	
	var valores;
	url="Mapa/Mapa.asp";
	valores="proy="+proy+"&ubigeo="+ubigeo+"&cuadro="+cuadro;
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
		 	getCampo("divPrincipal").innerHTML="Cargando ...";       
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					//tituloTabla(getValor('txtProyecto'));
					//getCampo('aTodos').innerHTML="";
					getCampo("divPrincipal").innerHTML=ajax.responseText;					
            }
            else if(ajax.status==404){
				getCampo("divPrincipal").innerHTML="Servicio no disponible temporalmente.";
            }
            else{
				//getCampo("divPrincipal").innerHTML="Datos no disponibles temporalmente.";
				getCampo("divPrincipal").innerHTML=ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;
}
