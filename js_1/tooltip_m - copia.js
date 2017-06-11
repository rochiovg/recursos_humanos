  function TOOLTIP() {
//----------------------------------------------------------------------------------------------------
// Configuration
//----------------------------------------------------------------------------------------------------
    //this.width = 80;                     // width (pixels)  deafult 200
    //this.bgColor = '#DBEAF5';             // background color
		this.bgColor = '#ffffff';             // background color
		this.textColor = '#000000';           // text color
    //this.borderColor = '#6699cc';
	this.borderColor = '#A5CFE9';  
	      // border color
	//	this.borderColor = '#FFCC00';         // border color
    this.opacity = 85;                    // opacity (percent) - doesn't work with all browsers  default 50
    this.cursorDistance = -90;              // distance from cursor (pixels)

    // don't change
    this.text = '';
	this.subtext = '';
    this.obj = 0;
    this.sobj = 0;
    this.active = false;

// -------------------------------------------------------------------------------------------------------
// Functions
// -------------------------------------------------------------------------------------------------------
    this.create = function() {
      if(!this.sobj) this.init();
      var t = '<table style="color:#1B4966;font-family:Arial;font-size:11px;" border=0 cellspacing=0 cellpadding=3 width=' + this.width + ' bgcolor=' + this.bgColor + '>' +
              '<tr bgColor=#E9EFF4><td><b>' + this.text + '</b></td></tr>' +
			  '<tr><td>' + this.subtext + '</td></tr></table>';			  
      if(document.layers) {
        t = '<table border=0 cellspacing=0 cellpadding=1><tr><td bgcolor=' + this.borderColor + '>' + t + '</td></tr></table>';
        this.sobj.document.write(t);
        this.sobj.document.close();
      }
      else {
        this.sobj.border = '1px solid ' + this.borderColor;		
        this.setOpacity();
        if(document.getElementById) document.getElementById('ToolTip').innerHTML = t;
        else document.all.ToolTip.innerHTML = t;
      }
      this.show();
    }

    this.init = function() {
      if(document.getElementById) {
        this.obj = document.getElementById('ToolTip');
        this.sobj = this.obj.style;
      }
      else if(document.all) {
        this.obj = document.all.ToolTip;
        this.sobj = this.obj.style;
      }
      else if(document.layers) {
        this.obj = document.ToolTip;
        this.sobj = this.obj;
      }
    }

    this.show = function() {
      var ext = (document.layers ? '' : 'px');
      var left = mouseX-10;

      if(left + this.width + this.cursorDistance > winX) left -= this.width + this.cursorDistance;
      else left += this.cursorDistance;

      this.sobj.left = left + ext;
      this.sobj.top = mouseY + this.cursorDistance + ext;

      if(!this.active) {
        this.sobj.visibility = 'visible';
        this.active = true;
      }
    }

    this.hide = function() {
      if(this.sobj) this.sobj.visibility = 'hidden';
      this.active = false;
    }

    this.setOpacity = function() {
      this.sobj.filter = 'alpha(opacity=' + this.opacity + ')';
      this.sobj.mozOpacity = '.1';
      if(this.obj.filters) this.obj.filters.alpha.opacity = this.opacity;
      if(!document.all && this.sobj.setProperty) this.sobj.setProperty('-moz-opacity', this.opacity / 100, '');
    }
  }

//----------------------------------------------------------------------------------------------------
// Build layer, get mouse coordinates and window width, create tooltip-object
//----------------------------------------------------------------------------------------------------
  var tooltip = mouseX = mouseY = winX = 0;

  if(document.layers) {
    document.write('<layer id="ToolTip"></layer>');
    document.captureEvents(Event.MOUSEMOVE);
  }
  else document.write('<div id="ToolTip" style="position:absolute; z-index:99"></div>');
  document.onmousemove = getMouseXY;

  function getMouseXY(e) {
    if(document.all) {
      mouseX = event.clientX + document.body.scrollLeft;
      mouseY = event.clientY + document.body.scrollTop;
    }
    else {
      mouseX = e.pageX;
      mouseY = e.pageY;
    }
    if(mouseX < 0) mouseX = 0;
    if(mouseY < 0) mouseY = 0;

    if(document.body && document.body.offsetWidth) winX = document.body.offsetWidth - 25;
    else if(window.innerWidth) winX = window.innerWidth - 25;
    else winX = screen.width - 25;

    if(tooltip && tooltip.active) tooltip.show();
  }

function toolTip(text, subtext,width, opacity) {
    if(text) {
      tooltip = new TOOLTIP();
      tooltip.text = text;
	  if(subtext) tooltip.subtext = subtext;
      if(width) tooltip.width = width;
      if(opacity) tooltip.opacity = opacity;
      tooltip.create();
    }
    else if(tooltip) tooltip.hide();
  }
  
  
 // ----- Iluminar Fila --------
 
function uno(src,color_entrada) { 
	src.bgColor=color_entrada;
	//src.style.cursor="hand"; 
}
 
function dos(src,color_default) { 
	src.bgColor=color_default;
	//src.style.cursor="default"; 
} 
