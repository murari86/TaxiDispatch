/* ================================================ */
/* This JS was made for demo purposes and need to keep right markups for all edynamic elements */
/* ================================================ */

$(document).ready( function() {

	/* ================================================ */
	/* Data Table jQuery plugin init */
	/* ================================================ */

	$("#show_minor_contact").click(function() {
  		$('#minor_contact').slideToggle('400', function() {
  		});
  		return false
	});

	$("#show_another_vehicle").click(function() {
  		$('#another_vehicle').slideToggle('400', function() {
  		});
  		return false
	});


	$("#show_add_via").click(function() {
  		$('#add_via').slideToggle('400', function() {
  		});
  		return false
	});

		/* Booking History Table */

  	var oTableBoookingHistory = $('#booking_history').dataTable( {
	  	"sDom": 'rt<"table_pagination fl-r clearfix"<"fl-l"i><"fl-l"p>>',
	  	"bSort": false,
	  	"bPaginate": false,
	  	"bInfo": false,
	  	"sPaginationType": "full_numbers",
	  	"oLanguage": {
	  		"sInfo": "_START_ - _END_ of _TOTAL_ "
	  	},
	    "aoColumnDefs": [
	      	{ "sWidth": "300px", "aTargets": [ 1 ] },
	    	{ "sWidth": "100px", "aTargets": [ 2 ] },
	    	{ "sWidth": "90px", "aTargets": [ 3 ] },
	    	{ "sWidth": "72px", "aTargets": [ 6 ] }
	    ]
  	} );

  	$(".table_filters input").keyup( function () {
	    oTableBoookingHistory.fnFilter( this.value, $(".table_filters input").oTableBoookingHistory);
	});

		/* Receipts Table */

  	var oTableReceipts = $('#receipts').dataTable( {
	  	"sDom": 'rt<"table_pagination fl-r clearfix"<"fl-l"i><"fl-l"p>>',
	  	"bSort": false,
	  	"bPaginate": true,
	  	"bInfo": true,
	  	"sPaginationType": "full_numbers",
	  	"oLanguage": {
	  		"sInfo": "_START_ - _END_ of _TOTAL_ "
	  	},
	    "aoColumnDefs": [
	      	{ "sWidth": "61px", "aTargets": [ 0 ] },
	      	{ "sWidth": "126px", "aTargets": [ 1 ] },
	    	{ "sWidth": "175px", "aTargets": [ 2 ] },
	    	{ "sWidth": "170px", "aTargets": [ 4 ] },
	    	{ "sWidth": "87px", "aTargets": [ 6 ] },
	    	{ "sWidth": "91px", "aTargets": [ 7 ] }
	    ]
  	});

  	/* ================================================ */
  	/* Color Box init */
  	/* ================================================ */


    $('.modal_ajax').colorbox( {
    	"ajax":true,
      	"opacity": 0.4,
      	"initialWidth": 320,
      	"initialHeight": 200,
      	onComplete : function() {

	        $('.btn').click(function () {
				$.fn.colorbox.close();
			});

			$( ".custom_checkbox" ).button({
    			icons: {
        			primary: "ui-icon-check"
    			}
    		});

    		$('.select_menu').selectmenu(); 

    		$.fn.colorbox.resize();            
    	}
    });


    /* ================================================ */
  	/* Spinner jQ UI */
  	/* ================================================ */

    $('.spinner').spinner({ 
	    min: 0,
	    max: 100
	});

    	/* Spinner with text suffix */

    $( "#bags" ).addClass("hidden").spinner({ 
	    min: 0,
	    max: 10,
	    spin: function() {
	        $(this).siblings('.bags-spinner-text').val($(this).val()+' Bags');
	    },
	    stop: function() {
	        $(this).siblings('.bags-spinner-text').val($(this).val()+' Bags');
	    }
 	}).parent().append('<input class="bags-spinner-text" type="text" value="0 Bags">');

	$('.bags-spinner-text').each(parseValueBags);

	$('.bags-spinner-text').change(function() {
		$(this).siblings('"#bags').val(parseInt($(this).val()));
	});

	$('.bags-spinner-text').blur(parseValueBags);

	function parseValueBags() {
	    $(this).val($(this).siblings('#bags').val()+' Bags');
	}

	$( "#passenter" ).addClass("hidden").spinner({ 
	    min: 0,
	    max: 10,
	    spin: function() {
	        $(this).siblings('.passenter-spinner-text').val($(this).val()+' Passenter');
	    },
	    stop: function() {
	        $(this).siblings('.passenter-spinner-text').val($(this).val()+' Passenter');
	    }
 	}).parent().append('<input class="passenter-spinner-text" type="text" value="0 Passenter">');

	$('.passenter-spinner-text').each(parseValuePassenter);

	$('.passenter-spinner-text').change(function() {
		$(this).siblings('"#passenter').val(parseInt($(this).val()));
	});

	$('.passenter-spinner-text').blur(parseValuePassenter);

	function parseValuePassenter() {
		$(this).val($(this).siblings('#passenter').val()+' Passenter');
	}


		/* Time spinner */

	$.widget( "ui.timespinner", $.ui.spinner, {
	    options: {
	    	// seconds
	    	step: 900 * 1000,
	    	// hours
	    	page: 60
	    },
	 
	    _parse: function( value ) {
	    	if ( typeof value === "string" ) {
	    	// already a timestamp
	    		if ( Number( value ) == value ) {
	        		return Number( value );
	        	}
	        	return +Globalize.parseDate( value );
	    	}
	    	return value;
	    },
	 
	    _format: function( value ) {
	    	return Globalize.format( new Date(value), "t" );
	    }

	});

	$(function() {
	    $( ".timespinner" ).timespinner();
	});

	/* ================================================ */
  	/* Select Menu jQ UI */
  	/* ================================================ */

  	$('.select_menu').selectmenu();

  	/* ================================================ */
  	/* Checkbox jQ UI */
  	/* ================================================ */

	$( ".custom_checkbox" ).button({
    	icons: {
        	primary: "ui-icon-check"
    	}
    });

	/* ================================================ */
  	/* Radio Menu jQ UI */
  	/* ================================================ */

    $( ".custom_radio" ).button({
    	icons: {
        	primary: "ui-icon-radio-on"
    	}
    });

    /* ================================================ */
  	/* Datapicker Menu jQ UI */
  	/* ================================================ */

  	$( ".datepicker" ).datepicker({
  		dateFormat : "dd/mm/yy"
  	});

});


