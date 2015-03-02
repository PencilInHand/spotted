$(document).ready(function() {
  $('#side-bar-toggle').click(function() {
    console.log($('.side-bar').css('left'));
    if ($('.side-bar').css('left') === '-200px') {
      $('.side-bar').animate({'left': '0px'}, 200);
      $('.page-wrapper').animate({'left': '200px'}, 200);
    } else {
      $('.side-bar').animate({'left': '-200px'}, 200);
      $('.page-wrapper').animate({'left': '0px'}, 200);
    }
  });

  // $('.page-wrapper').click(function() {
  //   $('.side-bar').animate({'left': '-300px'}, 200);
  //   $('.page-wrapper').animate({'left': '0px'}, 200);
  // });
});
