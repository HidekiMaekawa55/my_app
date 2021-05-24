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
      centerPadding: '30%',
      pauseOnFocus: false,
      pauseOnHover: false,
      responsive: [
        {
          breakpoint: 1600,
          settings: {
            // centerMode: false,
            centerPadding: '25%'
          }
        },
        {
          breakpoint: 1200,
          settings: {
            // centerMode: false,
            centerPadding: '20%'
          }
        },
        {
          breakpoint: 800,
          settings: {
            centerPadding: '15%'
          }
        },
        {
          breakpoint: 600,
          settings: {
            centerMode: false,
            dots: false,
          }
        },
      ]
    });
  }); 
}