$(document).ready(function() {
  $('#side-bar-toggle').click(function() {
    if ($('.side-bar').css('left') === '-200px') {
      $('.side-bar').animate({'left': '0px'}, 200);
      $('.page-wrapper').animate({'left': '200px'}, 200);
    } else {
      $('.side-bar').animate({'left': '-200px'}, 200);
      $('.page-wrapper').animate({'left': '0px'}, 200);
    }
  });

  $('.page-wrapper').click(function() {
    if ($('.side-bar').css('left') === '0px') {
      $('.side-bar').animate({'left': '-200px'}, 200);
      $('.page-wrapper').animate({'left': '0px'}, 200);
    }
  });
});