/* ================================================ */
/* Google Map Test Init */
/* ================================================ */

var map;
function initialize() {

  var locationTest = new google.maps.LatLng(-34.368900, 150.91665);
 
  var mapOptions1 = {
    zoom: 16,
    center: locationTest,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions1);

  var image = 'assets/img/ico/map/ico_location_mark.png';
  
  var marker = new google.maps.Marker({
      position: locationTest,
      map: map,
      title:"Location Test",
      icon: image
   	});

}

var mapTwoPoint;
function initializeTwoPoint() {

  var locationStart = new google.maps.LatLng(-34.368900, 150.91965);
  var locationFinish = new google.maps.LatLng(-34.367900, 150.91665);
 
  var mapOptions = {
    zoom: 15,
    center: locationStart,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

   mapTwoPoint = new google.maps.Map(document.getElementById('map-canvas-twopoint'),
      mapOptions);
  
  var marker = new google.maps.Marker({
      position: locationStart,
      map:  mapTwoPoint,
      title:"Location Start",
      icon: 'assets/img/ico/map/ico_location_mark_a.png'
   	});

   var marker = new google.maps.Marker({
      position: locationFinish,
      map:  mapTwoPoint,
      title:"Location Finish",
      icon: 'assets/img/ico/map/ico_location_mark_b.png'
   	});

}

google.maps.event.addDomListener(window, 'load', initialize); 
google.maps.event.addDomListener(window, 'load', initializeTwoPoint); 
