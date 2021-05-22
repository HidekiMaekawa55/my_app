'use strict';

{
  document.addEventListener("turbolinks:load", function() {
    $('.mypattern').slick({
      autoplay: true,
      autoplaySpeed: 2500,
      speed: 800,
      dots: true,
      arrows: false,
      centerMode: true,
      centerPadding: '20%',
      pauseOnFocus: false,
      pauseOnHover: false,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            centerMode: false,
            arrows: false,
          }
        },
        {
          breakpoint: 600,
          settings: {
            arrows: false,
            dots: false,
          }
        },
      ]
    });
  }); 
}