$( "document" ).ready( function() {
	var $mainSidebar = $( "#sidebar-main" );

	$mainSidebar.simplerSidebar( {
		align: "left",
		attr: "sidebar-main",
		/*esto determina cuanto ah de bajar el sidebar*/
		top: 125,
		selectors: {
			trigger: "#sidebar-main-trigger",
			quitter: ".quitter"
		},
		animation: {
			easing: "easeOutQuint"
		}
	} );
} );
