var nav4 = window.Event ? true : false;

function acceptNum(evt){
	var key = nav4 ? evt.which : evt.keyCode; 
	return (key <= 13 || (key >= 48 && key <= 57));
}

function alfabeto(e){
	tecla = (document.all) ? e.keyCode : e.which; 
	if (tecla==8) return true; 
	patron =/[A-Za-z]|\Ñ|\Ñ/; 
	te = String.fromCharCode(tecla); 
	return patron.test(te); 
}

function alfabetoNombre(e){
	tecla = (document.all) ? e.keyCode : e.which; 
	if (tecla==8) return true; 
	patron =/[A-Za-z]|\Ñ|\Ñ|\s/; 
	te = String.fromCharCode(tecla); 
	return patron.test(te); 
}
function numero(e){
	tecla = (document.all) ? e.keyCode : e.which; 
	if (tecla==8) return true; 
	patron =/[0-9]/; 
	te = String.fromCharCode(tecla); 
	return patron.test(te); 
}

function acceptLiteral(obj){ 		
	patron = /([^A-ZÑa-zñ|\s])|([BCDFGHJKLMNÑPQRSTVWXYZ]{5})|([AEIOU]{4})|([A]{3}|[B]{3}|[C]{3}|[D]{3}|[E]{3}|[F]{3}|[G]{3}|[H]{3}|[I]{4}|[J]{3}|[K]{3}|[L]{3}|[M]{3}|[N]{3}|[Ñ]{3}|[O]{3}|[P]{3}|[Q]{3}|[R]{3}|[S]{3}|[T]{3}|[U]{3}|[V]{3}|[W]{3}|[X]{3}|[Y]{3}|[Z]{3})/
	if( patron.test( (obj.value).toUpperCase() ) ){
		alert("Nombre inválido");
		obj.focus();
		obj.select();
	}  

}
function acceptLiteralPat(obj){ 		
	patron = /([^A-ZÑa-zñ|\s])|([BCDFGHJKLMNÑPQRSTVWXYZ]{5})|([AEIOU]{4})|([A]{3}|[B]{3}|[C]{3}|[D]{3}|[E]{3}|[F]{3}|[G]{3}|[H]{3}|[I]{4}|[J]{3}|[K]{3}|[L]{3}|[M]{3}|[N]{3}|[Ñ]{3}|[O]{3}|[P]{3}|[Q]{3}|[R]{3}|[S]{3}|[T]{3}|[U]{3}|[V]{3}|[W]{3}|[X]{3}|[Y]{3}|[Z]{3})/
	if( patron.test( (obj.value).toUpperCase() ) ){
		alert("Apellido Paterno inválido");
		obj.focus();
		obj.select();
	}  
}
function acceptLiteralMat(obj){ 		
	patron = /([^A-ZÑa-zñ|\s])|([BCDFGHJKLMNÑPQRSTVWXYZ]{5})|([AEIOU]{4})|([A]{3}|[B]{3}|[C]{3}|[D]{3}|[E]{3}|[F]{3}|[G]{3}|[H]{3}|[I]{4}|[J]{3}|[K]{3}|[L]{3}|[M]{3}|[N]{3}|[Ñ]{3}|[O]{3}|[P]{3}|[Q]{3}|[R]{3}|[S]{3}|[T]{3}|[U]{3}|[V]{3}|[W]{3}|[X]{3}|[Y]{3}|[Z]{3})/
	if( patron.test( (obj.value).toUpperCase() ) ){
		alert("Apellido Materno inválido");
		obj.focus();
		obj.select();
	}  
}

function acceptEconomia(obj){ 		
	patron = /([^A-ZÑa-zñ|\s])|([BCDFGHJKLMNÑPQRSTVWXYZ]{5})|([AEIOU]{4})|([A]{3}|[B]{3}|[C]{3}|[D]{3}|[E]{3}|[F]{3}|[G]{3}|[H]{3}|[I]{4}|[J]{3}|[K]{3}|[L]{3}|[M]{3}|[N]{3}|[Ñ]{3}|[O]{3}|[P]{3}|[Q]{3}|[R]{3}|[S]{3}|[T]{3}|[U]{3}|[V]{3}|[W]{3}|[X]{3}|[Y]{3}|[Z]{3})/
	if( patron.test( (obj.value).toUpperCase() ) ){
		alert("Otro Curso de Economía inválido");
		obj.focus();
		obj.select();
	}  

}

function acceptEstadistica(obj){ 		
	patron = /([^A-ZÑa-zñ|\s])|([BCDFGHJKLMNÑPQRSTVWXYZ]{5})|([AEIOU]{4})|([A]{3}|[B]{3}|[C]{3}|[D]{3}|[E]{3}|[F]{3}|[G]{3}|[H]{3}|[I]{4}|[J]{3}|[K]{3}|[L]{3}|[M]{3}|[N]{3}|[Ñ]{3}|[O]{3}|[P]{3}|[Q]{3}|[R]{3}|[S]{3}|[T]{3}|[U]{3}|[V]{3}|[W]{3}|[X]{3}|[Y]{3}|[Z]{3})/
	if( patron.test( (obj.value).toUpperCase() ) ){
		alert("Otro Curso de Estadística inválido");
		obj.focus();
		obj.select();
	}  

}

