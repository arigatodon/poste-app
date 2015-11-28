$(document).on("page:change", function(){

	function geoSuccess(position) {
		var lat = position.coords.latitude;
		var lon = position.coords.longitude;

		$('.js-latitude').val(lat);
		$('.js-longitude').val(lon);

		$.ajax({
			url:'/get_address',
			type: 'GET',
			dataType: 'script',
			data: {
				latitude: lat,
				longitude: lon,
			}
		});
	}
	function geoError(error){
		alert('Intentalo de nuevo mas tarde!');
	}

	function getLocation(){
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
		}
		else{
			alert('Geolocation is not supported by this browser, use Chrome, Firefox or Safari');
		}
	}

	if($('.registrations.new').length > 0) {
		getLocation();
	}

	$('.js-getlocation').on('click', function(event) {
		event.preventDefault();
		getLocation();
		alert("al momento de guardar el post , su ubicacion sera guardada");
	});





	});

jQuery(document).ready(function($) {
	  var range= $('#range');
	  $('#km').text(range.val()+"km");
    range.change(function(event) {
    	$('#km').text(range.val()+"km");

    });
});