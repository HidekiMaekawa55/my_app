'use strict';

{
  const images = [
    "assets/static_pages/group1.jpg",
    "assets/static_pages/group2.jpg",
    "assets/static_pages/group3.jpg",
    "assets/static_pages/group4.jpg",
    "assets/static_pages/group5.jpg",
    "assets/static_pages/group6.jpg"
  ];
  let currentIndex = 0;

  const mainImage = document.getElementById('main');
  mainImage.src = images[currentIndex];
  
  images.forEach((image, index) => {
    const img = document.createElement('img');
    img.src = image;
    
    const li = document.createElement('li');
    if (index === currentIndex) {
      li.classList.add('current');
    }
    li.addEventListener('click', () => {
      mainImage.src = image;
      const thumbnails = document.querySelectorAll('.thumbnails > li');
      thumbnails[currentIndex].classList.remove('current');
      currentIndex = index;
      thumbnails[currentIndex].classList.add('current');
    });
    
    li.appendChild(img);
    
    document.querySelector('.thumbnails').appendChild(li);
  });
  
  function playSlideshow() {
    setTimeout(() => {
      let target = currentIndex + 1;
      if (target === images.length) {
        target = 0;
      }
      document.querySelectorAll('.thumbnails > li')[target].click();
      playSlideshow();
    }, 5000);
  }
  
  setTimeout(playSlideshow, 5000);
}