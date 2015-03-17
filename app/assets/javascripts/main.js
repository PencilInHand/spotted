$(document).ready(function() {

  var sb = $('.side-bar');
  var sb_button = $('#side-bar-toggle');
	var log_reg_swap = $('#log-in-register-swap');
	var sb_log_in = $('.side-bar-log-in');
	var sb_register = $('.side-bar-register');

  sb_button.click(function() {
    if (sb.css('right') === '-600px') {
      sb.animate({'right': '0px'}, 200);
    } else {
      sb.animate({'right': '-600px'}, 200);
    }
  });

  $('.page-wrapper').click(function() {
    if (sb.css('right') === '0px') {
      sb.animate({'right': '-600px'}, 200);
    }
  });

	log_reg_swap.click(function() {
		if (log_reg_swap.text() === 'Not a member yet?') {
			log_reg_swap.text('Already a member?');
			sb_log_in.animate({'width': '0px'}, 300, function() {
				sb_register.animate({'width': '50%'}, 300);
			});
		} else {
			log_reg_swap.text('Not a member yet?');
			sb_register.animate({'width': '0px'}, 300, function() {
				sb_log_in.animate({'width': '50%'}, 300);
			});
		}
	});
});
