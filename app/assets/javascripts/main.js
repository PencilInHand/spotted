$(document).ready(function() {
	var sb = $('.side-bar');
	var sb_button = $('#side-bar-toggle');

	sb_button.click(function() {
		if (sb.css('right') === '-700px') {
			sb.animate({'right': '0px'}, 200);
		} else {
			sb.animate({'right': '-700px'}, 200);
		}
	});

	$('.page-wrapper').click(function() {
		if (sb.css('right') === '0px') {
			sb.animate({'right': '-700px'}, 200);
		}
	});
});
