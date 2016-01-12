$(document).on("page:change", function(){

	function geoSuccess(position) {
		var range = $('#range').val();
		var lat = position.coords.latitude;
		var lon = position.coords.longitude;
		
		$('.js-latitude').val(lat);
		$('.js-longitude').val(lon);
		$.ajax({
			url:'/search',
			type: 'GET',
			dataType: 'script',
			data: {
				latitude: lat,
				longitude: lon,
				range: range
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


	$('.js-getlocation').on('click', function(event) {
		event.preventDefault();
		getLocation();
		alert("al momento de guardar el post , su ubicacion sera guardada");
	});

	$('#search_id').on('click', function(event) {
		event.preventDefault();
		getLocation();
		
	});
});

$(document).on('page:change', function() {
	var range = $('#range');
	$('#km').text(range.val()+" km");
	range.change(function(event) {
		$('#km').text(range.val()+" km");
	});
});
