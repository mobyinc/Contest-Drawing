$(document).ready(function($) {
	$.ajaxSetup({
		headers: {
			'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
		}
	});

	$('#draw_button').on('click', function(e) {
		e.preventDefault();

		$.ajax({
			url: '/drawings',
			type: 'POST',
			dataType: 'json'
		}).done(function(data) {
			alert(data.name);
			location.reload();
		})
		.fail(function() {
			alert('unable to draw a winner');
		});
	});
});