function acceptSwEstadistico(obj){ 		
	patron = /([^A-ZÑa-zñ|\s])|([BCDFGHJKLMNÑPQRSTVWXYZ]{5})|([AEIOU]{4})|([A]{3}|[B]{3}|[C]{3}|[D]{3}|[E]{3}|[F]{3}|[G]{3}|[H]{3}|[I]{4}|[J]{3}|[K]{3}|[L]{3}|[M]{3}|[N]{3}|[Ñ]{3}|[O]{3}|[P]{3}|[Q]{3}|[R]{3}|[S]{3}|[T]{3}|[U]{3}|[V]{3}|[W]{3}|[X]{3}|[Y]{3}|[Z]{3})/
	if( patron.test( (obj.value).toUpperCase() ) ){
		alert("Otro Curso de Software Estadístico inválido");
		obj.focus();
		obj.select();
	}  

}

function acceptInformatica(obj){ 		
	patron = /([^A-ZÑa-zñ|\s])|([BCDFGHJKLMNÑPQRSTVWXYZ]{5})|([AEIOU]{4})|([A]{3}|[B]{3}|[C]{3}|[D]{3}|[E]{3}|[F]{3}|[G]{3}|[H]{3}|[I]{4}|[J]{3}|[K]{3}|[L]{3}|[M]{3}|[N]{3}|[Ñ]{3}|[O]{3}|[P]{3}|[Q]{3}|[R]{3}|[S]{3}|[T]{3}|[U]{3}|[V]{3}|[W]{3}|[X]{3}|[Y]{3}|[Z]{3})/
	if( patron.test( (obj.value).toUpperCase() ) ){
		alert("Otro Curso de Informática inválido");
		obj.focus();
		obj.select();
	}  

}

function acceptNumTabla(evt){ 
	var key = nav4 ? evt.which : evt.keyCode; 
	return (key <= 13 || (key >= 48 && key <= 57));
}

function acceptTxt(evt){ 
	var key = nav4 ? evt.which : evt.keyCode; 
	return (key != 34 && key != 39 && key != 60 && key != 62 );
}

function acceptCorreo(obj){ 	
	patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
	if( !patron.test(obj.value) ){
		alert("Correo Electronico invalido");
		obj.focus();
		obj.select();
	}  

}


//-----------------------------------------------------------------------------------------

// Funciones para Ajax
function http_request() {
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function nodoCadena(nodo,nombre){
	try{
		if (nodo==null){
			return "";
		}
		else if(nodo.getElementsByTagName(nombre)==null){
			return "";
		}
		else if(nodo.getElementsByTagName(nombre)[0]==null){
			return "";
		}
		else if(nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue==null){
			return "";
		}
		else{
			return nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue;
		}
	}
	catch(ex){
			return "";
		}
}

function nodoNumerico(nodo,nombre){
	try{
	if(nodo.getElementsByTagName(nombre)==null){
		return 0;
	}
	if(nodo.getElementsByTagName(nombre)[0]==null){
		return 0;
	}
	if(nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue==null){
		return 0;
	}
	else{
		return nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue;
	}
	}catch(e){
		return 0;
	}
}

function nodoCadenaHtml(nodo,nombre){
	try{
		if(nodo.getElementsByTagName(nombre)==null){
			return "&nbsp;";
		}
		if(nodo.getElementsByTagName(nombre)[0]==null){
			return "&nbsp;";
		}
		if(nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue==null){
			return "&nbsp;";
		}
		else{
			return nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue;
		}
	}
	catch(ex){
			return "&nbsp;";
	}
}

function nodoNumericoHtml(){
	
}

function nodoValor(nodo,pos){
	try{
		return nodo[pos].firstChild.nodeValue;
	}catch(e){
		return "&nbsp;";
	}
}

// Get, Set de valores

function getCampo(id){
	return document.getElementById(id);
}

function getValor(id){
	return document.getElementById(id).value;
}

function setValor(id,valor){
	document.getElementById(id).value = valor;
}

function textoCmb(id){
	cmb = getCampo(id);
	txt=cmb.options[cmb.selectedIndex].text;
	return txt;
}

function seleccionCmbValor(idCmb,valor){
	var cmb = getCampo(idCmb);
	for(var i=0;i<cmb.options.length;i++){
		if (cmb.options[i].value == valor){
			cmb.selectedIndex=i;
			continue;
		}
	}
}

function eliminarElementoCmb(idCmb,valor){
	var cmb = getCampo(idCmb);
	for(var i=0;i<cmb.options.length;i++){
		if (cmb.options[i].value == valor){
			cmb.remove(i);
			break;
		}
	}
}

function agregarElementoCmb(idCmb,pos,valor,texto){
	var cmb = getCampo(idCmb);
	cmb.add(new Option(texto,valor),pos);
}

// -----------------  Operacion con cadenas  ---------------------
function Trim(s){
	// Quita los espacios del principio y del final
	return LTrim(RTrim(s));
}

function LTrim(s){
	// Devuelve una cadena sin los espacios del principio
	var i=0;
	var j=0;	
	// Busca el primer caracter <> de un espacio
	for(i=0; i<=s.length-1; i++){
		if(s.substring(i,i+1) != ' '){
			j=i;
			break;
		}
	}
	return s.substring(j, s.length);
}

function RTrim(s){
	// Quita los espacios en blanco del final de la cadena
	var j=0;	
	// Busca el último caracter <> de un espacio
	for(var i=s.length-1; i>-1; i--){
		if(s.substring(i,i+1) != ' '){
			j=i;
			break;
		}
	}
	return s.substring(0, j+1);
}

