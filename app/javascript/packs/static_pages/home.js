'use strict';

{
  const images = [
    "/assets/static_pages/group1-ed14fc9d343f49922a5eeb11d44629224d4b9bc22b8a686c3deed48433475df7.jpg",
    "/assets/static_pages/group2-20c92d340ea36c8abd3dad3e56b43cb68b0995d82e9d258dfcfcf83d1c96d731.jpg",
    "/assets/static_pages/group3-232ea7cd8d6f0d87a5d1a92c368d9f09380adcbdeb09e58973fae7cd28fcc1ee.jpg",
    "/assets/static_pages/group4-1ed76fa9c27b5b4fc24949929f53482f6db9009f5e1ec51ba505da57fe34a0da.jpg",
    "/assets/static_pages/group5-a6e827dee950a4ce3462ca7e9c39ccb29be6140a414a6c348e5f6675def9ffc6.jpg",
    "/assets/static_pages/group6-9c98589bfcf0be19f09981d3cefc46089ae25a0bf1a4f2be4384a5d6392049d6.jpg"
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