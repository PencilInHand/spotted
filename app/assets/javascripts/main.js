$(document).ready(function() {
	$('#side-bar-toggle').click(function() {
		if ($('.side-bar').css('left') === '-300px') {
			$('.side-bar').animate({'left': '0px'}, 200);
		} else {
			$('.side-bar').animate({'left': '-300px'}, 200);
		}
	});

	$('.page-wrapper').click(function() {
		if ($('.side-bar').css('left') === '0px') {
			$('.side-bar').animate({'left': '-300px'}, 200);
		}
	});

	$('.side-bar-register-button').click(function() {
		if ($('.side-bar-register-button').text() === 'Register') {
			$('.side-bar-register-button').text('Sign Up');
			$('.register-question').text('Already a member?');
			$('.side-bar-sign-in').animate({'height': '0px'}, 200);
			$('.side-bar-register').animate({'height': '100%'}, 200);
		} else {
			$('.side-bar-register-button').text('Register')
			$('.register-question').text('Not a member yet?');
			$('.side-bar-sign-in').animate({'height': '100%'}, 200);
			$('.side-bar-register').animate({'height': '0px'}, 200);
		}
	});
});
