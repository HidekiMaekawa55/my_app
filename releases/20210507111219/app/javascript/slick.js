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
    });
  }); 
}